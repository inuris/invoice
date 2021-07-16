set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210719_ThuySanTienLoi_V5_AMKhanhConDao"
copy "..\..\..\dist\thuysantienloi\thuysantienloi.xml" "%rootPublish%\210719_ThuySanTienLoi_V5_AMKhanhConDao"
copy "..\..\..\dist\thuysantienloi\thuysantienloi.xslt" "%rootPublish%\210719_ThuySanTienLoi_V5_AMKhanhConDao"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210719_ThuySanTienLoi_V5_AMKhanhConDao.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210719_ThuySanTienLoi_V5_AMKhanhConDao">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
