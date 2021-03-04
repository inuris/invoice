set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210301_BQLCangCaHuyenLongDien_V5_AMLieu"
copy "..\..\..\dist\bqlcangcahuyenlongdien\bqlcangcahuyenlongdien.xml" "%rootPublish%\210301_BQLCangCaHuyenLongDien_V5_AMLieu"
copy "..\..\..\dist\bqlcangcahuyenlongdien\bqlcangcahuyenlongdien.xslt" "%rootPublish%\210301_BQLCangCaHuyenLongDien_V5_AMLieu"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210301_BQLCangCaHuyenLongDien_V5_AMLieu.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210301_BQLCangCaHuyenLongDien_V5_AMLieu">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
