set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210203_THCSKimLong_V5_AMBinh"
copy "..\..\..\dist\thcskimlong\thcskimlong.xml" "%rootPublish%\210203_THCSKimLong_V5_AMBinh"
copy "..\..\..\dist\thcskimlong\thcskimlong.xslt" "%rootPublish%\210203_THCSKimLong_V5_AMBinh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210203_THCSKimLong_V5_AMBinh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210203_THCSKimLong_V5_AMBinh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
