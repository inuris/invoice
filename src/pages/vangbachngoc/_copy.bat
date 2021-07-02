set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210705_VangBachNgoc_V5_AMKhanhConDao"
copy "..\..\..\dist\vangbachngoc\vangbachngoc.xml" "%rootPublish%\210705_VangBachNgoc_V5_AMKhanhConDao"
copy "..\..\..\dist\vangbachngoc\vangbachngoc.xslt" "%rootPublish%\210705_VangBachNgoc_V5_AMKhanhConDao"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210705_VangBachNgoc_V5_AMKhanhConDao.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210705_VangBachNgoc_V5_AMKhanhConDao">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
