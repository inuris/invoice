set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\201019_SonKimTran_V5_AMLieu"
copy "..\..\..\dist\sonkimtran\sonkimtran.xml" "%rootPublish%\201019_SonKimTran_V5_AMLieu"
copy "..\..\..\dist\sonkimtran\sonkimtran.xslt" "%rootPublish%\201019_SonKimTran_V5_AMLieu"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210614_SonKimTran_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\201019_SonKimTran_V5_AMLieu">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
