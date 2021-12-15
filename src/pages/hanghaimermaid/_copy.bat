set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\200824_HangHaiMermaid_V5_AMTrong"
copy "..\..\..\dist\hanghaimermaid\hanghaimermaid.xml" "%rootPublish%\200824_HangHaiMermaid_V5_AMTrong"
copy "..\..\..\dist\hanghaimermaid\hanghaimermaid.xslt" "%rootPublish%\200824_HangHaiMermaid_V5_AMTrong"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("200824_HangHaiMermaid_V5_AMTrong.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\200824_HangHaiMermaid_V5_AMTrong">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
