set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210505_PhamHongThai_V5_AMTuanAnh"
copy "..\..\..\dist\phamhongthai\phamhongthai.xml" "%rootPublish%\210505_PhamHongThai_V5_AMTuanAnh"
copy "..\..\..\dist\phamhongthai\phamhongthai.xslt" "%rootPublish%\210505_PhamHongThai_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210505_PhamHongThai_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210505_PhamHongThai_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
