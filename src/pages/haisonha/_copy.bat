set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210630_HaiSonHa_V5_AMBinh"
copy "..\..\..\dist\haisonha\haisonha.xml" "%rootPublish%\210630_HaiSonHa_V5_AMBinh"
copy "..\..\..\dist\haisonha\haisonha.xslt" "%rootPublish%\210630_HaiSonHa_V5_AMBinh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210630_HaiSonHa_V5_AMBinh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210630_HaiSonHa_V5_AMBinh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
