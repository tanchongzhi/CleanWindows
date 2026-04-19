@echo off
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "& { & '%~dp0Invoke-Cleaner.ps1' %* }"
