set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210118_PhanPhoiPhuAn_V5_AMLieu"
copy "..\..\..\dist\phanphoiphuan\phanphoiphuan.xml" "%rootPublish%\210118_PhanPhoiPhuAn_V5_AMLieu"
copy "..\..\..\dist\phanphoiphuan\phanphoiphuan.xslt" "%rootPublish%\210118_PhanPhoiPhuAn_V5_AMLieu"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210118_PhanPhoiPhuAn_V5_AMLieu.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210118_PhanPhoiPhuAn_V5_AMLieu">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
