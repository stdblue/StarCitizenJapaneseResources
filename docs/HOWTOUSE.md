# リソースの使い方


## 自動インストール

　Luke-514 様提供のツールで最新リソースを自動インストールすることが可能です。  

1. 自動インストールバッチを取得

　[StarCitizen_JP_Tool](https://github.com/Luke-514/StarCitizen_JP_Tool "日本語ファイル適用ツール") リポジトリのリリースから最新ツールを取得します。

2. 管理者権限で実行

　管理者権限にてダウンロードしたファイルを実行します。  


## 手動インストール

　ユーザー自身の手で最新のリソースを配置したい場合の手順は以下の通りとなります。

1. Releases から最新のリリースを取得

2. global.ini ファイルを以下の場所に配置  

　日本語リソース本体である global.ini を以下の場所に配置します。  
　フォルダーが存在しない場合は、作成します。  

```LIVE
%INSTALL_FOLDER\StarCitizen\LIVE\data\Localization\japanese_(japan)
```

```PTU
%INSTALL_FOLDER\StarCitizen\PTU\Data\Localization\japanese_(japan)
```

　デフォルトインストールの場合、以下の場所となります。  
``` LIVE
C:\Program Files\Roberts Space Industries\StarCitizen\LIVE\Data\Localization\japanese_(japan)
```
![global.iniのデフォルト配置位置](https://github.com/stdblue/StarCitizenJapaneseResources/blob/develop/img/resourceplace.png "デフォルトインストール時の配置位置")

※ StarCitizen クライアント起動時にテキスト欄が @XXXXX と表示される場合、global.ini の文字コードとリターンコードを確認してください。  
　global.ini ファイルは BOM 付き UTF-8 で、リターンコードは LF となります。  

![global.iniのコードと改行文字](https://github.com/stdblue/StarCitizenJapaneseResources/blob/develop/img/filecode.png "Visual Studio Code で表示")


3. ゲームフォルダにあるuser.cfg ファイルを編集

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
　リリースにファイルとして置いておきますので、それを配置しても構いません。  


4. Star Citizen クライアントを起動  

　ようこそ、日本語化された Star Citizen Persistence Universe へ！  

