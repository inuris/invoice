set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210413_DVTMPhuHoangTuan_V5_AMLieu"
copy "..\..\..\dist\dvtmphuhoangtuan\dvtmphuhoangtuan.xml" "%rootPublish%\210413_DVTMPhuHoangTuan_V5_AMLieu"
copy "..\..\..\dist\dvtmphuhoangtuan\dvtmphuhoangtuan.xslt" "%rootPublish%\210413_DVTMPhuHoangTuan_V5_AMLieu"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210413_DVTMPhuHoangTuan_V5_AMLieu.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210413_DVTMPhuHoangTuan_V5_AMLieu">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
