set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210222_TMDVThaiPhuAn_V5_AMBinh"
copy "..\..\..\dist\tmdvthaiphuan\tmdvthaiphuan.xml" "%rootPublish%\210222_TMDVThaiPhuAn_V5_AMBinh"
copy "..\..\..\dist\tmdvthaiphuan\tmdvthaiphuan.xslt" "%rootPublish%\210222_TMDVThaiPhuAn_V5_AMBinh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210222_TMDVThaiPhuAn_V5_AMBinh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210222_TMDVThaiPhuAn_V5_AMBinh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
