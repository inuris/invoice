set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210527_DTPTDinhVang_V5_AMTan"
copy "..\..\..\dist\dtptdinhvang\dtptdinhvang.xml" "%rootPublish%\210527_DTPTDinhVang_V5_AMTan"
copy "..\..\..\dist\dtptdinhvang\dtptdinhvang.xslt" "%rootPublish%\210527_DTPTDinhVang_V5_AMTan"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210527_DTPTDinhVang_V5_AMTan.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210527_DTPTDinhVang_V5_AMTan">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
