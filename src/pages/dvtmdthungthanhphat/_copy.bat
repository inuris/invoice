set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210520_DVTMDTHungThanhPhat_V5_AMTuanAnh"
copy "..\..\..\dist\dvtmdthungthanhphat\dvtmdthungthanhphat.xml" "%rootPublish%\210520_DVTMDTHungThanhPhat_V5_AMTuanAnh"
copy "..\..\..\dist\dvtmdthungthanhphat\dvtmdthungthanhphat.xslt" "%rootPublish%\210520_DVTMDTHungThanhPhat_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210520_DVTMDTHungThanhPhat_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210520_DVTMDTHungThanhPhat_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
