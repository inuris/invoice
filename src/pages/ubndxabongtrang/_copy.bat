set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210708_UBNDXaBongTrang_V5_AMTuanAnh"
copy "..\..\..\dist\ubndxabongtrang\ubndxabongtrang.xml" "%rootPublish%\210708_UBNDXaBongTrang_V5_AMTuanAnh"
copy "..\..\..\dist\ubndxabongtrang\ubndxabongtrang.xslt" "%rootPublish%\210708_UBNDXaBongTrang_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210708_UBNDXaBongTrang_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210708_UBNDXaBongTrang_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
