set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210208_AnhTram_V5_AMTrong"
copy "..\..\..\dist\anhtram\anhtram.xml" "%rootPublish%\210208_AnhTram_V5_AMTrong"
copy "..\..\..\dist\anhtram\anhtram.xslt" "%rootPublish%\210208_AnhTram_V5_AMTrong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210208_AnhTram_V5_AMTrong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210208_AnhTram_V5_AMTrong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
