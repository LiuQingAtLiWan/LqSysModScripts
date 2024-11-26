@echo off
REM ------------------------------------------------
REM SysModScripts - Windows System Modifications
REM Created by: LIU Qing
REM Email: mst.lq.bk+SysMod@gmail.com
REM Purpose: Delay automatic updates until the year 2124
REM Copyright 2024
REM ------------------------------------------------
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /V "PauseFeatureUpdatesStartTime" /T REG_SZ /D "2024-11-12T11:12:13Z" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /V "PauseFeatureUpdatesEndTime"   /T REG_SZ /D "2124-12-12T10:12:11Z" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /V "PauseQualityUpdatesStartTime" /T REG_SZ /D "2024-11-12T11:12:13Z" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /V "PauseQualityUpdatesEndTime"   /T REG_SZ /D "2124-12-12T10:12:11Z" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /V "PauseUpdatesStartTime"        /T REG_SZ /D "2024-11-12T11:12:13Z" /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /V "PauseUpdatesExpiryTime"       /T REG_SZ /D "2124-12-12T10:12:11Z" /F
