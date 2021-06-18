set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210201_VungTauVilla_V5_AMHuong"
copy "..\..\..\dist\vungtauvilla\vungtauvilla.xml" "%rootPublish%\210201_VungTauVilla_V5_AMHuong"
copy "..\..\..\dist\vungtauvilla\vungtauvilla.xslt" "%rootPublish%\210201_VungTauVilla_V5_AMHuong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210201_VungTauVilla_V5_AMHuong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210201_VungTauVilla_V5_AMHuong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
