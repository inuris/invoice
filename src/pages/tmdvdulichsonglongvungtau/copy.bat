set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210531_TMDVDuLichSongLongVungTau_V5_AMTuanAnh"
copy "..\..\..\dist\tmdvdulichsonglongvungtau\tmdvdulichsonglongvungtau.xml" "%rootPublish%\210531_TMDVDuLichSongLongVungTau_V5_AMTuanAnh"
copy "..\..\..\dist\tmdvdulichsonglongvungtau\tmdvdulichsonglongvungtau.xslt" "%rootPublish%\210531_TMDVDuLichSongLongVungTau_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210531_TMDVDuLichSongLongVungTau_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210531_TMDVDuLichSongLongVungTau_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
