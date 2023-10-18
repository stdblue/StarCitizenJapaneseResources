@echo off

REM これは翻訳をまとめてマージするためのコマンドです。
cd work

REM v3.16.1 の機械翻訳を適用（ただし、変数を除く）
julia ..\..\tools\split_headers.jl ..\global_en.ini ..\library\machine\global_ja_00 ..\library\machine\global_ja_01 ..\library\machine\global_ja_02 ..\library\machine\global_ja_03 ..\library\machine\global_ja_04 ..\library\machine\global_ja_05 ..\library\machine\global_ja_06 >global.ini.machine

REM mobiGlass のコンタクトマネージャーを開くと落ちる部分を修正
julia ..\..\tools\split_replace.jl global.ini.machine ..\library\manual\momo_1_translated.txt >global.ini.momo

REM JASCOM とりまとめワークシートを適用
julia ..\..\tools\split_replace.jl global.ini.momo ..\library\manual\jascom_1_translated.txt >global.ini.jascom

REM mo55y さん翻訳分を適用
julia ..\..\tools\split_replace.jl global.ini.jascom ..\library\manual\mossy_1_message.txt ..\library\manual\mossy_2_message.txt ..\library\manual\mossy_3_message.txt>global.ini.mossy

REM ぴにきさん翻訳分を適用
julia ..\..\tools\split_replace.jl global.ini.mossy ..\library\manual\mossy_1_message.txt ..\library\manual\mossy_2_message.txt ..\library\manual\mossy_3_message.txt>global.ini

