1.背景：
	
	現在人ソ LinuxチームではLinux評価のときに、手動とShell Scriptsを使って評価を行っております。
	Shell ScriptsはメインはGEN2のLAGERボードとKOELSCHボード、GEN3のSALVATOR-X(H3)向けでそれぞれに作りました。
	現在のUpstream評価でよく使っております。これ以外のボードで動かせることができるかもしれませんが、この場合は保証しません。
	元々LAGERボード担当の人とKOELSCHボード担当する人がそれぞれに自分のボードでScriptsの構成が少し違います。
	それでGEN2向けのScriptを含めて、GEN3向けのScriptの構成を統一にしました。
	現時点の投稿しているScriptsは実際にボードで動かして確認できたものとしています。
	そういう意味で現在サポートされていない機能やドライバのScriptsは今後も次々にアップデートし続けます。
	本書ではSCRIPTSの基本的な使い方と構成を説明致します。
	
2.SCRIPTSに必要な実施環境説明：

2.1	テスト環境準備：

  ・テストツールInstall：評価するために、PCLで要求しているツールなどあれば、そのツールをインストールする必要です
  ・ テスト項目に必要なCONFIGがあれば、評価する前に実施する必要です。

2.2	SSH環境準備：

  ・ON BOARD: SSH serverをインストールする。例：#apt-get install openssh-server
  ・ON PC: SSH clientをインストールする。例：$sudo apt-get install openssh-client

2.3	SCRIPTSの構成：

	現在、GEN3とGEN2向けのSCRIPTSの置く場所はボードのRootfsです。
	Scriptのアクセス方法はConsoleのシリアルとSSH経路でアクセスすることです。

2.3.1	全体のファイル構成としては以下になります：
  
  1) 各ドライバ評価用のScripts：各ドライバを評価するためのScripts。(Exp: USB-HOST、USB-FUNCTION、SDHI,...)
  2)  commonのScripts：　各ドライバが使っている共通なScripts。(commonフォルダにあります)。
  3)  config.sh:　テスト実行環境に合わせて設定するためのファイルです。
  4)　helper : 自由に何かテストや確認する時にパラメターを伝えて使うscriptsです。
  また、各テスト項目のScriptから呼ばれている共通なScriptで使っている。
  5)　Updated_history.txt: 各Scriptの更新した内容や歴史を記入するファイル。(最初のバージョンにはこのファイルがありません)

2.3.2	各ドライバのScripts(USB-HOST、SDHI...)のファイル構成は以下になります：
  
  1) 0x_index.shまたは_index.sh：実際にテストを行うときに連続的に実行するscriptです。(全項目を実施する自動テスト可能なscript）
  2) xx_ファイル名.sh：PCLの各テスト項目で、xx_はPCLのテスト項目番号の意味です
  3) その他のファイル名.sh：実施するScriptsに必要なライブラリやSubscriptsです。
	
2.4	SCRIPTSの基本的な使い方：
  
	基本的にはBoardから実施することではなく、HOST-PCからScriptsファイルがあるフォルダにアクセスして直接に実行することになります。
	例：PCで操作： $cd /tftpf/192.168.1.9/root/Script/SDHI/
	このSDHIフォルダから直接にScriptsを実行する。
	1) 0x_index.sh：全項目をテストするときに連続的に実行するscriptです。
	  (自動テスト可能な全機能を実施するscriptファイル）
	  例：./01_index.sh (順番で最初から最後までscriptsを実行する)
	2) _index.sh：PCLの中で、どれかの項目をまたはどこからどこまでの項目をまたはバラバラの数項目を実行するの時に、
	その項目番号をパラメーターとして付けて実行するscriptです。詳細は使い方のところに説明します。
	　例：./_index.sh (順番で最初から最後までscriptsを実行する)
	　例：./_index.sh 10 (10：PCLのItem No.10だけを実行する)
	　例：./_index.sh 10:20 (PCLのItem No.10からNo.20まで実行する)
	　例：./_index.sh 10 13 15 18 (PCLのItem No.10、13, 15, 18を実行する)
	3) その他、各テスト項目のscript：そのテスト項目を一個一個で実行する場合に使うこともできる
	　基本的にはこのscriptシリーズはPCLのItemNo.をファイル名に付けます。
　実行例：./010_write-RAM-to-SD1_350MB.sh (PCLのSDHIドライバのTestItem.10のScriptを実行する)
	
注意点：
現在PCLで灰皿色をつける評価できない項目やScript化のない項目は対応外です。
USB-HOSTやDisplay-UnitなどのScriptsを実行する前にテストする用のデバイスやケーブルを挿入してから実行します。

