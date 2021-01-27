set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210127_VanTaiHanhKhachSaoVang_V5_AMTan"
copy "..\..\..\dist\vantaihanhkhachsaovang\vantaihanhkhachsaovang.xml" "%rootPublish%\210127_VanTaiHanhKhachSaoVang_V5_AMTan"
copy "..\..\..\dist\vantaihanhkhachsaovang\vantaihanhkhachsaovang.xslt" "%rootPublish%\210127_VanTaiHanhKhachSaoVang_V5_AMTan"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210127_VanTaiHanhKhachSaoVang_V5_AMTan.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210127_VanTaiHanhKhachSaoVang_V5_AMTan">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
