set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210704_VanPhongLuatSuThienTuong_V5_AMTuanAnh"
copy "..\..\..\dist\vanphongluatsuthientuong\vanphongluatsuthientuong.xml" "%rootPublish%\210704_VanPhongLuatSuThienTuong_V5_AMTuanAnh"
copy "..\..\..\dist\vanphongluatsuthientuong\vanphongluatsuthientuong.xslt" "%rootPublish%\210704_VanPhongLuatSuThienTuong_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210704_VanPhongLuatSuThienTuong_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210704_VanPhongLuatSuThienTuong_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
