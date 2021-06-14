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

echo "Generating YML..."
echo comCode: %code%>"src\pages\%code%.yml"
type "src\data\%template%.yml">>"src\pages\%code%.yml"

echo "Generating HTML..."
xcopy "src\pages\%template%" "src\pages\%code%" /s /i /y
echo {{#with %code%}}>"src\pages\%code%\index.html"
type "src\pages\%template%\index.template">>"src\pages\%code%\index.html"
del "src\pages\%code%\index.template"

echo "Generating copy.bat..."

echo set /p rootPublish=^<..\..\..\copy.cfg>"src\pages\%code%\copy.bat"
echo md "%%rootPublish%%\%publish%">>"src\pages\%code%\copy.bat"
echo copy "..\..\..\dist\%code%\%code%.xml" "%%rootPublish%%\%publish%">>"src\pages\%code%\copy.bat"
echo copy "..\..\..\dist\%code%\%code%.xslt" "%%rootPublish%%\%publish%">>"src\pages\%code%\copy.bat"
echo echo Set oWS = WScript.CreateObject("WScript.Shell")^>CreateShortcut.vbs>>"src\pages\%code%\copy.bat"
echo echo Set oLink = oWS.CreateShortcut("%publish%.lnk")^>^>CreateShortcut.vbs>>"src\pages\%code%\copy.bat"
echo echo oLink.TargetPath = "%%rootPublish%%\%publish%"^>^>CreateShortcut.vbs>>"src\pages\%code%\copy.bat"
echo echo oLink.Save^>^>CreateShortcut.vbs>>"src\pages\%code%\copy.bat"
echo cscript CreateShortcut.vbs>>"src\pages\%code%\copy.bat"
echo del CreateShortcut.vbs>>"src\pages\%code%\copy.bat"

echo "Generating archive.bat..."
echo ren "index.html" "index.html.bak">"src\pages\%code%\archive.bat"

echo "Generating restore.bat..."
echo ren "index.html.bak" "index.html">"src\pages\%code%\restore.bat"

echo "Generating shortcut..."

echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLinkIE = oWS.CreateShortcut("src\pages\%code%\ie.lnk")>>CreateShortcut.vbs
echo oLinkIE.TargetPath = "C:\Program Files\Internet Explorer\iexplore.exe">>CreateShortcut.vbs
echo oLinkIE.Arguments = "http://localhost:8000/%code%">>CreateShortcut.vbs
echo oLinkIE.WorkingDirectory = "C:\Program Files\Internet Explorer"
echo oLinkIE.IconLocation = "\\Network\NETLOGON\People_Network_Icon.ico, 0"
echo oLinkIE.Save>>CreateShortcut.vbs

cscript CreateShortcut.vbs
del CreateShortcut.vbs



echo "Finished..."


