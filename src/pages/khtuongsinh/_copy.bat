set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210618_KHTuongSinh_V5_AMLieu"
copy "..\..\..\dist\khtuongsinh\khtuongsinh.xml" "%rootPublish%\210618_KHTuongSinh_V5_AMLieu"
copy "..\..\..\dist\khtuongsinh\khtuongsinh.xslt" "%rootPublish%\210618_KHTuongSinh_V5_AMLieu"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210618_KHTuongSinh_V5_AMLieu.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210618_KHTuongSinh_V5_AMLieu">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
