set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210707_UBNDXaXuyenMoc_V5_AMTuanAnh"
copy "..\..\..\dist\ubndxaxuyenmoc\ubndxaxuyenmoc.xml" "%rootPublish%\210707_UBNDXaXuyenMoc_V5_AMTuanAnh"
copy "..\..\..\dist\ubndxaxuyenmoc\ubndxaxuyenmoc.xslt" "%rootPublish%\210707_UBNDXaXuyenMoc_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210707_UBNDXaXuyenMoc_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210707_UBNDXaXuyenMoc_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
