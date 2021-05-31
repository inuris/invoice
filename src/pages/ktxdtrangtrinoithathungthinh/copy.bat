set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210531_KTXDTrangTriNoiThatHungThinh_V5_AMDuc"
copy "..\..\..\dist\ktxdtrangtrinoithathungthinh\ktxdtrangtrinoithathungthinh.xml" "%rootPublish%\210531_KTXDTrangTriNoiThatHungThinh_V5_AMDuc"
copy "..\..\..\dist\ktxdtrangtrinoithathungthinh\ktxdtrangtrinoithathungthinh.xslt" "%rootPublish%\210531_KTXDTrangTriNoiThatHungThinh_V5_AMDuc"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210531_KTXDTrangTriNoiThatHungThinh_V5_AMDuc.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210531_KTXDTrangTriNoiThatHungThinh_V5_AMDuc">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
