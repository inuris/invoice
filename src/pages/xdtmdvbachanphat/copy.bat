set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210413_XDTMDVBachAnPhat_V5_AMTuanAnh"
copy "..\..\..\dist\xdtmdvbachanphat\xdtmdvbachanphat.xml" "%rootPublish%\210413_XDTMDVBachAnPhat_V5_AMTuanAnh"
copy "..\..\..\dist\xdtmdvbachanphat\xdtmdvbachanphat.xslt" "%rootPublish%\210413_XDTMDVBachAnPhat_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210413_XDTMDVBachAnPhat_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210413_XDTMDVBachAnPhat_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
