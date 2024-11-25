@echo off
setlocal enabledelayedexpansion

:: Check if parameter is passed
if "%1"=="" (
    echo Usage: %0 ^<demo_file^>
    exit /b 1
)

:: Check that demo file exists
if not exist %1 (
    echo File %1 not found!
    exit /b 1
)

:: Check that tau executable exists
if not exist "tau.exe" (
    echo Tau executable not found! Please compile the project first (in Release mode^).
    exit /b 1
)

:: Create temporary file
set "tempfile=%TEMP%\tau_pipe_%RANDOM%.txt"
type nul > "%tempfile%"

:: Wait 5 seconds for tau to start
timeout /t 5 /nobreak > nul

:: Start tau in background
start /b "" tau.exe < "%tempfile%"

:: Process input file line by line
for /f "usebackq delims=" %%a in ("%1") do (
    set "line=%%a"
    :: Skip lines starting with ##
    echo !line! | findstr /b "##" >nul
    if errorlevel 1 (
        pause > nul
        echo !line!>> "%tempfile%"
    )
)

:: Clean up
del "%tempfile%"
