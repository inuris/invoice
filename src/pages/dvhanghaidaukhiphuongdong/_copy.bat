set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210304_DVHangHaiDauKhiPhuongDong_V5_AMTrong"
copy "..\..\..\dist\dvhanghaidaukhiphuongdong\dvhanghaidaukhiphuongdong.xml" "%rootPublish%\210304_DVHangHaiDauKhiPhuongDong_V5_AMTrong"
copy "..\..\..\dist\dvhanghaidaukhiphuongdong\dvhanghaidaukhiphuongdong.xslt" "%rootPublish%\210304_DVHangHaiDauKhiPhuongDong_V5_AMTrong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210304_DVHangHaiDauKhiPhuongDong_V5_AMTrong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210304_DVHangHaiDauKhiPhuongDong_V5_AMTrong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
