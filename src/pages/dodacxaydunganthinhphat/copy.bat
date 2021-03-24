set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210324_DoDacXayDungAnThinhPhat_V5_AMOanh"
copy "..\..\..\dist\dodacxaydunganthinhphat\dodacxaydunganthinhphat.xml" "%rootPublish%\210324_DoDacXayDungAnThinhPhat_V5_AMOanh"
copy "..\..\..\dist\dodacxaydunganthinhphat\dodacxaydunganthinhphat.xslt" "%rootPublish%\210324_DoDacXayDungAnThinhPhat_V5_AMOanh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210324_DoDacXayDungAnThinhPhat_V5_AMOanh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210324_DoDacXayDungAnThinhPhat_V5_AMOanh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
