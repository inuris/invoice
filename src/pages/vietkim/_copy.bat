set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\200827_VietKim_V5_AMLieu"
copy "..\..\..\dist\vietkim\vietkim.xml" "%rootPublish%\200827_VietKim_V5_AMLieu"
copy "..\..\..\dist\vietkim\vietkim.xslt" "%rootPublish%\200827_VietKim_V5_AMLieu"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("200827_VietKim_V5_AMLieu.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\200827_VietKim_V5_AMLieu">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
