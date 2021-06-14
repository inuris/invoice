set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210104_NghiepThienSinh_V5_AMLieu"
copy "..\..\..\dist\nghiepthiensinh\nghiepthiensinh.xml" "%rootPublish%\210104_NghiepThienSinh_V5_AMLieu"
copy "..\..\..\dist\nghiepthiensinh\nghiepthiensinh.xslt" "%rootPublish%\210104_NghiepThienSinh_V5_AMLieu"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210104_NghiepThienSinh_V5_AMLieu.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210104_NghiepThienSinh_V5_AMLieu">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "index.html.bak"
