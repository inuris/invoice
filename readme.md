## * Chuẩn bị

- [NodeJS](https://nodejs.org/en/)
- [Git](https://git-scm.com/)

## I. Cài đặt lần đầu

### 1. Git clone:

```bash
git clone https://github.com/inuris/invoice.git invoice
```

### 2. Cài node package:

```bash
cd invoice
```
```bash
npm install
```

### 3. Cài thư viện:

- Right Click file `install-as-admin.bat`, chọn `Run as Administrator...`

### 4. Cấu hình thư mục xuất

- Copy file `_copy.cfg` thành file mới và đổi tên thành `copy.cfg`
- Mở bằng editor bất kỳ, sửa `C:\<path to folder>\VNPT-MauHoaDonDienTu` thành đúng đường dẫn trong máy

## II. Sử dụng

 1. Chạy file `watch.bat` và để cửa sổ chạy.

 2. Chạy file `new.bat` và nhập:
 - Chọn số thứ tự tương ứng mẫu cần làm
 - Điền `comCode` (tên viết tắt) của công ty, sẽ sử dụng làm domain nếu là HSM.
 - Điền thư mục cần xuất ra (comFolder)

 3. Vào link `http://localhost:8000/tên_mẫu/` để xem mẫu

 4. Chỉnh sửa thông tin công ty:
 - Vào thư mục `\invoice\src\pages\<comCode>`
 - Mở file `<comCode>.yml`
 - Copy paste thông tin công ty vào thay thế phần trên cùng

5. Xuất file:
- Chạy `_copy.bat` trong thư mục công ty
- Nếu cần chỉnh sửa lại, chạy `_restore.bat`

## III. Cấu trúc source code

- Source nằm ở folder `\invoice\src\**`
- Code generated nằm ở folder `\invoice\dist\**`

