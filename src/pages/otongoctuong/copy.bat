set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210415_OToNgocTuong_V5_AMTuanAnh"
copy "..\..\..\dist\otongoctuong\otongoctuong.xml" "%rootPublish%\210415_OToNgocTuong_V5_AMTuanAnh"
copy "..\..\..\dist\otongoctuong\otongoctuong.xslt" "%rootPublish%\210415_OToNgocTuong_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210415_OToNgocTuong_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210415_OToNgocTuong_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
