set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210630_DoiKhaiThacDaConDao_V5_AMKhanhConDao"
copy "..\..\..\dist\doikhaithacdacondao\doikhaithacdacondao.xml" "%rootPublish%\210630_DoiKhaiThacDaConDao_V5_AMKhanhConDao"
copy "..\..\..\dist\doikhaithacdacondao\doikhaithacdacondao.xslt" "%rootPublish%\210630_DoiKhaiThacDaConDao_V5_AMKhanhConDao"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210630_DoiKhaiThacDaConDao_V5_AMKhanhConDao.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210630_DoiKhaiThacDaConDao_V5_AMKhanhConDao">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
