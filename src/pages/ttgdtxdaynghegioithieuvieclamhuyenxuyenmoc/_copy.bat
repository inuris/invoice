set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\211206_TTGDTXDayNgheGioiThieuViecLamHuyenXuyenMoc_V5_AMTuanAnh"
copy "..\..\..\dist\ttgdtxdaynghegioithieuvieclamhuyenxuyenmoc\ttgdtxdaynghegioithieuvieclamhuyenxuyenmoc.xml" "%rootPublish%\211206_TTGDTXDayNgheGioiThieuViecLamHuyenXuyenMoc_V5_AMTuanAnh"
copy "..\..\..\dist\ttgdtxdaynghegioithieuvieclamhuyenxuyenmoc\ttgdtxdaynghegioithieuvieclamhuyenxuyenmoc.xslt" "%rootPublish%\211206_TTGDTXDayNgheGioiThieuViecLamHuyenXuyenMoc_V5_AMTuanAnh"
echo Set oWS = WScript.CreateObject("WScript.Shell")>CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut("211206_TTGDTXDayNgheGioiThieuViecLamHuyenXuyenMoc_V5_AMTuanAnh.lnk")>>CreateShortcut.vbs
echo oLink.TargetPath = "%rootPublish%\211206_TTGDTXDayNgheGioiThieuViecLamHuyenXuyenMoc_V5_AMTuanAnh">>CreateShortcut.vbs
echo oLink.Save>>CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
ren "index.html" "_index.html"
