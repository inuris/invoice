set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\201210_DienGiaDungHaiLinh_V5_AMBinh"
copy "..\..\..\dist\diengiadunghailinh\diengiadunghailinh.xml" "%rootPublish%\201210_DienGiaDungHaiLinh_V5_AMBinh"
copy "..\..\..\dist\diengiadunghailinh\diengiadunghailinh.xslt" "%rootPublish%\201210_DienGiaDungHaiLinh_V5_AMBinh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("201210_DienGiaDungHaiLinh_V5_AMBinh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\201210_DienGiaDungHaiLinh_V5_AMBinh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
