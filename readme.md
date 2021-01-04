## Chuẩn bị

- [NodeJS](https://nodejs.org/en/)
- [Git](https://git-scm.com/)

## Cài đặt lần đầu

1. Foundation CLI:

```bash
npm install foundation-cli --global
```

2. Git clone:

```bash
git clone https://github.com/inuris/invoice.git invoice
```

3. Update packages:

```bash
cd invoice
npm install
```

## Chạy app

```bash
cd invoice
foundation watch
```

Vào link `http://localhost:8000/tên_mẫu/` để xem mẫu

## Cấu trúc source code

- Source nằm ở folder `invoice/src/`
- Code generated nằm ở folder `invoice/dist/comName`

## Tạo mẫu HD mới

1. Chạy `./new.bat`
2. Chọn template
3. Điền `comCode` (tên viết tắt, sẽ dùng làm tên folder)
4. Điền tên folder để publish


