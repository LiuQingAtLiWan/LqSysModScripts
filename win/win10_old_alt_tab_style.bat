@echo off
REM ------------------------------------------------
REM SysModScripts - Windows System Modifications
REM Created by: LIU Qing
REM Email: mst.lq.bk+SysMod@gmail.com
REM Purpose: Adjust Windows Alt+Tab to show only icons
REM Copyright 2024
REM ------------------------------------------------
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /V "AltTabSettings" /T REG_DWORD /D 1 /F
