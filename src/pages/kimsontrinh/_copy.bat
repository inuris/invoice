set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\220920_KimSonTrinh_3502241117"
copy "..\..\..\dist\kimsontrinh\kimsontrinh.xml" "%rootPublish%\220920_KimSonTrinh_3502241117"
copy "..\..\..\dist\kimsontrinh\kimsontrinh.xslt" "%rootPublish%\220920_KimSonTrinh_3502241117"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("220920_KimSonTrinh_3502241117.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\220920_KimSonTrinh_3502241117">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
