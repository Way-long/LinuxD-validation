Renesas BSP drivers test

1.Background:

	Now, Jinzai-solutions can use Shell Scripts to evaluate the Linux functions and performance manually.
	Those shell scripts were mainly designed for LAGER and KOELSCH of GEN2, SALVATOR-X(H3) of GEN3.
	In addition to the board above, this test repo might also can be used for other boards properly, 
	but this can't be ensured.

	Some new tests for different drivers and functions will be added in the future.
	In this page, we mainly talk about the structure of this repo and how to use it.

2.Test environment:

2.1	Run-time env preparation:

	· Tools install: 
	  In order to do those tests properly, we need to install those tools in PCL first before testing.
	· CONFIGs: 
	  We need to check if some CONFIGs were enabled, especially for those tests who have some dependent CONFIGs.

2.2	SSH env preparation:

	· Env on board: SSH server should be installed.
	· Env on PC:    SSH client should be installed.

2.3	About those test scripts:

	We need to install or copy those codes to ROOTFS of the target board.
	Then, we can use SSH or Serial to run those tests from PC side.

2.3.1	File structure of this repo:

	1) Scripts in each folder: used to test each driver. (E.g. USB-HOST, USB-FUNCTION, SDHI, ...)
	   · "0x_index.sh" and "_index.sh": used to test different items at the same time.
	   · "xx_filename.sh": used to test one item.
	   · other .sh files: auxiliary scripts.

	2) Scripts in common: the generic code. (folder named "common")
	3) config.sh: test env configuration file. (E.g. IP addr of the target board or PC)
	4) helper: (file not exist)
	5) Updated_history.txt: (file not exist)

2.4	How to do tests:

	In general, those tests were running on the target board, although we run those scripts from PC side via
	SSH or serial.
	For example, in PC side: 
	  $ cd /tftpf/192.168.1.9/root/Script/SDHI/
	
	Then, we can test those items in the current folder.
	About those scripts in SDHI folder,
	1) 0x_index.sh: used to run all items for SDHI.
	  (file not exist)
	  E.g. ./01_index.sh (Do all SDHI related tests)

	2) _index.sh: In PCL, we can specify which items will be tested.
	  The number of the item we want should be specified in command line as below.
	  E.g. ./_index.sh (do all SDHI related tests at once)
	  E.g. ./_index.sh 10 (10: the No.10 item will be tested)
	  E.g. ./_index.sh 10:20 (In PCL, those items between No.10 and No.20 will be tested)
	  E.g. ./_index.sh 10 13 15 18 (In PCL, the No.10 13 15 18 items will be tested)

	3) the other scripts: test sourcecode for those items.
	  Those scripts can be executed standalone.
	  E.g. ./010_write-RAM-to-SD1_350MB.sh (In PCL, the No.10 item in folder "SDHI" will be tested)

Note:
	
	In the current PCL, those items with gray outputs and not scripted items are not supported.
	For USB-HOST and Display-Unit, we need to insert those necessary devices and cable before testing.

