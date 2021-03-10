set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210311_DTXDDiaOcDucPhuc_V5_AMLieu"
copy "..\..\..\dist\dtxddiaocducphuc\dtxddiaocducphuc.xml" "%rootPublish%\210311_DTXDDiaOcDucPhuc_V5_AMLieu"
copy "..\..\..\dist\dtxddiaocducphuc\dtxddiaocducphuc.xslt" "%rootPublish%\210311_DTXDDiaOcDucPhuc_V5_AMLieu"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210311_DTXDDiaOcDucPhuc_V5_AMLieu.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210311_DTXDDiaOcDucPhuc_V5_AMLieu">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
