set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210614_DTTMXDLocNguyen_V5_AMTuanAnh"
copy "..\..\..\dist\dttmxdlocnguyen\dttmxdlocnguyen.xml" "%rootPublish%\210614_DTTMXDLocNguyen_V5_AMTuanAnh"
copy "..\..\..\dist\dttmxdlocnguyen\dttmxdlocnguyen.xslt" "%rootPublish%\210614_DTTMXDLocNguyen_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210614_DTTMXDLocNguyen_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210614_DTTMXDLocNguyen_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
