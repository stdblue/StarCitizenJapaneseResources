@echo off

REM 翻訳をまとめてマージするためのコマンド

setlocal
set verdir="%~dp0"

echo %verdir%

REM 作業ディレクトリへ移動
pushd "%verdir%\work"

echo Work directory : %CD%

REM v3.20.0b の日本語リソースをベースとする。
julia ..\..\tools\split_headers.jl ..\global.ini ..\..\v3.20.0b\release\global.ini >global.v3.20.ini

REM SCJPベースを取り込み。
julia ..\..\tools\split_replace.jl global.v3.20.ini ..\library\manual\scjpbase.txt >global.base.ini

REM v3.21 差分を取り込み。
julia ..\..\tools\split_replace.jl global.base.ini ..\library\manual\scjpv321.txt >global.85299.ini

REM 3DTEXT 障害(STARC-85299)回避のリソース上書き
julia ..\..\tools\split_replace.jl global.85299.ini ..\global.3d.txt >global.ini

popd

pause
