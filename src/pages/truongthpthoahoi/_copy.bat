set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\220306_TruongThptHoaHoi_V5_AMTuanAnh"
copy "..\..\..\dist\truongthpthoahoi\truongthpthoahoi.xml" "%rootPublish%\220306_TruongThptHoaHoi_V5_AMTuanAnh"
copy "..\..\..\dist\truongthpthoahoi\truongthpthoahoi.xslt" "%rootPublish%\220306_TruongThptHoaHoi_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("220306_TruongThptHoaHoi_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\220306_TruongThptHoaHoi_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
