@echo off

REM 翻訳をまとめてマージするためのコマンド

setlocal
set verdir="%~dp0"

echo %verdir%

REM 作業ディレクトリへ移動
pushd "%verdir%\work"

echo Work directory : %CD%

REM v3.22.0a の日本語リソースを取り込み。
julia ..\..\tools\split_headers.jl ..\source\english\global.ini ..\library\20240127\global.ini >global.v322.ini

REM 3DTEXT 障害(STARC-85299)回避のリソース上書き
julia ..\..\tools\split_replace.jl global.v322.ini ..\global.3d.txt >global.ini

popd

pause
