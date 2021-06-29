@echo =========================================
@echo ====== PLEASE RUN AS ADMINISTRATOR ======
@echo =========================================
@echo Copy libXML to APPDATA folder
@cd /d "%~dp0"
@xcopy "lib\libxml" "%APPDATA%\npm\libxml\" /s/h/e/k/f/c/y
@echo Set PATH to %APPDATA%\npm\libxml\bin
for /F "tokens=2* delims= " %%f IN ('reg query HKCU\Environment /v PATH ^| findstr /i path') do @set OLD_SYSTEM_PATH=%%g
@setx PATH "%APPDATA%\npm\libxml\bin;%OLD_SYSTEM_PATH%"
@echo libXML copied successfully.
@pause