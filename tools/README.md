# StarCitizenJapaneseResources

>　以下の文章は将来に向けて実装する内容が含まれています。  
>　現時点では下記記載内容ほど高度な機能はありませんので、ご了承ください。

## 翻訳ツールについて

　翻訳ツールはバージョン間のリソース変化を検出し、すでに翻訳済みのリソースがある場合それをマージし、未翻訳リソースについて機械翻訳をかけ、新しいリソースを作成します。

　速度の関係上、本ツールでは stdblue の趣味で Julia スクリプト言語を利用しています。  
　ですが、あくまで趣味なので、別の言語への変更は Welcome です。  

　現行では翻訳機能として DeepL API(有料) を利用しています。  
　財布に優しい API が別途あればお知らせください。  

### 使い方

```[Julia]
julia translate_jp.jl 最新バージョンglobal.ini 前翻訳バージョンglobal.ini [前翻訳glibal.ini] [手動翻訳テキスト] > global.ini
```

### 処理フロー

```mermaid
sequenceDiagram
    participant translate_jp

    participant VersionDiff

    translate_jp->>+VersionDiff: バージョンアップに伴うリソースの変化を取得
    VersionDiff-->>-translate_jp: 新規リソース、変更リソースを出力

    participant TranslateMachine
    translate_jp->>+TranslateMachine: 新規／変更リソースの翻訳を依頼
 
    participant DeepL_API
    TranslateMachine->>DeepL_API: 機械翻訳を依頼
    DeepL_API-->>TranslateMachine: 翻訳結果

    TranslateMachine-->>-translate_jp: 機械翻訳済みリソースを出力


    translate_jp->>translate_jp: 機械翻訳済みリソースを辞書登録

    loop 手動翻訳リソースを辞書登録
        translate_jp->>translate_jp: 手動翻訳リソースを読み込み、辞書登録（上書き）
    end

    translate_jp->>translate_jp: キーワードをベースに global.ini 出力

```

### 製作

2023/10/12 stdblue 新規作成

