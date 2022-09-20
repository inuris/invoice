set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\220920_TiemVangNguyetCuong_3502239478"
copy "..\..\..\dist\tiemvangnguyetcuong\tiemvangnguyetcuong.xml" "%rootPublish%\220920_TiemVangNguyetCuong_3502239478"
copy "..\..\..\dist\tiemvangnguyetcuong\tiemvangnguyetcuong.xslt" "%rootPublish%\220920_TiemVangNguyetCuong_3502239478"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("220920_TiemVangNguyetCuong_3502239478.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\220920_TiemVangNguyetCuong_3502239478">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
