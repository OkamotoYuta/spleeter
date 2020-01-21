@echo off

rem このバッチファイルを移動する場合は次の SPLEETER_PATH にspleeterの絶対パスをいれてください。
set SPLEETER_PATH=..

rem 出力先を変更したい場合は次の OUT_PUT_PATH を変更してください。( %USERPROFILE%\Music は C:\Users\<ユーザー名>\Music のことです。)
set OUT_PUT_PATH=%USERPROFILE%\Music

set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%
set time2=%time: =0%
set hh=%time2:~0,2%
set mn=%time2:~3,2%
set ss=%time2:~6,2%
set timestamp=%yyyy%-%mm%%dd%-%hh%%mn%%ss%

:INPUT_CHECK
set INPUTSTR=
set /P INPUTSTR="stemsの数をいれてください。 [2, 4, 5] のどれか: "

set check=false
if %INPUTSTR%==2 set check=true
if %INPUTSTR%==4 set check=true
if %INPUTSTR%==5 set check=true
if %check%==false goto :INPUT_CHECK

cd /d %SPLEETER_PATH%
call %USERPROFILE%\miniconda3\Scripts\activate.bat

for %%i in (%*) do (
    spleeter separate -i "%%~i" -p spleeter:%INPUTSTR%stems-16kHz -o "%OUT_PUT_PATH%\%%~ni_%INPUTSTR%stems_%timestamp%"
)

pause
