set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210119_PhuongThuan_V5_AMTan"
copy "..\..\..\dist\phuongthuan\phuongthuan.xml" "%rootPublish%\210119_PhuongThuan_V5_AMTan"
copy "..\..\..\dist\phuongthuan\phuongthuan.xslt" "%rootPublish%\210119_PhuongThuan_V5_AMTan"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210119_PhuongThuan_V5_AMTan.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210119_PhuongThuan_V5_AMTan">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
