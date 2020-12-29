set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\201228_BQLChoDatDo_V5_AMLieu"
copy "..\..\..\dist\bqlchodatdo\bqlchodatdo.xml" "%rootPublish%\201228_BQLChoDatDo_V5_AMLieu"
copy "..\..\..\dist\bqlchodatdo\bqlchodatdo.xslt" "%rootPublish%\201228_BQLChoDatDo_V5_AMLieu"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("201228_BQLChoDatDo_V5_AMLieu.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\201228_BQLChoDatDo_V5_AMLieu">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
