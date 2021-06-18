set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210608_NongSanPhucLoi_V5_AMBinh"
copy "..\..\..\dist\nongsanphucloi\nongsanphucloi.xml" "%rootPublish%\210608_NongSanPhucLoi_V5_AMBinh"
copy "..\..\..\dist\nongsanphucloi\nongsanphucloi.xslt" "%rootPublish%\210608_NongSanPhucLoi_V5_AMBinh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210608_NongSanPhucLoi_V5_AMBinh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210608_NongSanPhucLoi_V5_AMBinh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
