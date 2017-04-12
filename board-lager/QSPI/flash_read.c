#include <stdio.h>					
#include <stdarg.h>					
#include <string.h>					
#include <stdlib.h>					
#include <stdint.h>					
#include <sys/types.h>					
#include <sys/stat.h>					
#include <sys/ioctl.h>					
#include <fcntl.h>					
#include <unistd.h>					
#include <mtd/mtd-user.h>					
#include <getopt.h>					
					
typedef int bool;					
#define true 1					
#define false 0					
					
#define EXIT_FAILURE 1					
#define EXIT_SUCCESS 0					
					
/* for debugging purposes only */					
#ifdef DEBUG					
#undef DEBUG					
#define DEBUG(fmt,args...) { log_printf (LOG_ERROR,"%d: ",__LINE__); log_printf (LOG_ERROR,fmt,## args); }					
#else					
#undef DEBUG					
#define DEBUG(fmt,args...)					
#endif					
					
#define KB(x) ((x) / 1024)					
#define PERCENTAGE(x,total) (((x) * 100) / (total))					
					
/* size of read/write buffer */					
#define BUFSIZE (10 * 1024)					
					
/* cmd-line flags */					
#define FLAG_NONE		0x00			
#define FLAG_VERBOSE	0x01				
#define FLAG_HELP		0x02			
#define FLAG_FILESIZE	0x04				
#define FLAG_DEVICE		0x08			
					
/* error levels */					
#define LOG_NORMAL	1				
#define LOG_ERROR	2				
					
static void log_printf (int level,const char *fmt, ...)					
{					
	FILE *fp = level == LOG_NORMAL ? stdout : stderr;				
	va_list ap;				
	va_start (ap,fmt);				
	vfprintf (fp,fmt,ap);				
	va_end (ap);				
	fflush (fp);				
}					
					
static void showusage(bool error)					
{					
/*	int level = error ? LOG_ERROR : LOG_NORMAL;				
					
	log_printf (level,				
			\n		
			Flash Read\n		
			\n		
			usage: %1$s [ -v | --verbose ] <size> <device>\n		
			%1$s -h | --help\n		
			\n		
			-h | --help      Show this help message\n		
			-v | --verbose   Show progress reports\n		
			<size>           Data size which you want to read from flash\n		
			<device>         Flash device to read from (e.g. /dev/mtd0, /dev/mtd1, etc.)\n		
			\n,		
			PROGRAM_NAME);		
					
	exit (error ? EXIT_FAILURE : EXIT_SUCCESS);				
*/
}					
					
static int safe_open (const char *pathname,int flags)					
{					
	int fd;				
					
	fd = open (pathname,flags);				
	if (fd < 0){				
		log_printf (LOG_ERROR,"While trying to open %s",pathname);			
		if (flags & O_RDWR)			
			log_printf (LOG_ERROR," for read/write access");		
		else if (flags & O_RDONLY)			
			log_printf (LOG_ERROR," for read access");		
		else if (flags & O_WRONLY)			
			log_printf (LOG_ERROR," for write access");		
		log_printf (LOG_ERROR,": %m\n");			
		exit (EXIT_FAILURE);			
	}				
					
	return (fd);				
}					
					
static void safe_read (int fd,const char *filename,void *buf,size_t count,bool verbose)					
{					
	ssize_t result;				
					
	result = read (fd,buf,count);				
	if (count != result){				
		if (verbose) log_printf (LOG_NORMAL,"\n");			
		if (result < 0){			
			log_printf (LOG_ERROR,"While reading data from %s: %m\n",filename);		
			exit (EXIT_FAILURE);		
		}			
		log_printf (LOG_ERROR,"Short read count returned while reading from %s\n",filename);			
		exit (EXIT_FAILURE);			
	}				
}					
					
/******************************************************************************/					
static int dev_fd = -1;					
					
static void cleanup (void)					
{					
	if (dev_fd > 0) close (dev_fd);				
}					
					
int main (int argc,char *argv[])					
{					
	const char *device = NULL;				
	int i,flags = FLAG_NONE;				
	unsigned int datasize;				
	size_t size,written;				
	struct mtd_info_user mtd;				
	unsigned char src[BUFSIZE];				
					
	/*********************				
	* parse cmd-line				
	*****************/				
					
	for (;;) {				
		int option_index = 0;			
		static const char *short_options = "hv";			
		static const struct option long_options[] = {			
			{"help", no_argument, 0, 'h'},		
			{"verbose", no_argument, 0, 'v'},		
			{0, 0, 0, 0},		
		};			
					
		int c = getopt_long(argc, argv, short_options,			
				long_options, &option_index);	
		if (c == EOF){			
			break;		
		}			
					
		switch (c) {			
			case 'h':		
				flags |= FLAG_HELP;	
				DEBUG("Got FLAG_HELP\n");	
				break;	
			case 'v':		
				flags |= FLAG_VERBOSE;	
				DEBUG("Got FLAG_VERBOSE\n");	
				break;	
			default:		
				DEBUG("Unknown parameter: %s\n",argv[option_index]);	
				showusage(true);	
		}			
	}				
	if (optind+2 == argc){				
		flags |= FLAG_FILESIZE;			
		datasize = atoi(argv[optind]);			
		DEBUG("Got datasize: %\n",datasize);			
					
		flags |= FLAG_DEVICE;			
		device = argv[optind+1];			
		DEBUG("Got device: %s\n",device);			
	}				
					
	if (flags & FLAG_HELP || device == NULL)				
		showusage(flags != FLAG_HELP);			
					
	atexit (cleanup);				
					
	/* get some info about the flash device */				
	dev_fd = safe_open (device,O_SYNC | O_RDWR);				
	if (ioctl (dev_fd,MEMGETINFO,&mtd) < 0){				
		DEBUG("ioctl(): %m\n");			
		log_printf (LOG_ERROR,"This doesn't seem to be a valid MTD flash device!\n");			
		exit (EXIT_FAILURE);			
	}				
					
	/* does data size fit into the device/partition? */				
	if (datasize > mtd.size){				
		log_printf (LOG_ERROR,"%d bytes won't fit into %s!\n",datasize,device);			
		exit (EXIT_FAILURE);			
	}				
					
	/*********************************				
	* read the entire data to flash *				
	*********************************/				
					
	if (flags & FLAG_VERBOSE)				
		log_printf (LOG_NORMAL,"Reading data: 0k/%luk (0%%)",KB (datasize));			
	size = datasize;				
	i = BUFSIZE;				
	written = 0;				
	while (size)				
	{				
		if (size < BUFSIZE) i = size;			
		if (flags & FLAG_VERBOSE)			
			log_printf (LOG_NORMAL,"\rReading data: %dk/%luk (%lu%%)",		
					KB (written + i),
					KB (datasize),
					PERCENTAGE (written + i,datasize));
					
		/* read from device */			
		safe_read (dev_fd,device,src,i,flags & FLAG_VERBOSE);			
					
		written += i;			
		size -= i;			
	}				
					
	if (flags & FLAG_VERBOSE)				
		log_printf (LOG_NORMAL,			
				"\rReading data: %luk/%luk (100%%)\n",	
				KB (datasize),	
				KB (datasize));	
	DEBUG("Read %d / %luk bytes\n",written,datasize);				
					
	exit (EXIT_SUCCESS);				
}					
