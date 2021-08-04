set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\201022_DichVuKyThuatPNK_V5_AMTrong"
copy "..\..\..\dist\dichvukythuatpnk\dichvukythuatpnk.xml" "%rootPublish%\201022_DichVuKyThuatPNK_V5_AMTrong"
copy "..\..\..\dist\dichvukythuatpnk\dichvukythuatpnk.xslt" "%rootPublish%\201022_DichVuKyThuatPNK_V5_AMTrong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("201022_DichVuKyThuatPNK_V5_AMTrong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\201022_DichVuKyThuatPNK_V5_AMTrong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
