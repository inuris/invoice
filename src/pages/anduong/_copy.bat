set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\200831_AnDuong_V5_AMTrong"
copy "..\..\..\dist\anduong\anduong.xml" "%rootPublish%\200831_AnDuong_V5_AMTrong"
copy "..\..\..\dist\anduong\anduong.xslt" "%rootPublish%\200831_AnDuong_V5_AMTrong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("200831_AnDuong_V5_AMTrong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\200831_AnDuong_V5_AMTrong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
