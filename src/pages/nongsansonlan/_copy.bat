set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210222_NongSanSonLan_V5_AMBinh"
copy "..\..\..\dist\nongsansonlan\nongsansonlan.xml" "%rootPublish%\210222_NongSanSonLan_V5_AMBinh"
copy "..\..\..\dist\nongsansonlan\nongsansonlan.xslt" "%rootPublish%\210222_NongSanSonLan_V5_AMBinh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210222_NongSanSonLan_V5_AMBinh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210222_NongSanSonLan_V5_AMBinh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
