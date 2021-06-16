set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210609_KyThuatThangNhat_V5_AMQHuong"
copy "..\..\..\dist\kythuatthangnhat\kythuatthangnhat.xml" "%rootPublish%\210609_KyThuatThangNhat_V5_AMQHuong"
copy "..\..\..\dist\kythuatthangnhat\kythuatthangnhat.xslt" "%rootPublish%\210609_KyThuatThangNhat_V5_AMQHuong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210609_KyThuatThangNhat_V5_AMQHuong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210609_KyThuatThangNhat_V5_AMQHuong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
