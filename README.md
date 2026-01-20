# Star Citizen Japanese Resource Maintenance

## Star Citizen v4.x 用非公式日本語リソース

　Star Citizen VERSION 3.20.0b より多言語リソース対応が CIG 公式からアナウンスされました。  
　本リソースは Star Citizen 日本コミュニティ有志による手動翻訳をマージしたものとなります。  

　本リソースについての問い合わせは、以下の Discord チャンネルにお願いいたします。  
　(翻訳協力者は常時募集しております)  
　[Discord Star Citizen 日本コミュニティ](https://discord.com/channels/368953629274800138/1002223033953554472 "日本語化作業所")

　翻訳作業は現在作業中であり、随時新しいリソースへと置き換えていきます。


## 注意事項

 Star Citizen の英語メッセージはリリース毎に頻繁に更新されています。そのため、**Star Citizen のバージョン更新毎に翻訳リソースを適用する必要があります**。  
 ゲームクライアントが**クラッシュ**する可能性があるため、本翻訳を利用する際には、必ず最新版を利用してください。  


## 公開リソース

* v4.5.0 LIVE 版
[v4.5.0 LIVE 10966564](https://github.com/stdblue/StarCitizenJapaneseResources/releases/tag/v4.5-ja_JP-alpha-4.5-LIVE "4.5.0 LIVE 版")  

* v4.6.0 PTU 版
[v4.6.0 PTU 11079139](https://github.com/stdblue/StarCitizenJapaneseResources/releases/tag/v4.x-ja_JP-alpha-4.x-PTU "4.6.0 PTU 版")  


## 現在の翻訳/進捗

　翻訳の管理は Crowdin の OSS サポートを利用させていただいてます。  

* [Star Citizen JA プロジェクト](https://crowdin.com/project/star-citizen-ja "Star Citizen 日本語翻訳")  
  進捗 [![Crowdin](https://badges.crowdin.net/star-citizen-ja/localized.svg)](https://crowdin.com/project/star-citizen-ja)


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

2. ゲームフォルダにあるuser.cfg ファイルを編集し、以下の行を追加します。  
```
g_language = japanese_(japan)
```
![user.cfgの記載内容](https://github.com/stdblue/StarCitizenJapaneseResources/blob/master/img/usercfg.png "user.cfgの記載内容")

　user.cfgファイルはデフォルトインストールの場合、以下の場所にあります。  
```
C:\Program Files\Roberts Space Industries\StarCitizen\LIVE
```
![user.cfgのデフォルト配置位置](https://github.com/stdblue/StarCitizenJapaneseResources/blob/master/img/gamefolder.png "デフォルトインストール時の配置位置")

　user.cfg ファイルが存在しない場合、メモ帳などを利用して作成します。  
　リリースファイルとして置いておきますので、それを配置しても構いません。  

3. Star Citizen クライアントを起動します。  
　ようこそ、日本語化された Star Citizen Persistence Universe へ！  


## 既知の不具合

　現在までに以下の不具合が確認されています。  
　詳細は Issue Council にて確認ください。  

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

+ Translator  
	kogumatta  
	Exceptur  
	MoMoShrine  
	NERURU  
	Luke  
	OOM Tricorn  
	Oldman  
	Verkhasel  
	nmtkawb  
	eggman  
	NTKestrel  
	ogumap  
	Franku7  
	AdmiralAndersen  
	velocity7  
	かりんと  
	luice  
	Shinnryuu  
	Riven  
	chimaera  
	ZPAerospike  
	バン・ダナス  

+ Translation Adviser  
	mossy  
	nmtkawb  
	Exceptur  
	MoMoShrine  
	velocity7  
	OOM Tricorn  
	クレクレ柴犬  

+ Tech Adviser  
	Luke  
	luice  

+ Special thanks  
	Star Citizen Japan Community  
	Star Citizen Localization Community  
