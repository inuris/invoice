set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210616_DVTMXDNguyenKhanh_V5_AMTuanAnh"
copy "..\..\..\dist\dvtmxdnguyenkhanh\dvtmxdnguyenkhanh.xml" "%rootPublish%\210616_DVTMXDNguyenKhanh_V5_AMTuanAnh"
copy "..\..\..\dist\dvtmxdnguyenkhanh\dvtmxdnguyenkhanh.xslt" "%rootPublish%\210616_DVTMXDNguyenKhanh_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210616_DVTMXDNguyenKhanh_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210616_DVTMXDNguyenKhanh_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
