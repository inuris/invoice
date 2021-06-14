@echo off
for /D %%a in ("C:\Code\invoice\src\pages\*") do xcopy /y /d "restore.bat" "%%a\"