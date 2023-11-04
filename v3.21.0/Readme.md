# v3.21.0 リソース対応

## ファイル説明

```
v3.21.0   StarCitizen バージョンごとの翻訳管理ディレクトリ
│  
│  .gitignore
│  global.3d.txt                 3DTEXT 障害(STARC-85299)回避のため未翻訳とする部分を抜き出し
│  global.ini                    バージョンごとの StarCitizen 英語版リソース
│  global.ini.3200b-3210.diff    3.20.0b から 3.21.0 でのリソース差分
│  global.ini.vars.ja.txt        英語版リソースの変数部分の機械翻訳
│  global.vars.ini               英語版リソースの変数部分
│  Readme.md                     本ファイル
│  translate.bat                 翻訳実行バッチ
│
├─library    機械/手動翻訳のライブラリ
│  └─manual  手動翻訳したリソースの配置場所
│          -_tsv.tsv             エクスポートされた手動翻訳
│          -_tsv3.21.tsv         エクスポートされた手動翻訳 v3.20-v3.21 差分
│          -_tsvbase.tsv
│          scjpbase.txt          エクスポートされた手動翻訳 TSV → リソース形式へ
│          scjpv321.txt          エクスポートされた手動翻訳差分 TSV → リソース形式へ
│
├─release  リリースする global.ini ファイルの配置場所
│      global.ini                                 現状最新版
│      global.ini-v3.21.0-ja_JP-alpha.2.0         alpha 0.2.0 リリース版
│      global.ini-v3.21.0-ja_JP-alpha.2.1         alpha 0.2.1 リリース版
│      user.cfg                                   日本語指定設定ファイル
│
└─work     作業用ディレクトリ

```

