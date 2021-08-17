set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210819_CNCTCPSuatAnCongNghiepSGTaiBRVT_V5_AMTrong"
copy "..\..\..\dist\cnctcpsuatancongnghiepsaigontaibrvt\cnctcpsuatancongnghiepsaigontaibrvt.xml" "%rootPublish%\210819_CNCTCPSuatAnCongNghiepSGTaiBRVT_V5_AMTrong"
copy "..\..\..\dist\cnctcpsuatancongnghiepsaigontaibrvt\cnctcpsuatancongnghiepsaigontaibrvt.xslt" "%rootPublish%\210819_CNCTCPSuatAnCongNghiepSGTaiBRVT_V5_AMTrong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210819_CNCTCPSuatAnCongNghiepSGTaiBRVT_V5_AMTrong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210819_CNCTCPSuatAnCongNghiepSGTaiBRVT_V5_AMTrong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
