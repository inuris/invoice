set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\201218_DaiLoiLoi_V5_AMLieu"
copy "..\..\..\dist\dailoiloi\dailoiloi.xml" "%rootPublish%\201218_DaiLoiLoi_V5_AMLieu"
copy "..\..\..\dist\dailoiloi\dailoiloi.xslt" "%rootPublish%\201218_DaiLoiLoi_V5_AMLieu"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("201218_DaiLoiLoi_V5_AMLieu.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\201218_DaiLoiLoi_V5_AMLieu">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
