@echo off
REM ------------------------------------------------
REM SysModScripts - Windows System Modifications
REM Created by: LIU Qing
REM Email: mst.lq.bk+SysMod@gmail.com
REM Purpose: Revert the right-click context menu to the classic style
REM Copyright 2024
REM ------------------------------------------------
REG ADD "HKEY_CURRENT_USER\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /VE /T REG_SZ /D "" /F