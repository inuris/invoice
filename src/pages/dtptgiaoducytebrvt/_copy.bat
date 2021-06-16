set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210406_DTPTGiaoDucYTeBRVT_V5_AMDuc"
copy "..\..\..\dist\dtptgiaoducytebrvt\dtptgiaoducytebrvt.xml" "%rootPublish%\210406_DTPTGiaoDucYTeBRVT_V5_AMDuc"
copy "..\..\..\dist\dtptgiaoducytebrvt\dtptgiaoducytebrvt.xslt" "%rootPublish%\210406_DTPTGiaoDucYTeBRVT_V5_AMDuc"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210406_DTPTGiaoDucYTeBRVT_V5_AMDuc.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210406_DTPTGiaoDucYTeBRVT_V5_AMDuc">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
