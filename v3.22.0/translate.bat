@echo off

REM 翻訳をまとめてマージするためのコマンド

setlocal
set verdir="%~dp0"

echo %verdir%

REM 作業ディレクトリへ移動
pushd "%verdir%\work"

echo Work directory : %CD%

REM v3.20.0b の日本語リソースをベースとする。
julia ..\..\tools\split_headers.jl ..\source\english\global.ini ..\..\v3.21.1\release\global.ini >global.v3211.ini

REM SCJPベースを取り込み。
julia ..\..\tools\split_replace.jl global.v3211.ini ..\library\scjpbase.txt ..\library\scjp321.txt ..\library\scjp3211.txt ..\library\scjp322.txt >global.base.ini
REM julia ..\..\tools\split_replace.jl ..\global.ini ..\library\manual\scjpbase.txt ..\library\manual\scjp321.txt ..\library\manual\scjp3211.txt>global.base.ini

REM 3DTEXT 障害(STARC-85299)回避のリソース上書き
julia ..\..\tools\split_replace.jl global.base.ini ..\global.3d.txt >global.ini

popd

pause
