set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\210714_TruongTHCSChauDuc_V5_AMBinhCdc"
copy "..\..\..\dist\truongthcschauduc\truongthcschauduc.xml" "%rootPublish%\210714_TruongTHCSChauDuc_V5_AMBinhCdc"
copy "..\..\..\dist\truongthcschauduc\truongthcschauduc.xslt" "%rootPublish%\210714_TruongTHCSChauDuc_V5_AMBinhCdc"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("210714_TruongTHCSChauDuc_V5_AMBinhCdc.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\210714_TruongTHCSChauDuc_V5_AMBinhCdc">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
