set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210707_TuVanVaDTXDMinhPhuTrung_V5_AMBinhCdc"
copy "..\..\..\dist\tuvanvadtxdminhphutrung\tuvanvadtxdminhphutrung.xml" "%rootPublish%\210707_TuVanVaDTXDMinhPhuTrung_V5_AMBinhCdc"
copy "..\..\..\dist\tuvanvadtxdminhphutrung\tuvanvadtxdminhphutrung.xslt" "%rootPublish%\210707_TuVanVaDTXDMinhPhuTrung_V5_AMBinhCdc"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210707_TuVanVaDTXDMinhPhuTrung_V5_AMBinhCdc.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210707_TuVanVaDTXDMinhPhuTrung_V5_AMBinhCdc">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
