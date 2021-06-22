set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210622_QuangCaoThuongHieuCap_V5_AMChi"
copy "..\..\..\dist\quangcaothuonghieucap\quangcaothuonghieucap.xml" "%rootPublish%\210622_QuangCaoThuongHieuCap_V5_AMChi"
copy "..\..\..\dist\quangcaothuonghieucap\quangcaothuonghieucap.xslt" "%rootPublish%\210622_QuangCaoThuongHieuCap_V5_AMChi"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210622_QuangCaoThuongHieuCap_V5_AMChi.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210622_QuangCaoThuongHieuCap_V5_AMChi">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
