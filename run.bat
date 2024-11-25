@echo off
setlocal
if "%1"=="" (
    echo Usage: %0 ^<demo_file^>
    exit /b 1
)
if not exist %1 (
    echo File %1 not found!
    exit /b 1
)
if not exist "tau.exe" (
    echo Tau executable not found!
    exit /b 1
)
set "tempfile=%TEMP%\tauinput%RANDOM%.txt"
echo. > "%tempfile%"
findstr /v "^#" %1 >> "%tempfile%"
tau.exe < "%tempfile%" | powershell -command "$input | ForEach-Object { $_ -replace '\x1b\[[0-9;]*m', '' }"
del "%tempfile%"
