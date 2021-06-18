set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210614_HoangTuan_V5_AMChi"
copy "..\..\..\dist\hoangtuan\hoangtuan.xml" "%rootPublish%\210614_HoangTuan_V5_AMChi"
copy "..\..\..\dist\hoangtuan\hoangtuan.xslt" "%rootPublish%\210614_HoangTuan_V5_AMChi"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210614_HoangTuan_V5_AMChi.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210614_HoangTuan_V5_AMChi">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
