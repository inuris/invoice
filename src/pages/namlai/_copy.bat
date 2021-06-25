set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210701_NamLai_V5_AMLieu"
copy "..\..\..\dist\namlai\namlai.xml" "%rootPublish%\210701_NamLai_V5_AMLieu"
copy "..\..\..\dist\namlai\namlai.xslt" "%rootPublish%\210701_NamLai_V5_AMLieu"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210701_NamLai_V5_AMLieu.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210701_NamLai_V5_AMLieu">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
