# StarCitizenJapaneseResources

## Star Citizen v3.21.0 用非公式日本語リソース

　Star Citizen VERSION 3.20.0b より多言語リソース対応が CIG 公式からアナウンスされました。  
　本リソースは英語メッセージを機械翻訳し、有志による手動翻訳をマージしたものとなります。

　翻訳作業は現在作業中であり、随時新しいリソースへと置き換えていきます。

## 現在の進捗
[![Crowdin](https://badges.crowdin.net/star-citizen-ja/localized.svg)](https://crowdin.com/project/star-citizen-ja)

## 使い方

1. global.ini ファイルを以下の場所に配置します。  
　フォルダーが存在しない場合は、作成します。  

```
%INSTALL_FOLDER\StarCitizen\LIVE\data\Localization\japanese_(japan)
```

　デフォルトインストールの場合、以下の場所となります。  
```
C:\Program Files\Roberts Space Industries\StarCitizen\LIVE\data\Localization\japanese_(japan)
```
![global.iniのデフォルト配置位置](https://github.com/stdblue/StarCitizenJapaneseResources/blob/develop/img/resourceplace.png "デフォルトインストール時の配置位置")

※ StarCitizen クライアント起動時にテキスト欄が @XXXXX と表示される場合、global.ini の文字コードとリターンコードを確認してください。  
　global.ini ファイルは BOM 付き UTF-8 で、リターンコードは LF となります。  

![global.iniのコードと改行文字](https://github.com/stdblue/StarCitizenJapaneseResources/blob/develop/img/filecode.png "Visual Studio Code で表示")

2. user.cfg ファイルを編集し、以下の行を追加します。

```
g_language = japanese_(japan)
```

　user.cfg ファイルが存在しない場合、メモ帳などを利用して作成します。  
　リリースファイルとして置いておきますので、それを配置しても構いません。  

3. Star Citizen クライアントを起動します。  
　ようこそ、日本語化された Star Citizen Persistence Universe へ！  


## 既知の不具合

　現在までに以下の不具合が確認されています。  
　詳細は Issue Council にて確認ください。  

* 3D文字が見えない  
　F キーで様々な操作を行うインタラクト機能などがありますが、そのとき空間中に表示される3D文字の表示ができません。  
[STARC-85299](https://issue-council.robertsspaceindustries.com/projects/STAR-CITIZEN/issues/STARC-85299)

* 検索機能が使えない
　アイテム検索などでアイテム名を日本語で入力した場合、検索にマッチしない  
[STARC-85315](https://issue-council.robertsspaceindustries.com/projects/STAR-CITIZEN/issues/STARC-85315)

* 原文の global.ini に非ユニコード文字が含まれている  
　これは翻訳作業者の方向けの注意ですが、CIG 作業者がμや℃などの文字を非ユニコード文字（環境依存文字）で記載しています。そのため、日本語環境では文字化けが発生しどのような文字が記載されているのか文脈から判断する必要があります。  
[STARC-87163](https://issue-council.robertsspaceindustries.com/projects/STAR-CITIZEN/issues/STARC-87163)

* ローカライズされたリソースを使うとシステム音声が聞こえない  
　設定をローカル環境に切り替えたため、ローカライズされたシステム音声を探して、ファイルが存在せずに音声が聞こえないようです。以下の回避策を適用してみてください。  
[STARC-86490](https://issue-council.robertsspaceindustries.com/projects/STAR-CITIZEN/issues/STARC-86490)
  - user.cfg に g_languageAudio = english を追加する  


　問題が確認された場合は、user.cfg ファイルをリネームし、英語版オリジナルで問題が発生しないかどうか確認してください。  


## 翻訳協力者一覧(Special Thanks)

+ Team Lead  
	nmtkawb  

+ Translation Tools Developer  
	MoMoShrine

+ Git Manager  
	MoMoShrine

+ Main Translator  
	mossy  
	nmtkawb  
	Exceptur  

+ Translator  
	kogumatta  
	Luke  
	MoMoShrine  
	かりんと  
	luice  
	Shinnryuu  
	Riven  
	chimaera  
	velocity7  
	Franku7  
	ogumap  
	ZPAerospike  

+ Proofreader  
	Exceptur  
	velocity7  

+ Translation Adviser  
	mossy  
	nmtkawb  
	Exceptur  
	Luke  
	MoMoShrine  
	かりんと  
	velocity7  
	nekmoyanono  
	faulis  
	OOM Tricorn  
	クレクレ柴犬　　

+ Tech Adviser  
	Luke  
	luice  
	
+ Special thanks  
	Star Citizen Japan Community  
	Star Citizen Localization Community  
