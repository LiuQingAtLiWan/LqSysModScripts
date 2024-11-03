@echo off
REM ------------------------------------------------
REM SysModScripts - Windows System Modifications
REM Created by: LIU Qing
REM Email: mst.lq.bk+SysMod@gmail.com
REM Purpose: Turn off system hibernation (to remove the Hiberfil.sys file).
REM Copyright 2024
REM ------------------------------------------------

powercfg.exe /hibernate off
