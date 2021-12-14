set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\191030_TienLoc_AMTrong"
copy "..\..\..\dist\tienloc\tienloc.xml" "%rootPublish%\191030_TienLoc_AMTrong"
copy "..\..\..\dist\tienloc\tienloc.xslt" "%rootPublish%\191030_TienLoc_AMTrong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("191030_TienLoc_AMTrong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\191030_TienLoc_AMTrong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
