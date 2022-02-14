set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\201207_TMXDAnGiaViet_V5_AMTrong"
copy "..\..\..\dist\tmxdangiaviet\tmxdangiaviet.xml" "%rootPublish%\201207_TMXDAnGiaViet_V5_AMTrong"
copy "..\..\..\dist\tmxdangiaviet\tmxdangiaviet.xslt" "%rootPublish%\201207_TMXDAnGiaViet_V5_AMTrong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("201207_TMXDAnGiaViet_V5_AMTrong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\201207_TMXDAnGiaViet_V5_AMTrong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
