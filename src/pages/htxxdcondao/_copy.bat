set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210629_HTXXDConDao_V5_AMKhanh"
copy "..\..\..\dist\htxxdcondao\htxxdcondao.xml" "%rootPublish%\210629_HTXXDConDao_V5_AMKhanh"
copy "..\..\..\dist\htxxdcondao\htxxdcondao.xslt" "%rootPublish%\210629_HTXXDConDao_V5_AMKhanh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210629_HTXXDConDao_V5_AMKhanh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210629_HTXXDConDao_V5_AMKhanh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
