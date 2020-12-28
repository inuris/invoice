set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\201225_SachThietBiTruongHoc_V5_AMTrong"
copy "..\..\..\dist\sachthietbitruonghoc\sachthietbitruonghoc.xml" "%rootPublish%\201225_SachThietBiTruongHoc_V5_AMTrong"
copy "..\..\..\dist\sachthietbitruonghoc\sachthietbitruonghoc.xslt" "%rootPublish%\201225_SachThietBiTruongHoc_V5_AMTrong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("201225_SachThietBiTruongHoc_V5_AMTrong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\201225_SachThietBiTruongHoc_V5_AMTrong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
