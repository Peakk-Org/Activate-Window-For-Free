@echo off
setlocal EnableExtensions
title PEAKK - Windows Activation Center
color 5F
mode con: cols=90 lines=30

:: Check administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    cls
    echo.
    echo ==========================================================
    echo                 P E A K K   A C T I V A T I O N
    echo ==========================================================
    echo.
    echo [!] Administrator privileges are required.
    echo.
    echo Restarting as Administrator...
    echo.
    powershell -NoProfile -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:MENU
cls
echo.
echo ==========================================================
echo                  P E A K K   A C T I V A T I O N
echo ==========================================================
echo.
echo                 WINDOWS LICENSE CENTER
echo.
echo ==========================================================
echo.
echo   [1] Check Windows Activation
echo   [2] Open Activation Settings
echo   [3] Activate the Windows
echo   [4] About
echo   [5] Exit
echo.
echo ==========================================================
echo.
set /p choice=  PEAKK^> Select an option: 

if "%choice%"=="1" goto STATUS
if "%choice%"=="2" goto SETTINGS
if "%choice%"=="3" goto Activate
if "%choice%"=="4" goto About
if "%choice%"=="5" goto EXIT

goto MENU

:STATUS
cls
echo.
echo ==========================================================
echo                 ACTIVATION STATUS
echo ==========================================================
echo.
cscript //nologo "%windir%\system32\slmgr.vbs" /xpr
echo.
pause
goto MENU

:SETTINGS
start ms-settings:activation
goto MENU

:Activate
cls
echo.
echo ==========================================================
echo                  PRODUCT KEY ACTIVATION
echo ==========================================================
echo.
echo So You want to Activate your Windows.
echo No Problem
echo.
echo.	Step 1 : Open PowerShell as administrator
echo.	Step 2 : Enter this command " irm https://get.activated.win | iex "
echo.	Step 3 : A comand prompt will Open
echo.	Step 4 : Press 1 or 2 or 3 or 4
echo.	Step 5 : Wait Few Seconds
echo.	Step 6 : After sometime your Windows is permanently activated.
echo.

echo.
pause
goto MENU

:About
cls
echo ==========================================================
echo                  			About
echo ==========================================================
echo Made By PEAKK
echo In 2026
echo For more tools like this please support
echo.
echo.
pause
goto MENU

:EXIT
cls
echo.
echo ==========================================================
echo                   PEAKK ACTIVATION
echo ==========================================================
echo.
echo              Thank you for using PEAKK.
echo.
timeout /t 2 >nul
exit /b