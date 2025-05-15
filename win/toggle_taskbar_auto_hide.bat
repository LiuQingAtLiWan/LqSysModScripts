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

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0toggle_taskbar_auto_hide.ps1"

