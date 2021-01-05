set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210105_DTTMHungAnNam_V5_AMTan"
copy "..\..\..\dist\dttmhungannam\dttmhungannam.xml" "%rootPublish%\210105_DTTMHungAnNam_V5_AMTan"
copy "..\..\..\dist\dttmhungannam\dttmhungannam.xslt" "%rootPublish%\210105_DTTMHungAnNam_V5_AMTan"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210105_DTTMHungAnNam_V5_AMTan.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210105_DTTMHungAnNam_V5_AMTan">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
