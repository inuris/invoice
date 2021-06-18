set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210603_DVTMGPCNHuynhGia_V5_AMHuong"
copy "..\..\..\dist\dvtmgpcnhuynhgia\dvtmgpcnhuynhgia.xml" "%rootPublish%\210603_DVTMGPCNHuynhGia_V5_AMHuong"
copy "..\..\..\dist\dvtmgpcnhuynhgia\dvtmgpcnhuynhgia.xslt" "%rootPublish%\210603_DVTMGPCNHuynhGia_V5_AMHuong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210603_DVTMGPCNHuynhGia_V5_AMHuong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210603_DVTMGPCNHuynhGia_V5_AMHuong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
