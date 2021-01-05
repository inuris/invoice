set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210105_TMDVDLThuanAnPhat_V5_AMTuanAnh"
copy "..\..\..\dist\tmdvdlthuananphat\tmdvdlthuananphat.xml" "%rootPublish%\210105_TMDVDLThuanAnPhat_V5_AMTuanAnh"
copy "..\..\..\dist\tmdvdlthuananphat\tmdvdlthuananphat.xslt" "%rootPublish%\210105_TMDVDLThuanAnPhat_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210105_TMDVDLThuanAnPhat_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210105_TMDVDLThuanAnPhat_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
