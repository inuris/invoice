set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210706_ThietKeXDTMChinCong_V5_AMBinhCdc"
copy "..\..\..\dist\thietkexdtmchincong\thietkexdtmchincong.xml" "%rootPublish%\210706_ThietKeXDTMChinCong_V5_AMBinhCdc"
copy "..\..\..\dist\thietkexdtmchincong\thietkexdtmchincong.xslt" "%rootPublish%\210706_ThietKeXDTMChinCong_V5_AMBinhCdc"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210706_ThietKeXDTMChinCong_V5_AMBinhCdc.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210706_ThietKeXDTMChinCong_V5_AMBinhCdc">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
