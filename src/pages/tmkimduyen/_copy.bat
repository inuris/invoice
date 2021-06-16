set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210112_TMKimDuyen_V5_AMLieu"
copy "..\..\..\dist\tmkimduyen\tmkimduyen.xml" "%rootPublish%\210112_TMKimDuyen_V5_AMLieu"
copy "..\..\..\dist\tmkimduyen\tmkimduyen.xslt" "%rootPublish%\210112_TMKimDuyen_V5_AMLieu"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210112_TMKimDuyen_V5_AMLieu.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210112_TMKimDuyen_V5_AMLieu">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
