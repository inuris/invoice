set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210610_TMDVPVTech_V5_AMMinh"
copy "..\..\..\dist\tmdvpvtech\tmdvpvtech.xml" "%rootPublish%\210610_TMDVPVTech_V5_AMMinh"
copy "..\..\..\dist\tmdvpvtech\tmdvpvtech.xslt" "%rootPublish%\210610_TMDVPVTech_V5_AMMinh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210610_TMDVPVTech_V5_AMMinh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210610_TMDVPVTech_V5_AMMinh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
