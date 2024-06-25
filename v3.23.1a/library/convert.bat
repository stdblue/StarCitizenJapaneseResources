@echo off
setlocal

set batchdir="%~dp0"

set target="20231228"

julia ..\..\tools\parse_translated.jl %target%\base.tsv > scjpbase.txt

for /F "tokens=2,3" %%I in ('where /R . /T "scjpbase.txt"') do set STAMP=%%I-%%J

echo scjpbase.txt %STAMP%

julia ..\..\tools\parse_translated.jl %target%\v321.tsv > scjp321.txt

for /F "tokens=2,3" %%I in ('where /R . /T "scjp321.txt"') do set STAMP=%%I-%%J

echo scjp321.txt %STAMP%

julia ..\..\tools\parse_translated.jl %target%\v3211.tsv > scjp3211.txt

for /F "tokens=2,3" %%I in ('where /R . /T "scjp3211.txt"') do set STAMP=%%I-%%J

echo scjp3211.txt %STAMP%

julia ..\..\tools\parse_translated.jl %target%\v322.tsv > scjp322.txt

for /F "tokens=2,3" %%I in ('where /R . /T "scjp3211.txt"') do set STAMP=%%I-%%J

echo scjp322.txt %STAMP%


