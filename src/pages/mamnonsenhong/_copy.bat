set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210226_MamNonSenHong_V5_AMKhanh"
copy "..\..\..\dist\mamnonsenhong\mamnonsenhong.xml" "%rootPublish%\210226_MamNonSenHong_V5_AMKhanh"
copy "..\..\..\dist\mamnonsenhong\mamnonsenhong.xslt" "%rootPublish%\210226_MamNonSenHong_V5_AMKhanh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210226_MamNonSenHong_V5_AMKhanh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210226_MamNonSenHong_V5_AMKhanh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
