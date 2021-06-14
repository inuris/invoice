set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210407_MocTanPhat_V5_AMTrong"
copy "..\..\..\dist\moctanphat\moctanphat.xml" "%rootPublish%\210407_MocTanPhat_V5_AMTrong"
copy "..\..\..\dist\moctanphat\moctanphat.xslt" "%rootPublish%\210407_MocTanPhat_V5_AMTrong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210407_MocTanPhat_V5_AMTrong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210407_MocTanPhat_V5_AMTrong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
