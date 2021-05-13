set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210513_XepDoVanTaiPhuongNam_V5_AMThuy"
copy "..\..\..\dist\xepdovantaiphuongnam\xepdovantaiphuongnam.xml" "%rootPublish%\210513_XepDoVanTaiPhuongNam_V5_AMThuy"
copy "..\..\..\dist\xepdovantaiphuongnam\xepdovantaiphuongnam.xslt" "%rootPublish%\210513_XepDoVanTaiPhuongNam_V5_AMThuy"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210513_XepDoVanTaiPhuongNam_V5_AMThuy.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210513_XepDoVanTaiPhuongNam_V5_AMThuy">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
