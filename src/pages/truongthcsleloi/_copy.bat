set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\211208_TruongThcsLeLoi_V5_AMBinhCdc"
copy "..\..\..\dist\truongthcsleloi\truongthcsleloi.xml" "%rootPublish%\211208_TruongThcsLeLoi_V5_AMBinhCdc"
copy "..\..\..\dist\truongthcsleloi\truongthcsleloi.xslt" "%rootPublish%\211208_TruongThcsLeLoi_V5_AMBinhCdc"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("211208_TruongThcsLeLoi_V5_AMBinhCdc.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\211208_TruongThcsLeLoi_V5_AMBinhCdc">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
