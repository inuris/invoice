set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\191112_TamGiacVang_AMTrong"
copy "..\..\..\dist\tamgiacvang\tamgiacvang.xml" "%rootPublish%\191112_TamGiacVang_AMTrong"
copy "..\..\..\dist\tamgiacvang\tamgiacvang.xslt" "%rootPublish%\191112_TamGiacVang_AMTrong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("191112_TamGiacVang_AMTrong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\191112_TamGiacVang_AMTrong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
