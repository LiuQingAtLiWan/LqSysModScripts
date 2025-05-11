@echo off
REM ------------------------------------------------
REM SysModScripts - Windows System Modifications
REM Created by: LIU Qing
REM Email: mst.lq.bk+SysMod@gmail.com
REM Purpose: Restart the explorer process (which is usually used after modifying the registry)
REM Copyright 2024
REM ------------------------------------------------

echo Restarting Explorer process...

taskkill /f /im explorer.exe

timeout /t 2  >nul 2>nul

start  /b "" "%windir%\explorer.exe"

echo Explorer restarted successfully.
