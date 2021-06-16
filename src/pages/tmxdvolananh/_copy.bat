set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\201228_TMXDVoLanAnh_V5_AMTuanAnh"
copy "..\..\..\dist\tmxdvolananh\tmxdvolananh.xml" "%rootPublish%\201228_TMXDVoLanAnh_V5_AMTuanAnh"
copy "..\..\..\dist\tmxdvolananh\tmxdvolananh.xslt" "%rootPublish%\201228_TMXDVoLanAnh_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("201228_TMXDVoLanAnh_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\201228_TMXDVoLanAnh_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
