set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210622_TTGDTXLongDienDatDo_V5_AMLieu"
copy "..\..\..\dist\ttgdtxlongdiendatdo\ttgdtxlongdiendatdo.xml" "%rootPublish%\210622_TTGDTXLongDienDatDo_V5_AMLieu"
copy "..\..\..\dist\ttgdtxlongdiendatdo\ttgdtxlongdiendatdo.xslt" "%rootPublish%\210622_TTGDTXLongDienDatDo_V5_AMLieu"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210622_TTGDTXLongDienDatDo_V5_AMLieu.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210622_TTGDTXLongDienDatDo_V5_AMLieu">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
