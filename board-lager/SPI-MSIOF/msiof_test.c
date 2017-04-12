/******************************************************************************
* FILENAME  : msiof_test.c
* PURPOSE   : MSIOF device driver for R-car H2 test program.
* AUTHOR    : RENESAS Solutions Corporation
* DATE      : 21 May. 2013
* HISTORY   : 2013.05.21  Rev.0.1   1st revision
******************************************************************************/

/*****************************************************************************/
/* INCLUDE FILES          */
/*****************************************************************************/
#include <stdint.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/spi/spidev.h>

/*****************************************************************************/
/* MACRO/DEFINES          */
/*****************************************************************************/

/*****************************************************************************/
/* LOCAL TYPES          */
/*****************************************************************************/

/*****************************************************************************/
/* VARIABLES          */
/*****************************************************************************/
static const char *device = "/dev/spidev2.0";
static uint8_t bits = 8;
static uint32_t speed = 4000000;
static uint16_t delay = 1;
static uint8_t mode = SPI_MODE_3;

/*****************************************************************************/
/* FORWARD DECLRATIONS          */
/*****************************************************************************/

/*****************************************************************************/
/* PRIVATE FUNCTIONS          */
/*****************************************************************************/
int main(int argc, char *argv[])
{
int ret = 0;
int fd;
uint8_t tx[10];
uint8_t rx[10];
struct spi_ioc_transfer tr;

printf("*************** MSIOF Unit Test Start *****************\n");

/****************************************************************/
/* Open Device File (spidev) */
/****************************************************************/
fd = open(device, O_RDWR);
if( fd < 0 ){
perror("  Cannot Open Device !!\n");
abort();
} else {
  printf("  Device Open Complete.\n");
}

/****************************************************************/
/* R2A11301 Dummy Cycle (0x00 data 4byte transmit) */
/****************************************************************/
printf("  R2A11301FT Dummy Cycle Start\n");

tx[0] = 0x00; /* Dummy Adress */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz = speed;
tr.bits_per_word = bits;

printf("    Start Dummy Cycle No.1-1 Dummy Address (0x00)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("    Cannot Send SPI Message\n");
abort();
}

tx[0] = 0x00; /* Dummy Data */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz = speed;
tr.bits_per_word = bits;

printf("    Start Dummy Cycle No.1-2 Dummy Data (0x00)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("    Cannot Send SPI Message\n");
abort();
}
tx[0] = 0x00; /* Dummy Adress */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz = speed;
tr.bits_per_word = bits;

printf("    Start Dummy Cycle No.2-1 Dummy Address (0x00)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("    Cannot Send SPI Message\n");
abort();
}
tx[0] = 0x00; /* Dummy Data */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz = speed;
tr.bits_per_word = bits;

printf("    Start Dummy Cycle No.2-2 Dummy Data (0x00)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("    Cannot Send SPI Message\n");
abort();
}
for( ret = 0; ret < 100000; ret++ ){
if( ret = 99999 ){
printf("    Dummy Cycle END %d\n", ret);
}
}

/****************************************************************/
/* MSIOF Unit Test No.1 (Version Register Read Check) */
/****************************************************************/
printf("  MSIOF Unit Test No.1 : Version Register Read Check\n");
tx[0] = 0x17; /* Address Register : Read Version */
rx[0] = 0xFF;

tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;

printf("    Start");
printf(" Version Register Read Transfer (Address Transfer)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("    Cannot Send SPI Message\n");
abort();
}

tx[0] = 0x00; /* Dummy Data */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;

printf("    Start Version Register Read Transfer (Data Read)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("    Cannot Send SPI Message\n");
abort();
}
printf("    Read Data (Version Data) = 0x%.2X\n\n", rx[0]);

/****************************************************************/
/* MSIOF Unit Test No.2 (DCDC SW-REG1 Read Check) */
/****************************************************************/
printf("  MSIOF Unit Test No.2 : DCDC SW-REG1 Register Read Check\n");
tx[0] = 0x03; /* Address Register : Read DCDC SW-REG1 */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;

printf("    Start");
printf(" DCDC SW-REG1 Register Read Transfer (Address Transfer)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("        Cannot Send SPI Message\n");
abort();
}

tx[0] = 0x00; /* Dummy Data */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;

printf("    Start DCDC SW-REG1 Register Read Transfer (Data Read)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("        Cannot Send SPI Message\n");
abort();
}
printf("    Read Data (DCDC SW-REG1 Data) = 0x%.2X\n\n", rx[0]);

/****************************************************************/
/* MSIOF Unit Test No.3 (DCDC SW-REG1 Data Write) */
/****************************************************************/
printf("  MSIOF Unit Test No.3 : DCDC SW-REG1 Register Write Check\n");
tx[0] = 0x83; /* Address Register : Write DCDC SW-REG1 */
rx[0] = 0x00;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;

tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;

printf("    Start");
printf(" DCDC SW-REG1 Register Write Transfer (Address Transfer)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("        Cannot Send SPI Message\n");
abort();
}

tx[0] = 0xB0; /* Write Data */
rx[0] = 0x00;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;

printf("    Start");
printf(" DCDC SW-REG1 Register Write Transfer (Data Write)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("        Cannot Send SPI Message\n");
abort();
}
printf("    Write Data (DCDC SW-REG1 Data) = 0xB0\n\n");

/****************************************************************/
/* MSIOF Unit Test No.4 (DCDC SW-REG1 Read Check) */
/****************************************************************/
printf("  MSIOF Unit Test No.4 : DCDC SW-REG1 Register Read Check\n");
tx[0] = 0x03; /* Address Register : Read DCDC SW-REG1 */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;

printf("    Start");
printf(" DCDC SW-REG1 Register Read Transfer (Address Transfer)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("        Cannot Send SPI Message\n");
abort();
}

tx[0] = 0x00; /* Dummy Data */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;

printf("    Start DCDC SW-REG1 Register Read Transfer (Data Read)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("        Cannot Send SPI Message\n");
abort();
}
printf("    Read Data (DCDC SW-REG1 Data) = 0x%.2X\n\n", rx[0]);

/****************************************************************/
/* MSIOF Unit Test No.5 (DCDC SW-REG2 Read Check) */
/****************************************************************/
printf("  MSIOF Unit Test No.5 : DCDC SW-REG2 Register Read Check\n");
tx[0] = 0x04; /* Address Register : Read DCDC SW-REG2 */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;

tr.bits_per_word = bits;

printf("    Start");
printf(" DCDC SW-REG2 Register Read Transfer (Address Transfer)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("        Cannot Send SPI Message\n");
abort();
}

tx[0] = 0x00; /* Dummy Data */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;

printf("    Start DCDC SW-REG2 Register Read Transfer (Data Read)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("        Cannot Send SPI Message\n");
abort();
}
printf("    Read Data (DCDC SW-REG2 Data) = 0x%.2X\n\n", rx[0]);

/****************************************************************/
/* MSIOF Unit Test No.6 (DCDC SW-REG2 Data Write) */
/****************************************************************/
printf("  MSIOF Unit Test No.6 : DCDC SW-REG2 Register Write Check\n");
tx[0] = 0x84; /* Address Register : Write DCDC SW-REG2 */
rx[0] = 0x00;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;

printf("    Start");
printf(" DCDC SW-REG2 Register Write Transfer (Address Transfer)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("        Cannot Send SPI Message\n");
abort();
}

tx[0] = 0xB0; /* Write Data */
rx[0] = 0x00;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;

printf("    Start");
printf(" DCDC SW-REG2 Register Write Transfer (Data Write)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("        Cannot Send SPI Message\n");
abort();
}
printf("    Write Data (DCDC SW-REG2 Data) = 0xB0\n\n");

/****************************************************************/
/* MSIOF Unit Test No.7 (DCDC SW-REG2 Read Check) */
/****************************************************************/
printf("  MSIOF Unit Test No.7 : DCDC SW-REG2 Register Read Check\n");
tx[0] = 0x04; /* Address Register : Read DCDC SW-REG2 */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;


printf("    Start");
printf(" DCDC SW-REG2 Register Read Transfer (Address Transfer)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("        Cannot Send SPI Message\n");
abort();
}

tx[0] = 0x00; /* Dummy Data */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;

printf("    Start DCDC SW-REG2 Register Read Transfer (Data Read)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("        Cannot Send SPI Message\n");
abort();
}
printf("    Read Data (DCDC SW-REG2 Data) = 0x%.2X\n\n", rx[0]);

/****************************************************************/
/* MSIOF Unit Test No.8 (Dummy Register Read Check) */
/****************************************************************/
printf("  MSIOF Unit Test No.8 :");
printf(" Dummy Register Read Check (Negative Check)\n");
tx[0] = 0x00; /* Address Register : Read Dummy */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;

printf("    Start Dummy Register Read Transfer (Address Transfer)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("    Cannot Send SPI Message\n");
abort();
}

tx[0] = 0x00; /* Dummy Data */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;

printf("    Start Dummy Register Read Transfer (Data Read)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("    Cannot Send SPI Message\n");
abort();
}
printf("    Read Data (Dummy Data) = 0x%.2X\n\n", rx[0]);

/****************************************************************/
/* MSIOF Unit Test No.9 (Version Register Write Check) */
/****************************************************************/
printf("  MSIOF Unit Test No.9 :");
printf(" Version Register Write Check (Negative Check)\n");
tx[0] = 0x97; /* Address Register : Write Version */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;

printf("    Start");
printf(" Version Register Write Transfer (Address Transfer)\n");

ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("    Cannot Send SPI Message\n");
abort();
}

tx[0] = 0x00; /* Dummy Data */
rx[0] = 0xFF;
tr.tx_buf = (unsigned long)tx;
tr.rx_buf = (unsigned long)rx;
tr.len  = 1;
tr.delay_usecs = delay;
tr.speed_hz  = speed;
tr.bits_per_word = bits;

printf("    Start Version Register Write Transfer (Data Write)\n");
ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
if( ret < 1 ){
perror("    Cannot Send SPI Message\n");
abort();
}
printf("    Write Data (Version Data) = 0xx00\n\n");

close(fd);

printf("*************** MSIOF Unit Test End *****************\n");

return ret;
}

/*****************************************************************************/
/* PUBLIC FUNCTIONS          */
/*****************************************************************************/

/*****************************************************************************/
/* END OF UNIT          */
/*****************************************************************************/

