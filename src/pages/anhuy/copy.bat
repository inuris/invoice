set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210112_AnHuy_V5_AMThuy"
copy "..\..\..\dist\anhuy\anhuy.xml" "%rootPublish%\210112_AnHuy_V5_AMThuy"
copy "..\..\..\dist\anhuy\anhuy.xslt" "%rootPublish%\210112_AnHuy_V5_AMThuy"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210112_AnHuy_V5_AMThuy.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210112_AnHuy_V5_AMThuy">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
