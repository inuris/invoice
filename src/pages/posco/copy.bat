set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\201117_Posco_V5_AMTrong"
copy "..\..\..\dist\posco\posco.xml" "%rootPublish%\201117_Posco_V5_AMTrong"
copy "..\..\..\dist\posco\posco.xslt" "%rootPublish%\201117_Posco_V5_AMTrong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("201117_Posco_V5_AMTrong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\201117_Posco_V5_AMTrong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
