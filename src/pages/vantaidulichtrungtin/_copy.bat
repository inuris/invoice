set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\200911_VanTaiDuLichTrungTin_V5_AMTan"
copy "..\..\..\dist\vantaidulichtrungtin\vantaidulichtrungtin.xml" "%rootPublish%\200911_VanTaiDuLichTrungTin_V5_AMTan"
copy "..\..\..\dist\vantaidulichtrungtin\vantaidulichtrungtin.xslt" "%rootPublish%\200911_VanTaiDuLichTrungTin_V5_AMTan"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("200911_VanTaiDuLichTrungTin_V5_AMTan.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\200911_VanTaiDuLichTrungTin_V5_AMTan">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
