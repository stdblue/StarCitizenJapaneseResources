@echo off

REM Visual Studio Code を起動 

setlocal
set verdir="%~dp0"

echo %verdir%\..

REM 作業ディレクトリへ移動
pushd "%verdir%\.."

echo Work directory : %CD%

code .
