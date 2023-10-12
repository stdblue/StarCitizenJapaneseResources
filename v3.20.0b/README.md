# StarCitizenJapaneseResources

本内容は以下の CIG Spectrum に記載された記事を元に記載しております。  

https://robertsspaceindustries.com/spectrum/community/SC/forum/1/thread/star-citizen-community-localization-update

## 使い方

　Version 3.20.0b からローカライゼーションに対応しました。（CIG が）  

+ Star Citizen 3.20.0b のインストール場所をエクスプローラーで開きます。
```
C:\Program Files\Roberts Space Industries\StarCitizen
```
+ LIVE\data\Localization にフォルダーを作成します。
```
japanese_(japan)
```
+ global.ini ファイルを配置してください。  
+ LIVE\user.cfg を編集します。g_language の部分を以下の用に修正してください。
```
g_language = japanese_(japan)
```
　該当する行がない場合は上記行を追加します。  

> 注意：LIVE 配下に user.cfg ファイルがない場合は作成するか、このディレクトリの user.cfg を配置してください。

+ Star Citizenを起動します。
