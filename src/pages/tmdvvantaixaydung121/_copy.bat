set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210609_TMDVVanTaiXayDung121_V5_AMOanh"
copy "..\..\..\dist\tmdvvantaixaydung121\tmdvvantaixaydung121.xml" "%rootPublish%\210609_TMDVVanTaiXayDung121_V5_AMOanh"
copy "..\..\..\dist\tmdvvantaixaydung121\tmdvvantaixaydung121.xslt" "%rootPublish%\210609_TMDVVanTaiXayDung121_V5_AMOanh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210609_TMDVVanTaiXayDung121_V5_AMOanh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210609_TMDVVanTaiXayDung121_V5_AMOanh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
