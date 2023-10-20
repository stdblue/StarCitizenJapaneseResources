@echo off

REM これは翻訳をまとめてマージするためのコマンドです。
cd work

REM v3.20.0b の日本語リソースをベースとする。
julia ..\..\tools\split_headers.jl ..\global.ini ..\..\v3.20.0b\release\global.ini >global.ini


