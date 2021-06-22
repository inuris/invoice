set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210616_LanNgoc_V5_AMBichHang"
copy "..\..\..\dist\lanngoc\lanngoc.xml" "%rootPublish%\210616_LanNgoc_V5_AMBichHang"
copy "..\..\..\dist\lanngoc\lanngoc.xslt" "%rootPublish%\210616_LanNgoc_V5_AMBichHang"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210616_LanNgoc_V5_AMBichHang.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210616_LanNgoc_V5_AMBichHang">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
