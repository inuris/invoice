set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210603_XDNguyenMinhChau_V5_AMTuanAnh"
copy "..\..\..\dist\xdnguyenminhchau\xdnguyenminhchau.xml" "%rootPublish%\210603_XDNguyenMinhChau_V5_AMTuanAnh"
copy "..\..\..\dist\xdnguyenminhchau\xdnguyenminhchau.xslt" "%rootPublish%\210603_XDNguyenMinhChau_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210603_XDNguyenMinhChau_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210603_XDNguyenMinhChau_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
