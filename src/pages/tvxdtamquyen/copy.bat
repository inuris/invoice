set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210106_TVXDTamQuyen_V5_AMBinh"
copy "..\..\..\dist\tvxdtamquyen\tvxdtamquyen.xml" "%rootPublish%\210106_TVXDTamQuyen_V5_AMBinh"
copy "..\..\..\dist\tvxdtamquyen\tvxdtamquyen.xslt" "%rootPublish%\210106_TVXDTamQuyen_V5_AMBinh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210106_TVXDTamQuyen_V5_AMBinh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210106_TVXDTamQuyen_V5_AMBinh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
