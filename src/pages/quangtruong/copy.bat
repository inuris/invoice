set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210115_QuangTruong_V5_AMLieu"
copy "..\..\..\dist\quangtruong\quangtruong.xml" "%rootPublish%\210115_QuangTruong_V5_AMLieu"
copy "..\..\..\dist\quangtruong\quangtruong.xslt" "%rootPublish%\210115_QuangTruong_V5_AMLieu"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210115_QuangTruong_V5_AMLieu.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210115_QuangTruong_V5_AMLieu">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
