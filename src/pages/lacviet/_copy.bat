set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\200619_LacViet_HCM_ImperialGroup_Token_V3_AMTrong"
copy "..\..\..\dist\lacviet\lacviet.xml" "%rootPublish%\200619_LacViet_HCM_ImperialGroup_Token_V3_AMTrong"
copy "..\..\..\dist\lacviet\lacviet.xslt" "%rootPublish%\200619_LacViet_HCM_ImperialGroup_Token_V3_AMTrong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("200619_LacViet_HCM_ImperialGroup_Token_V3_AMTrong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\200619_LacViet_HCM_ImperialGroup_Token_V3_AMTrong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
