@echo off
set /p rootPublish=<copy.cfg
cls
echo 1. Lieu_Khanh
echo 2. Lieu_Khanh Dich vu
echo 3. Trong (Don ngu)
echo 4. Trong (Song ngu)
echo 5. Ban hang A5
echo 6. Ban hang A4
echo 7. Truong hoc
echo 8. Thuy PM
echo 9. Dung (Song ngu)


set /p t=Choose template:

if "%t%"=="1" set template=_template_lieu_khanh
if "%t%"=="2" set template=_template_lieu_khanh_dichvu
if "%t%"=="3" set template=_template_trong_donngu
if "%t%"=="4" set template=_template_trong_songngu
if "%t%"=="5" set template=_template_banhang_a5
if "%t%"=="6" set template=_template_banhang
if "%t%"=="7" set template=_template_truonghoc
if "%t%"=="8" set template=_template_thuypm
if "%t%"=="9" set template=_template_dung_songngu
cls
echo %template%
set /p code=Code name:
set /p publish=Folder publish:



echo "Generating HTML..."
xcopy "src\pages\%template%" "src\pages\%code%" /s /i /y
echo {{#with %code%}}>"src\pages\%code%\index.html"
type "src\pages\%template%\index.template">>"src\pages\%code%\index.html"
del "src\pages\%code%\index.template"
del "src\pages\%code%\%template%.yml"

echo "Generating YML..."
echo comCode: %code%>"src\pages\%code%\%code%.yml"
type "src\pages\%template%\%template%.yml">>"src\pages\%code%\%code%.yml"

echo "Generating _copy.bat..."

echo set /p rootPublish=^<..\..\..\copy.cfg>"src\pages\%code%\_copy.bat"
echo md "%%rootPublish%%\%publish%">>"src\pages\%code%\_copy.bat"
echo copy "..\..\..\dist\%code%\%code%.xml" "%%rootPublish%%\%publish%">>"src\pages\%code%\_copy.bat"
echo copy "..\..\..\dist\%code%\%code%.xslt" "%%rootPublish%%\%publish%">>"src\pages\%code%\_copy.bat"
echo echo Set oWS = WScript.CreateObject("WScript.Shell")^>CreateShortcut.vbs>>"src\pages\%code%\_copy.bat"
echo echo Set oLink = oWS.CreateShortcut("%publish%.lnk")^>^>CreateShortcut.vbs>>"src\pages\%code%\_copy.bat"
echo echo oLink.TargetPath = "%%rootPublish%%\%publish%"^>^>CreateShortcut.vbs>>"src\pages\%code%\_copy.bat"
echo echo oLink.Save^>^>CreateShortcut.vbs>>"src\pages\%code%\_copy.bat"
echo cscript CreateShortcut.vbs>>"src\pages\%code%\_copy.bat"
echo del CreateShortcut.vbs>>"src\pages\%code%\_copy.bat"
echo ren "index.html" "_index.html">>"src\pages\%code%\_copy.bat"

echo "Generating _restore.bat..."
echo ren "_index.html" "index.html">"src\pages\%code%\_restore.bat"
echo start ie.lnk>>"src\pages\%code%\_restore.bat"

echo "Generating shortcut..."

echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLinkIE = oWS.CreateShortcut("src\pages\%code%\ie.lnk")>>CreateShortcut.vbs
echo oLinkIE.TargetPath = "C:\Program Files\Internet Explorer\iexplore.exe">>CreateShortcut.vbs
echo oLinkIE.Arguments = "http://localhost:8000/%code%">>CreateShortcut.vbs
echo oLinkIE.WorkingDirectory = "C:\Program Files\Internet Explorer">>CreateShortcut.vbs
echo oLinkIE.IconLocation = "%%SystemRoot%%\System32\SHELL32.dll, 14">>CreateShortcut.vbs
echo oLinkIE.Save>>CreateShortcut.vbs

cscript CreateShortcut.vbs
del CreateShortcut.vbs



echo "Finished..."

start "src\pages\%code%\ie.lnk"
