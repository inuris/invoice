set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\A"
copy "..\..\..\dist\_template_lieu_khanh_dichvu\_template_lieu_khanh_dichvu.xml" "%rootPublish%\A"
copy "..\..\..\dist\_template_lieu_khanh_dichvu\_template_lieu_khanh_dichvu.xslt" "%rootPublish%\A"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("A.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\A">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
