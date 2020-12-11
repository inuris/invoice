@echo off
cls
echo 1. TuanAnh_Tan_Binh
echo 2. Lieu_Khanh
echo 3. Trong (Don ngu)
echo 4. Trong (Song ngu)
echo 5. Trong Dich vu (Don ngu)
echo 6. Trong Dich vu (Song ngu)
echo 7. Ban hang A5
echo 8. Ban hang A4
echo 9. Truong hoc

set /p code=Code name:
set /p t=Choose template:

if "%t%"=="1" set template=_template_tuananh_tan_binh
if "%t%"=="2" set template=_template_lieu_khanh
if "%t%"=="3" set template=_template_trong_donngu
if "%t%"=="4" set template=_template_trong_songngu
if "%t%"=="5" set template=_template_trong_dichvu_donngu
if "%t%"=="6" set template=_template_trong_dichvu_songngu
if "%t%"=="7" set template=_template_banhang_a5
if "%t%"=="8" set template=_template_banhang
if "%t%"=="9" set template=_template_truonghoc

xcopy "src\pages\%template%" "src\pages\%code%" /s /i /y
copy "src\data\%template%.yml" "src\data\%code%.yml" /y