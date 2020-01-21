@echo off

set SPLEETER_PATH=..

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
set /P INPUTSTR="stems? [2, 4, 5]: "

set check=false
if %INPUTSTR%==2 set check=true
if %INPUTSTR%==4 set check=true
if %INPUTSTR%==5 set check=true
if %check%==false goto :INPUT_CHECK

cd /d %SPLEETER_PATH%
call %USERPROFILE%\miniconda3\Scripts\activate.bat

for %%i in (%*) do (
    spleeter separate -i "%%~i" -p spleeter:%INPUTSTR%stems -o "%OUT_PUT_PATH%\%%~ni_%INPUTSTR%stems_%timestamp%"
)

pause
