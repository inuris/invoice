set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210713_BaiBienHoTram_V5_AMTuanAnh"
copy "..\..\..\dist\baibienhotram\baibienhotram.xml" "%rootPublish%\210713_BaiBienHoTram_V5_AMTuanAnh"
copy "..\..\..\dist\baibienhotram\baibienhotram.xslt" "%rootPublish%\210713_BaiBienHoTram_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210713_BaiBienHoTram_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210713_BaiBienHoTram_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
