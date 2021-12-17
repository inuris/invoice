set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\201104_HungThai_V5_AMTrong"
copy "..\..\..\dist\hungthaidvhaucanthuysan\hungthaidvhaucanthuysan.xml" "%rootPublish%\201104_HungThai_V5_AMTrong"
copy "..\..\..\dist\hungthaidvhaucanthuysan\hungthaidvhaucanthuysan.xslt" "%rootPublish%\201104_HungThai_V5_AMTrong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("201104_HungThai_V5_AMTrong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\201104_HungThai_V5_AMTrong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
