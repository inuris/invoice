set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210316_SXTMDVTaiPhatLoc_V5_AMThuy"
copy "..\..\..\dist\sxtmdvtaiphatloc\sxtmdvtaiphatloc.xml" "%rootPublish%\210316_SXTMDVTaiPhatLoc_V5_AMThuy"
copy "..\..\..\dist\sxtmdvtaiphatloc\sxtmdvtaiphatloc.xslt" "%rootPublish%\210316_SXTMDVTaiPhatLoc_V5_AMThuy"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210316_SXTMDVTaiPhatLoc_V5_AMThuy.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210316_SXTMDVTaiPhatLoc_V5_AMThuy">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
