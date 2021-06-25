set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210704_DaoTaoAnhNguButVang_V5_AMLieu"
copy "..\..\..\dist\daotaoanhngubutvang\daotaoanhngubutvang.xml" "%rootPublish%\210704_DaoTaoAnhNguButVang_V5_AMLieu"
copy "..\..\..\dist\daotaoanhngubutvang\daotaoanhngubutvang.xslt" "%rootPublish%\210704_DaoTaoAnhNguButVang_V5_AMLieu"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210704_DaoTaoAnhNguButVang_V5_AMLieu.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210704_DaoTaoAnhNguButVang_V5_AMLieu">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
