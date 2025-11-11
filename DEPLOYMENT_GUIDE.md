# 🚀 Hướng Dẫn Deploy React App lên Somee.com với GitHub Actions

## 📝 Tổng Quan

Workflow này sẽ tự động build React app và deploy lên Somee.com mỗi khi bạn push code lên GitHub.

---

## 🔧 BƯỚC 1: Chuẩn Bị Tài Khoản Somee.com

### 1.1. Đăng ký/Đăng nhập Somee.com

- Truy cập: https://somee.com
- Đăng ký tài khoản miễn phí hoặc đăng nhập

### 1.2. Lấy Thông Tin FTP

Sau khi đăng nhập, vào **Control Panel**:

- **FTP Server**: Thường là `ftp.yourdomain.somee.com` hoặc IP server
- **FTP Username**: Username của bạn (ví dụ: `yourusername`)
- **FTP Password**: Password FTP của bạn

📌 **Lưu ý**: Somee.com cung cấp thông tin FTP trong phần **FTP Details** hoặc **File Manager**

---

## 🔐 BƯỚC 2: Cấu Hình GitHub Secrets

### 2.1. Vào Repository Settings

1. Mở repository của bạn trên GitHub
2. Click vào **Settings** (tab trên cùng)
3. Trong sidebar bên trái, click **Secrets and variables** > **Actions**

### 2.2. Thêm Secrets

Click **New repository secret** và thêm 3 secrets sau:

#### Secret 1: FTP_SERVER

- **Name**: `FTP_SERVER`
- **Value**: `ftp.yourdomain.somee.com` (thay bằng FTP server của bạn)

#### Secret 2: FTP_USERNAME

- **Name**: `FTP_USERNAME`
- **Value**: `yourusername` (thay bằng FTP username của bạn)

#### Secret 3: FTP_PASSWORD

- **Name**: `FTP_PASSWORD`
- **Value**: `yourpassword` (thay bằng FTP password của bạn)

---

## 📂 BƯỚC 3: Cấu Hình Somee.com

### 3.1. Tạo File web.config

Somee.com sử dụng IIS server, cần file `web.config` để routing React app đúng cách.

File này đã được tạo sẵn trong thư mục `public/web.config`

### 3.2. Kiểm Tra Thư Mục Deploy

- Trên Somee.com, thư mục web root thường là `/` hoặc `/wwwroot/`
- Đảm bảo trong workflow file, `server-dir` trỏ đúng thư mục

---

## 🚀 BƯỚC 4: Push Code Lên GitHub

### 4.1. Khởi Tạo Git Repository (nếu chưa có)

```bash
git init
git add .
git commit -m "Initial commit with GitHub Actions workflow"
```

### 4.2. Kết Nối với GitHub Repository

```bash
git remote add origin https://github.com/yourusername/your-repo.git
git branch -M main
git push -u origin main
```

### 4.3. Kiểm Tra Workflow

1. Vào repository trên GitHub
2. Click tab **Actions**
3. Bạn sẽ thấy workflow "Build and Deploy to Somee" đang chạy

---

## 📊 BƯỚC 5: Theo Dõi Deployment

### 5.1. Xem Log GitHub Actions

- Vào tab **Actions** trên GitHub
- Click vào workflow run mới nhất
- Xem chi tiết từng step: build, deploy

### 5.2. Kiểm Tra Website

- Sau khi workflow hoàn thành (màu xanh ✅)
- Truy cập: `http://yourdomain.somee.com`
- Website React của bạn đã được deploy!

---

## 🔄 BƯỚC 6: Workflow Tự Động

Từ giờ, mỗi khi bạn:

- Push code lên branch `main` hoặc `master`
- Workflow sẽ tự động:
  1. ✅ Checkout code
  2. ✅ Setup Node.js
  3. ✅ Install dependencies
  4. ✅ Build React app
  5. ✅ Upload build files
  6. ✅ Deploy lên Somee.com qua FTP

---

## 🛠️ Troubleshooting

### ❌ Lỗi: FTP Connection Failed

**Giải pháp**:

- Kiểm tra lại FTP_SERVER, FTP_USERNAME, FTP_PASSWORD trong GitHub Secrets
- Đảm bảo FTP service đang hoạt động trên Somee.com
- Thử test FTP bằng FileZilla để xác nhận thông tin đúng

### ❌ Lỗi: Build Failed

**Giải pháp**:

- Kiểm tra lỗi trong tab Actions > Build step
- Đảm bảo `package.json` có đầy đủ dependencies
- Chạy `npm run build` local để test

### ❌ Website Hiển Thị Blank Page

**Giải pháp**:

- Kiểm tra file `web.config` đã được deploy chưa
- Kiểm tra browser console để xem lỗi
- Đảm bảo `homepage` trong `package.json` đúng (nếu deploy vào subfolder)

### ❌ Routing Không Hoạt Động

**Giải pháp**:

- Đảm bảo file `web.config` có trong thư mục `public/`
- File này sẽ được copy vào `build/` khi build

---

## 📝 Lưu Ý Quan Trọng

1. **Somee.com Free Plan**:

   - Có giới hạn băng thông và storage
   - Website có thể sleep sau thời gian không hoạt động
   - Có thể có ads trên website

2. **Build Time**:

   - Workflow mất khoảng 2-5 phút để hoàn thành
   - Tùy thuộc vào kích thước project

3. **Security**:

   - KHÔNG bao giờ commit FTP credentials vào code
   - Luôn sử dụng GitHub Secrets

4. **Custom Domain**:
   - Nếu dùng custom domain, cập nhật `FTP_SERVER` và `homepage` trong `package.json`

---

## 🎯 Các Lệnh Hữu Ích

### Chạy Local

```bash
npm start
```

### Build Local

```bash
npm run build
```

### Test Build Local

```bash
npx serve -s build
```

### Trigger Manual Deploy

- Vào GitHub Actions
- Click "Build and Deploy to Somee"
- Click "Run workflow"
- Chọn branch và click "Run workflow"

---

## 📚 Tài Liệu Tham Khảo

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Somee.com Help](https://somee.com/help.aspx)
- [Create React App Deployment](https://create-react-app.dev/docs/deployment/)
- [FTP-Deploy-Action](https://github.com/SamKirkland/FTP-Deploy-Action)

---

## ✅ Checklist

- [ ] Đã tạo tài khoản Somee.com
- [ ] Đã lấy thông tin FTP (server, username, password)
- [ ] Đã thêm 3 secrets vào GitHub (FTP_SERVER, FTP_USERNAME, FTP_PASSWORD)
- [ ] Đã có file `web.config` trong thư mục `public/`
- [ ] Đã push code lên GitHub
- [ ] Workflow đã chạy thành công (màu xanh)
- [ ] Website đã hoạt động trên Somee.com

---

**Chúc bạn deploy thành công! 🎉**
