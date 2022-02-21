set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\220223_VanTaiQuangHung_V5_AMTrong"
copy "..\..\..\dist\vantaiquanghung\vantaiquanghung.xml" "%rootPublish%\220223_VanTaiQuangHung_V5_AMTrong"
copy "..\..\..\dist\vantaiquanghung\vantaiquanghung.xslt" "%rootPublish%\220223_VanTaiQuangHung_V5_AMTrong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("220223_VanTaiQuangHung_V5_AMTrong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\220223_VanTaiQuangHung_V5_AMTrong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
