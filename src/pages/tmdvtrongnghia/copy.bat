set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\201215_TMDVTrongNghia_V5_AMThuy"
copy "..\..\..\dist\tmdvtrongnghia\tmdvtrongnghia.xml" "%rootPublish%\201215_TMDVTrongNghia_V5_AMThuy"
copy "..\..\..\dist\tmdvtrongnghia\tmdvtrongnghia.xslt" "%rootPublish%\201215_TMDVTrongNghia_V5_AMThuy"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("201215_TMDVTrongNghia_V5_AMThuy.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\201215_TMDVTrongNghia_V5_AMThuy">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
