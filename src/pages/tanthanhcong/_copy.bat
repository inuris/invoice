set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210526_TanThanhCong_HSM_V5_AMTrong"
copy "..\..\..\dist\tanthanhcong\tanthanhcong.xml" "%rootPublish%\210526_TanThanhCong_HSM_V5_AMTrong"
copy "..\..\..\dist\tanthanhcong\tanthanhcong.xslt" "%rootPublish%\210526_TanThanhCong_HSM_V5_AMTrong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210526_TanThanhCong_HSM_V5_AMTrong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210526_TanThanhCong_HSM_V5_AMTrong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
