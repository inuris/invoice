set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210106_TMVLXDVinhLam_V5_AMTan"
copy "..\..\..\dist\tmvlxdvinhlam\tmvlxdvinhlam.xml" "%rootPublish%\210106_TMVLXDVinhLam_V5_AMTan"
copy "..\..\..\dist\tmvlxdvinhlam\tmvlxdvinhlam.xslt" "%rootPublish%\210106_TMVLXDVinhLam_V5_AMTan"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210106_TMVLXDVinhLam_V5_AMTan.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210106_TMVLXDVinhLam_V5_AMTan">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
