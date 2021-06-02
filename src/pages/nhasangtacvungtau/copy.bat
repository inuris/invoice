set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210601_NhaSangTacVungTau_V5_AMQHuong"
copy "..\..\..\dist\nhasangtacvungtau\nhasangtacvungtau.xml" "%rootPublish%\210601_NhaSangTacVungTau_V5_AMQHuong"
copy "..\..\..\dist\nhasangtacvungtau\nhasangtacvungtau.xslt" "%rootPublish%\210601_NhaSangTacVungTau_V5_AMQHuong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210601_NhaSangTacVungTau_V5_AMQHuong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210601_NhaSangTacVungTau_V5_AMQHuong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
