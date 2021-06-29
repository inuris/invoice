set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210630_TMDVXDThanhTam_V5_AMTuanAnh"
copy "..\..\..\dist\tmdvxdthanhtam\tmdvxdthanhtam.xml" "%rootPublish%\210630_TMDVXDThanhTam_V5_AMTuanAnh"
copy "..\..\..\dist\tmdvxdthanhtam\tmdvxdthanhtam.xslt" "%rootPublish%\210630_TMDVXDThanhTam_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210630_TMDVXDThanhTam_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210630_TMDVXDThanhTam_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
