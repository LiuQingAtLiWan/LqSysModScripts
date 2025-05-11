@echo off
REM ------------------------------------------------
REM SysModScripts - Windows System Modifications
REM Created by: LIU Qing
REM Email: mst.lq.bk+SysMod@gmail.com
REM Purpose: Toggle Windows taskbar auto-hide feature
REM Copyright 2025
REM ------------------------------------------------

ver | findstr /i "10\.0 6\.3 6\.2" > nul
if %ERRORLEVEL% NEQ 0 (
    echo Error: This script only supports Windows 8/10/11
    pause
    exit /b 1
)

REM check if the script is running with admin privileges
net session >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Restarting the script with admin privileges...
    PowerShell Start-Process -FilePath "%0" -Verb RunAs
    exit /b
)

REM change the registry value
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    $path = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3'; ^
    if (Test-Path $path) { ^
        $s = Get-ItemProperty -Path $path -Name 'Settings'; ^
        $v = $s.Settings[8]; ^
        if ($v -eq 3) { ^
            Write-Host 'Switching to always show'; ^
            $s.Settings[8] = 2;  ^
        } else  { ^
            if($v -eq 2){ ^
                Write-Host 'Switching to auto-hide'; ^
                $s.Settings[8] = 3; ^
            } ^
            else{ ^
                echo unexpected value; ^
            } ;^
        }; ^
        Set-ItemProperty -Path $path -Name 'Settings' -Value $s.Settings; ^
    }

REM restart explorer to apply the changes
set "SCRIPT_DIR=%~dp0"
call "%SCRIPT_DIR%restart_explorer.bat"

