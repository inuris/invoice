set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\191111_TaxiBaRia_AMMinh"
copy "..\..\..\dist\taxibaria\taxibaria.xml" "%rootPublish%\191111_TaxiBaRia_AMMinh"
copy "..\..\..\dist\taxibaria\taxibaria.xslt" "%rootPublish%\191111_TaxiBaRia_AMMinh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("191111_TaxiBaRia_AMMinh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\191111_TaxiBaRia_AMMinh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
