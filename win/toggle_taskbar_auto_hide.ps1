# ------------------------------------------------
# SysModScripts - Windows System Modifications
# Created by: LIU Qing
# Email: mst.lq.bk+SysMod@gmail.com
# Purpose: Toggle Windows taskbar auto-hide feature using Windows API
# Copyright 2025
# ------------------------------------------------

Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;

public class TaskbarHelper {
    [DllImport("user32.dll")]
    private static extern IntPtr FindWindow(string lpClassName, string lpWindowName);

    [DllImport("shell32.dll")]
    private static extern int SHAppBarMessage(int dwMessage, ref APPBARDATA pData);

    [StructLayout(LayoutKind.Sequential)]
    public struct APPBARDATA {
        public int cbSize;
        public IntPtr hWnd;
        public int uCallbackMessage;
        public int uEdge;
        public RECT rc;
        public IntPtr lParam;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct RECT {
        public int left;
        public int top;
        public int right;
        public int bottom;
    }

    private const int ABM_GETSTATE = 0x4;
    private const int ABM_SETSTATE = 0xA;
    private const int ABS_AUTOHIDE = 0x1;
    private const int ABS_ALWAYSONTOP = 0x2;
    private const string TASKBAR_CLASS = "Shell_TrayWnd"; 
    
    public static bool getAutohideState() {
        APPBARDATA msgData = new APPBARDATA();
        msgData.cbSize = Marshal.SizeOf(typeof(APPBARDATA));
        msgData.hWnd = FindWindow(TASKBAR_CLASS, null);
        int state = SHAppBarMessage(ABM_GETSTATE, ref msgData);
        return (state & ABS_AUTOHIDE) == ABS_AUTOHIDE;
    }

    public static void setAutohide(bool enabled) {
        APPBARDATA msgData = new APPBARDATA();
        msgData.cbSize = Marshal.SizeOf(typeof(APPBARDATA));
        msgData.hWnd = FindWindow(TASKBAR_CLASS, null);
        msgData.lParam = (IntPtr)(enabled ? ABS_AUTOHIDE : ABS_ALWAYSONTOP);
        SHAppBarMessage(ABM_SETSTATE, ref msgData);
    }
}
'@

$currentState = [TaskbarHelper]::getAutohideState()
if ($currentState) {
    Write-Host "Switching to always show"
    [TaskbarHelper]::setAutohide($false)
} else {
    Write-Host "Switching to auto-hide"
    [TaskbarHelper]::setAutohide($true)
}