# Star Citizen localization resource merger

## Usage

　マージツールは最新の global.ini を第一引数に受け取り、翻訳されたリソースを第二引数以降に指定します。  
　翻訳されたリソースは第二引数から読み込み、第三、第四と上書きしていきます。  
　結果は標準出力に出力されるので、ファイルにリダイレクトしてください。  

```
merge_globals.exe global.ini global.ini.v3.21.0 global.ini.v3.21.1 >global.ini.ja-JP
```

```
merge_globals.exe global.ini [translated global.ini ...]
    Merged global.ini is outputed to standard output.
    Please redirect to file.

    Options:
        global.ini : Latest global.ini filepath
        translated global.ini : Translated resources which is same format with global.ini
            Multiple translated resources are capable. They are affected from left to right.

```
