set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210705_XDTMHoangNhatMinh_V5_AMOanhBra"
copy "..\..\..\dist\xdtmhoangnhatminh\xdtmhoangnhatminh.xml" "%rootPublish%\210705_XDTMHoangNhatMinh_V5_AMOanhBra"
copy "..\..\..\dist\xdtmhoangnhatminh\xdtmhoangnhatminh.xslt" "%rootPublish%\210705_XDTMHoangNhatMinh_V5_AMOanhBra"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210705_XDTMHoangNhatMinh_V5_AMOanhBra.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210705_XDTMHoangNhatMinh_V5_AMOanhBra">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
