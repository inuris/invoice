set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\201124_CongThanhBaoNgoc_V5_AMLieu"
copy "..\..\..\dist\congthanhbaongoc\congthanhbaongoc.xml" "%rootPublish%\201124_CongThanhBaoNgoc_V5_AMLieu"
copy "..\..\..\dist\congthanhbaongoc\congthanhbaongoc.xslt" "%rootPublish%\201124_CongThanhBaoNgoc_V5_AMLieu"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("201124_CongThanhBaoNgoc_V5_AMLieu.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\201124_CongThanhBaoNgoc_V5_AMLieu">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
