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

3. Update NPM:

```bash
npm install
```

## Chạy app

```bash
cd invoice
foundation watch
```

## Tạo mẫu HD mới

1. Copy file `src/data/_template.yml`-> `comName.yml`
2. Copy folder `src/pages/_template` -> `src/pages/comName`
3. Vào `src/pages/comName/index.html` đổi dòng đầu tiên `{{#with _template}}` thành `{{#with comName}}`
4. Cập nhật thông tin mới vào `src/data/comName.yml`

