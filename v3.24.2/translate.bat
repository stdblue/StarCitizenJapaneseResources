@echo off

REM 翻訳をまとめてマージするためのコマンド

setlocal
set verdir="%~dp0"

echo %verdir%

REM 作業ディレクトリへ移動
pushd "%verdir%\work"

echo Work directory : %CD%

REM v3.24.2 の日本語リソースを取り込み。
julia ..\..\tools\split_headers.jl ..\source\english\global.ini ..\library\20241020\global.ini >global.ini

popd

pause
