set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210520_DTSXTMDVHoangThinh_V5_AMDuc"
copy "..\..\..\dist\dtsxtmdvhoangthinh\dtsxtmdvhoangthinh.xml" "%rootPublish%\210520_DTSXTMDVHoangThinh_V5_AMDuc"
copy "..\..\..\dist\dtsxtmdvhoangthinh\dtsxtmdvhoangthinh.xslt" "%rootPublish%\210520_DTSXTMDVHoangThinh_V5_AMDuc"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210520_DTSXTMDVHoangThinh_V5_AMDuc.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210520_DTSXTMDVHoangThinh_V5_AMDuc">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
