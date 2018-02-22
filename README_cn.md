1.背景：
	
	现在，Jinzai-Solution可以使用一些Shell Scripts并配合手动的方式来进行Linux功能和性能的评价。
	那些Shell Scripts主要面向的是GEN2的LAGER和KOELSCH开发板，以及GEN3的SALVATOR-X(H3)开发板。
	除了以上的板子外，这些测试应该也可以被用在其他板子上，但是其测试结果的正确性等还不能被保证。
	元々LAGERボード担当の人とKOELSCHボード担当する人がそれぞれに自分のボードでScriptsの構成が少し違います。
	以前LAGER和KOELSCH板子的维护者，各自做了少量的面向自己板子的脚本。后来在GEN2代码的基础上，
	又添加对GEN3板子的支持。现在已经投稿的Scripts已经被确认可以在板子上正常测试。
	现在不支持一些功能和驱动，也会在以后继续加进来。
	本文中，主要讲述使用本测试的基本构成以及基本使用方法。
	
2.关于SCRIPTS使用环境说明：

2.1	测试环境准备：

	· 测试工具的安装： 为了能正确评估Linux各机能，PCL中要求的工具没有的话，需要都安装上去。
	· 各测试项目里，有说明依赖某些CONFIG时，在测试前请先确认。

2.2	SSH环境准备：

	· 开发板环境准备：安装SSH server。如：$ apt-get install openssh-server
	· PC机环境准备：安装SSH client。 如：$ apt-get install openssh-client

2.3	SCRIPTS的构成：

	测试时，需要将此测试代码全部放在板子的ROOTFS中。
	然后，可以通过SSH或Serial的方式进行测试代码的操作。

2.3.1	全体文件的构成如下：

	1) 各驱动测试用的Scripts：用来评估各驱动的测试脚本。(如：USB-HOST、USB-FUNCTION、SDHI, ...)
	2) common的脚本: 对于不同驱动测试代码中共通的脚本。(在common文件夹内)
	3) config.sh：测试环境配置文件。(如：开发板IP)
	4) helper：待定。(此文件不存在)
	   另外，那些共通的脚本都是在各驱动测试代码中被调用的。
	5) Updated_history.txt：待定。(此文件不存在)

2.3.3	各驱动文件夹内Scripts(USB-HOST、SDHI...)构成：
  
	1) 0x_index.sh和_index.sh：可以连续运行多个不同的测试项目。(可以使用其来运行所有此驱动相关的测试项目)
	2) xx_文件名.sh：PCL的各测试项目中，xx_代表各测试项目的番号。
	3) 其他的.sh文件：测试实施中一些必要的辅助脚本。
	
2.4	SCRITPS的基本使用方法：

	一般的测试都是在板子上运行，即使从PC侧来操作板子上的测试脚本。
	如：在PC上运行：$ cd /tftpf/192.168.1.9/root/Script/SDHI/
	然后在SDHI文件夹内直接运行对应的测试脚本即可。
	关于SDHI下的各测试项目脚本：
	1) 0x_index.sh: 可以使用其来连续运行当前文件夹所有的测试项目。
	  (文件已不存在)
	  如：./01_index.sh (顺序执行所有的测试项目)
	2) _index.sh：在PCL中，指定从某一个项目连续执行到另外一个测试项目。
	  项目的番号需要在命令行中当做参数传入。具体的使用方法如下：
	  如：./_index.sh (顺序执行所有的测试项目)
	  如：./_index.sh 10 (10：PCL中No.10的测试项目会被执行)
	  如：./_index.sh 10:20 (PCL中No.10到No.20的测试项目会被依次执行)
	  如：./_index.sh 10 13 15 18 (PCL中No.10 13 15 18会被依次执行)
	3) 其他的测试脚本：某一测试项目相关的脚本。
	  可以执行这些脚本来测试对应的项目。
	  如：./010_write-RAM-to-SD1_350MB.sh (PCL中，SDHI文件夹下的No.10项目会被执行)

注意：
目前，PCL中灰色输出和未Script化的项目还未被支持。
USB-HOSTやDisplay-UnitなどのScriptsを実行する前にテストする用のデバイスやケーブルを挿入してから実行します。
对于USB-HOST和Display-Unit，在测试前需要插入必要的设备和接线。

