set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\190705_PhongThao_V3_AMTuanAnh"
copy "..\..\..\dist\phongthao\phongthao.xml" "%rootPublish%\190705_PhongThao_V3_AMTuanAnh"
copy "..\..\..\dist\phongthao\phongthao.xslt" "%rootPublish%\190705_PhongThao_V3_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("190705_PhongThao_V3_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\190705_PhongThao_V3_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
