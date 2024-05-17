@echo off
TITLE Welcome %USERNAME%
color 17
MODE con:cols=52 lines=12

echo Administrator permissions are requested...
net session >nul 2>&1
if %errorlevel% equ 0 (
    echo "Please Wait"
) else (
    powershell -Command "Start-Process '%0' -Verb RunAs"
    exit /b
)

cls

net session >nul 2>&1
if %ErrorLevel% equ 0 (
    echo.
    echo "You are an Administrator"
) else (
    echo.
    echo "You are not an Administrator"
    goto END
)

echo.
echo ----------------------------------------------------
echo ---"Clear Defender History v1.0"--"By Javier.E.C"---
echo ----------------------------------------------------
echo vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
echo ----------------------------------------------------
echo ---"Please wait 3 seconds until the confirmation----
echo ----message disappear or accept the confirmation"---
echo ----------------------------------------------------
echo.

IObitUnlocker.exe /Delete /Advanced "%systemdrive%\ProgramData\Microsoft\Windows Defender\Scans\History\Service","%systemdrive%\ProgramData\Microsoft\Windows Defender\Scans\mpenginedb.db" | powershell -command "Start-Sleep -Seconds 3; Stop-Process -Name IObitUnlocker -Force -ErrorAction SilentlyContinue"
if %ErrorLevel% equ 0 (
    cls
    echo.
    echo "No errors occurred"
) else (
    echo.
    echo "An error has occurred, please try again"
    goto ERROR
)

mkdir "%systemdrive%\ProgramData\Microsoft\Windows Defender\Scans\History\Service" >nul 2>&1

echo.
echo ----------------------------------------------------
echo ---"Windows Defender threat detection history and---
echo ----controlled folder access protection history,----
echo ----were successfully deleted/restored"-------------
echo ----------------------------------------------------
echo ----------------------------------------------------
echo -Please wait 5 seconds to exit or close this window-
echo ----------------------------------------------------
timeout /T 5 >nul
exit

:ERROR
echo.
echo Press any key to end or close this window
    pause>nul
    exit

:END
echo.
echo Press any key to end or close this window
    pause>nul
    exit