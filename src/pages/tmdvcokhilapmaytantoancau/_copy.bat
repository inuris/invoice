set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210608_TMDVCoKhiLapMayTanToanCau_V5_AMQHuong"
copy "..\..\..\dist\tmdvcokhilapmaytantoancau\tmdvcokhilapmaytantoancau.xml" "%rootPublish%\210608_TMDVCoKhiLapMayTanToanCau_V5_AMQHuong"
copy "..\..\..\dist\tmdvcokhilapmaytantoancau\tmdvcokhilapmaytantoancau.xslt" "%rootPublish%\210608_TMDVCoKhiLapMayTanToanCau_V5_AMQHuong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210608_TMDVCoKhiLapMayTanToanCau_V5_AMQHuong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210608_TMDVCoKhiLapMayTanToanCau_V5_AMQHuong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
