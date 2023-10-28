@echo off

REM これは翻訳をまとめてマージするためのコマンドです。
cd work

REM v3.20.0b の日本語リソースをベースとする。
julia ..\..\tools\split_headers.jl ..\global.ini ..\..\v3.20.0b\release\global.ini >global.v3.20.ini

REM SCJPベースを取り込み。
julia ..\..\tools\split_headers.jl global.v3.20.ini ..\library\manual\scjpbase.txt >global.base.ini

REM v3.21 差分を取り込み。
julia ..\..\tools\split_headers.jl global.base.ini ..\library\manual\scjpv321.txt >global.ini


