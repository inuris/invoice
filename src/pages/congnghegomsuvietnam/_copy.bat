set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210707_CongNgheGomSuVietNam_V5_AMBinhCdc"
copy "..\..\..\dist\congnghegomsuvietnam\congnghegomsuvietnam.xml" "%rootPublish%\210707_CongNgheGomSuVietNam_V5_AMBinhCdc"
copy "..\..\..\dist\congnghegomsuvietnam\congnghegomsuvietnam.xslt" "%rootPublish%\210707_CongNgheGomSuVietNam_V5_AMBinhCdc"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210707_CongNgheGomSuVietNam_V5_AMBinhCdc.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210707_CongNgheGomSuVietNam_V5_AMBinhCdc">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
