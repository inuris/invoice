set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210528_DVTMXDThienHoang_V5_AMDuc"
copy "..\..\..\dist\dvtmxdthienhoang\dvtmxdthienhoang.xml" "%rootPublish%\210528_DVTMXDThienHoang_V5_AMDuc"
copy "..\..\..\dist\dvtmxdthienhoang\dvtmxdthienhoang.xslt" "%rootPublish%\210528_DVTMXDThienHoang_V5_AMDuc"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210528_DVTMXDThienHoang_V5_AMDuc.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210528_DVTMXDThienHoang_V5_AMDuc">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
