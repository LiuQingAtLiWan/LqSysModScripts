@echo off
REM ------------------------------------------------
REM SysModScripts - Windows System Modifications
REM Created by: LIU Qing
REM Email: mst.lq.bk+SysMod@gmail.com
REM Purpose: Open the Command Prompt via shift Right Click Context Menu
REM Copyright 2024
REM ------------------------------------------------

REG ADD "HKEY_CLASSES_ROOT\Directory\shell\cmd_here" /VE /t REG_SZ /D "open cmd here" /F
REG ADD "HKEY_CLASSES_ROOT\Directory\shell\cmd_here" /V "Extended" /T REG_SZ /D "" /F
REG ADD "HKEY_CLASSES_ROOT\Directory\shell\cmd_here" /V "Icon" /T REG_EXPAND_SZ /D %ComSpec% /F
REG ADD "HKEY_CLASSES_ROOT\Directory\shell\cmd_here\command" /VE /t REG_EXPAND_SZ /D "%ComSpec%  /s /k pushd \"%%V\"" /F

REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\cmd_here" /VE /t REG_SZ /D "open cmd here" /F
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\cmd_here" /V "Extended" /T REG_SZ /D "" /F
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\cmd_here" /V "Icon" /T REG_EXPAND_SZ /D %ComSpec% /F
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\cmd_here\command" /VE /T REG_EXPAND_SZ /D "%ComSpec% /s /k pushd \"%%V\"" /F


