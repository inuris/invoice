set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210409_DTSXThanhNghia_V5_AMTan"
copy "..\..\..\dist\dtsxthanhnghia\dtsxthanhnghia.xml" "%rootPublish%\210409_DTSXThanhNghia_V5_AMTan"
copy "..\..\..\dist\dtsxthanhnghia\dtsxthanhnghia.xslt" "%rootPublish%\210409_DTSXThanhNghia_V5_AMTan"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210409_DTSXThanhNghia_V5_AMTan.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210409_DTSXThanhNghia_V5_AMTan">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
