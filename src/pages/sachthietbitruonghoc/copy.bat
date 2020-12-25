set /p rootPublish=<..\..\..\copy.cfg
md "%rootPublish%\201225_SachThietBiTruongHoc_V5_AMTrong"
copy "..\..\..\dist\sachthietbitruonghoc\sachthietbitruonghoc.xml" "%rootPublish%\201225_SachThietBiTruongHoc_V5_AMTrong"
copy "..\..\..\dist\sachthietbitruonghoc\sachthietbitruonghoc.xslt" "%rootPublish%\201225_SachThietBiTruongHoc_V5_AMTrong"
