# 🇻🇳 HƯỚNG DẪN DEPLOY REACT APP LÊN SOMEE.COM

## 📖 Mục Lục

1. [Giới Thiệu](#giới-thiệu)
2. [Yêu Cầu](#yêu-cầu)
3. [Bước 1: Chuẩn Bị Tài Khoản Somee.com](#bước-1-chuẩn-bị-tài-khoản-someecom)
4. [Bước 2: Cấu Hình GitHub Secrets](#bước-2-cấu-hình-github-secrets)
5. [Bước 3: Push Code Lên GitHub](#bước-3-push-code-lên-github)
6. [Bước 4: Theo Dõi Deployment](#bước-4-theo-dõi-deployment)
7. [Bước 5: Kiểm Tra Website](#bước-5-kiểm-tra-website)
8. [Xử Lý Lỗi Thường Gặp](#xử-lý-lỗi-thường-gặp)
9. [Câu Hỏi Thường Gặp](#câu-hỏi-thường-gặp)

---

## Giới Thiệu

Hướng dẫn này sẽ giúp bạn:

- ✅ Tự động build React app mỗi khi push code
- ✅ Tự động deploy lên Somee.com qua FTP
- ✅ Không cần deploy thủ công nữa
- ✅ Tiết kiệm thời gian và công sức

**Thời gian hoàn thành**: Khoảng 15-20 phút

---

## Yêu Cầu

Trước khi bắt đầu, bạn cần:

- ✅ Tài khoản GitHub (miễn phí)
- ✅ Tài khoản Somee.com (miễn phí)
- ✅ Git đã cài đặt trên máy
- ✅ Node.js đã cài đặt trên máy
- ✅ Project React đã sẵn sàng

---

## Bước 1: Chuẩn Bị Tài Khoản Somee.com

### 1.1. Đăng Ký Somee.com

1. Truy cập: **https://somee.com**
2. Click nút **"Sign Up"** hoặc **"Register"**
3. Điền thông tin:
   - Username (tên đăng nhập)
   - Email
   - Password
4. Xác nhận email (kiểm tra hộp thư)
5. Đăng nhập vào tài khoản

### 1.2. Lấy Thông Tin FTP

Sau khi đăng nhập:

1. Vào **Control Panel** (bảng điều khiển)
2. Tìm phần **"FTP Details"** hoặc **"File Manager"**
3. Ghi chú lại 3 thông tin quan trọng:

```
FTP Server:   ftp.yourdomain.somee.com
              (hoặc có thể là địa chỉ IP như: 185.123.45.67)

FTP Username: yourusername
              (thường giống username đăng ký)

FTP Password: yourpassword
              (có thể giống password đăng nhập hoặc được tạo riêng)
```

### 1.3. Test FTP Connection (Tùy Chọn)

Để chắc chắn thông tin FTP đúng, bạn có thể test bằng **FileZilla**:

1. Tải FileZilla: https://filezilla-project.org/
2. Mở FileZilla
3. Nhập:
   - Host: `ftp.yourdomain.somee.com`
   - Username: `yourusername`
   - Password: `yourpassword`
   - Port: `21`
4. Click **Quickconnect**
5. Nếu kết nối thành công → Thông tin FTP đúng! ✅

---

## Bước 2: Cấu Hình GitHub Secrets

GitHub Secrets giúp lưu trữ thông tin nhạy cảm (FTP credentials) một cách an toàn.

### 2.1. Tạo Repository Trên GitHub

Nếu chưa có repository:

1. Đăng nhập GitHub
2. Click nút **"+"** góc trên bên phải
3. Chọn **"New repository"**
4. Điền:
   - Repository name: `my-react-app` (hoặc tên bạn muốn)
   - Description: Mô tả ngắn
   - Public hoặc Private (tùy chọn)
5. Click **"Create repository"**
6. Ghi chú lại URL repository: `https://github.com/yourusername/my-react-app.git`

### 2.2. Thêm Secrets Vào Repository

1. Vào repository vừa tạo trên GitHub
2. Click tab **"Settings"** (ở trên cùng)
3. Trong sidebar bên trái:
   - Click **"Secrets and variables"**
   - Click **"Actions"**
4. Click nút **"New repository secret"**

### 2.3. Thêm Secret #1: FTP_SERVER

1. Click **"New repository secret"**
2. Điền:
   - **Name**: `FTP_SERVER` (viết chính xác như vậy)
   - **Secret**: `ftp.yourdomain.somee.com` (thay bằng FTP server của bạn)
3. Click **"Add secret"**

### 2.4. Thêm Secret #2: FTP_USERNAME

1. Click **"New repository secret"** lần nữa
2. Điền:
   - **Name**: `FTP_USERNAME`
   - **Secret**: `yourusername` (thay bằng FTP username của bạn)
3. Click **"Add secret"**

### 2.5. Thêm Secret #3: FTP_PASSWORD

1. Click **"New repository secret"** lần nữa
2. Điền:
   - **Name**: `FTP_PASSWORD`
   - **Secret**: `yourpassword` (thay bằng FTP password của bạn)
3. Click **"Add secret"**

### 2.6. Xác Nhận

Bạn sẽ thấy 3 secrets trong danh sách:

- ✅ `FTP_SERVER`
- ✅ `FTP_USERNAME`
- ✅ `FTP_PASSWORD`

**Lưu ý**: Bạn không thể xem lại giá trị của secrets sau khi đã lưu. Nếu nhập sai, hãy xóa và tạo lại.

---

## Bước 3: Push Code Lên GitHub

### 3.1. Mở Terminal/Command Prompt

Mở terminal trong thư mục project của bạn:

**Windows**:

- Mở thư mục project
- Shift + Right Click
- Chọn "Open PowerShell window here" hoặc "Open Command Prompt here"

**Mac/Linux**:

- Mở Terminal
- `cd /path/to/your/project`

### 3.2. Khởi Tạo Git (Nếu Chưa Có)

Kiểm tra xem đã có git chưa:

```bash
git status
```

Nếu báo lỗi "not a git repository", chạy:

```bash
git init
```

### 3.3. Add Files

```bash
git add .
```

Lệnh này sẽ thêm tất cả files vào staging area.

### 3.4. Commit

```bash
git commit -m "Add GitHub Actions workflow for Somee deployment"
```

### 3.5. Kết Nối Với GitHub Repository

Thay `yourusername` và `your-repo` bằng thông tin thực của bạn:

```bash
git remote add origin https://github.com/yourusername/your-repo.git
```

Nếu báo lỗi "remote origin already exists", chạy:

```bash
git remote set-url origin https://github.com/yourusername/your-repo.git
```

### 3.6. Push Code

```bash
git branch -M main
git push -u origin main
```

**Lưu ý**: Nếu GitHub yêu cầu đăng nhập:

- Username: `yourusername`
- Password: Sử dụng **Personal Access Token** (không phải password GitHub)
  - Tạo token tại: https://github.com/settings/tokens

### 3.7. Xác Nhận

Vào repository trên GitHub, bạn sẽ thấy code đã được push lên! ✅

---

## Bước 4: Theo Dõi Deployment

### 4.1. Vào Tab Actions

1. Trên repository GitHub
2. Click tab **"Actions"** (ở trên cùng)
3. Bạn sẽ thấy workflow **"Build and Deploy to Somee"** đang chạy

### 4.2. Xem Chi Tiết Workflow

1. Click vào workflow run (dòng đầu tiên)
2. Bạn sẽ thấy 2 jobs:
   - **build**: Build React app
   - **deploy**: Deploy lên Somee.com

### 4.3. Theo Dõi Build Job

Click vào job **"build"**, bạn sẽ thấy các steps:

1. ✅ **Checkout code**: Tải code từ GitHub
2. ✅ **Setup Node.js**: Cài đặt Node.js
3. ✅ **Install dependencies**: Chạy `npm ci`
4. ✅ **Build project**: Chạy `npm run build`
5. ✅ **Archive build artifacts**: Lưu build files

**Thời gian**: Khoảng 2-3 phút

### 4.4. Theo Dõi Deploy Job

Sau khi build xong, job **"deploy"** sẽ tự động chạy:

1. ✅ **Download build artifacts**: Tải build files
2. ✅ **Deploy to Somee via FTP**: Upload lên Somee.com

**Thời gian**: Khoảng 1-2 phút (tùy kích thước project)

### 4.5. Workflow Hoàn Thành

Khi tất cả steps đều có dấu ✅ màu xanh:

- 🎉 **Deployment thành công!**
- Website đã được deploy lên Somee.com

Nếu có dấu ❌ màu đỏ:

- Xem phần [Xử Lý Lỗi](#xử-lý-lỗi-thường-gặp)

---

## Bước 5: Kiểm Tra Website

### 5.1. Truy Cập Website

Mở browser và truy cập:

```
http://yourdomain.somee.com
```

Thay `yourdomain` bằng domain của bạn trên Somee.com.

### 5.2. Kiểm Tra Chức Năng

- ✅ Website hiển thị đúng
- ✅ Không có blank page
- ✅ Links hoạt động
- ✅ Images hiển thị
- ✅ Styles đúng

### 5.3. Kiểm Tra Console

1. Nhấn **F12** để mở Developer Tools
2. Vào tab **Console**
3. Không có lỗi màu đỏ → Tốt! ✅
4. Có lỗi → Xem phần [Xử Lý Lỗi](#xử-lý-lỗi-thường-gặp)

---

## Xử Lý Lỗi Thường Gặp

### ❌ Lỗi 1: FTP Connection Failed

**Triệu chứng**:

```
Error: Failed to connect to FTP server
```

**Nguyên nhân**:

- Thông tin FTP sai
- FTP service không hoạt động

**Giải pháp**:

1. **Kiểm tra lại Secrets**:

   - Vào Settings → Secrets and variables → Actions
   - Xóa 3 secrets cũ
   - Tạo lại với thông tin đúng

2. **Test FTP bằng FileZilla**:

   - Nếu FileZilla không kết nối được → Liên hệ Somee.com support
   - Nếu FileZilla kết nối được → Kiểm tra lại Secrets

3. **Kiểm tra FTP Service**:
   - Đăng nhập Somee.com Control Panel
   - Đảm bảo FTP service đang bật

### ❌ Lỗi 2: Build Failed

**Triệu chứng**:

```
Error: npm run build failed
```

**Nguyên nhân**:

- Lỗi trong code
- Dependencies thiếu

**Giải pháp**:

1. **Test build local**:

   ```bash
   npm install
   npm run build
   ```

   - Nếu build local fail → Fix lỗi trong code
   - Nếu build local success → Kiểm tra workflow file

2. **Kiểm tra package.json**:

   - Đảm bảo có script `"build": "react-scripts build"`
   - Đảm bảo dependencies đầy đủ

3. **Xem log chi tiết**:
   - Vào Actions → Click vào workflow run
   - Click vào step "Build project"
   - Đọc error message

### ❌ Lỗi 3: Website Blank Page

**Triệu chứng**:

- Website chỉ hiển thị trang trắng
- Không có nội dung

**Nguyên nhân**:

- File `web.config` thiếu hoặc sai
- Routing không đúng

**Giải pháp**:

1. **Kiểm tra web.config**:

   - Đảm bảo file `public/web.config` tồn tại
   - File này sẽ tự động copy vào `build/` khi build

2. **Kiểm tra Console**:

   - Nhấn F12
   - Xem lỗi trong Console
   - Thường là lỗi 404 cho các file static

3. **Kiểm tra homepage trong package.json**:
   - Nếu deploy vào subfolder, cần set `homepage`
   ```json
   "homepage": "http://yourdomain.somee.com"
   ```

### ❌ Lỗi 4: 404 Not Found

**Triệu chứng**:

- Trang chủ hoạt động
- Nhưng các routes khác báo 404

**Nguyên nhân**:

- React Router không được cấu hình đúng với IIS

**Giải pháp**:

1. **Đảm bảo web.config đúng**:

   - File `public/web.config` phải có rewrite rules
   - File này đã được tạo sẵn trong project

2. **Kiểm tra IIS Rewrite Module**:
   - Somee.com thường đã cài sẵn
   - Nếu không có, liên hệ support

### ❌ Lỗi 5: CSS/Images Không Load

**Triệu chứng**:

- Website hiển thị nhưng không có styles
- Images không hiển thị

**Nguyên nhân**:

- Path không đúng
- MIME types không được cấu hình

**Giải pháp**:

1. **Kiểm tra Network tab**:

   - F12 → Network tab
   - Reload page
   - Xem files nào báo 404

2. **Kiểm tra homepage**:

   - Trong `package.json`, thêm:

   ```json
   "homepage": "."
   ```

3. **Kiểm tra web.config**:
   - Đảm bảo có staticContent section
   - File đã được tạo sẵn với MIME types đúng

---

## Câu Hỏi Thường Gặp

### ❓ Tôi có thể deploy vào subfolder không?

**Trả lời**: Có!

1. Trong workflow file, sửa:

```yaml
server-dir: ./subfolder/
```

2. Trong `package.json`, thêm:

```json
"homepage": "http://yourdomain.somee.com/subfolder"
```

### ❓ Làm sao để deploy thủ công?

**Trả lời**:

1. Vào GitHub → Actions
2. Click "Build and Deploy to Somee"
3. Click "Run workflow"
4. Chọn branch
5. Click "Run workflow"

### ❓ Tôi có thể sử dụng custom domain không?

**Trả lời**: Có!

1. Cấu hình custom domain trên Somee.com
2. Cập nhật `FTP_SERVER` trong Secrets
3. Cập nhật `homepage` trong `package.json`

### ❓ Workflow chạy mất bao lâu?

**Trả lời**:

- Build: 2-3 phút
- Deploy: 1-2 phút
- **Tổng**: Khoảng 3-5 phút

### ❓ Tôi có thể deploy nhiều branches không?

**Trả lời**: Có!

Sửa workflow file:

```yaml
on:
  push:
    branches:
      - main
      - develop
      - staging
```

### ❓ Làm sao để xem log deploy?

**Trả lời**:

1. Vào GitHub → Actions
2. Click vào workflow run
3. Click vào job "deploy"
4. Click vào step "Deploy to Somee via FTP"
5. Xem log chi tiết

### ❓ Tôi có thể rollback về version cũ không?

**Trả lời**: Có!

**Cách 1**: Revert commit

```bash
git revert HEAD
git push
```

**Cách 2**: Deploy commit cũ

1. Vào Actions
2. Tìm workflow run cũ thành công
3. Click "Re-run jobs"

### ❓ Somee.com có giới hạn gì không?

**Trả lời**: Free plan có:

- ✅ 150MB disk space
- ✅ 5GB bandwidth/month
- ✅ 1 website
- ⚠️ Website có thể sleep sau 30 phút không hoạt động
- ⚠️ Có ads trên website

### ❓ Làm sao để remove ads trên Somee.com?

**Trả lời**:

- Upgrade lên paid plan
- Hoặc sử dụng hosting khác (Netlify, Vercel miễn phí không ads)

### ❓ Tôi có thể deploy React app lên hosting khác không?

**Trả lời**: Có!

Workflow này có thể điều chỉnh cho:

- **Netlify**: Dùng Netlify CLI
- **Vercel**: Dùng Vercel CLI
- **AWS S3**: Dùng AWS CLI
- **Any FTP hosting**: Giữ nguyên workflow

---

## 🎯 Tóm Tắt Các Bước

1. ✅ Đăng ký Somee.com → Lấy FTP info
2. ✅ Tạo GitHub repository
3. ✅ Thêm 3 secrets: FTP_SERVER, FTP_USERNAME, FTP_PASSWORD
4. ✅ Push code lên GitHub
5. ✅ Workflow tự động chạy
6. ✅ Kiểm tra website

**Từ giờ**: Chỉ cần `git push` → Website tự động deploy! 🚀

---

## 📞 Liên Hệ & Hỗ Trợ

- **Somee.com Support**: https://somee.com/help.aspx
- **GitHub Actions Docs**: https://docs.github.com/en/actions
- **React Deployment**: https://create-react-app.dev/docs/deployment/

---

## 📚 Tài Liệu Khác

- **Quick Start**: [QUICK_START.md](QUICK_START.md)
- **English Guide**: [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)
- **Checklist**: [DEPLOYMENT_CHECKLIST.md](DEPLOYMENT_CHECKLIST.md)
- **Workflow README**: [.github/workflows/README.md](.github/workflows/README.md)

---

**Chúc bạn deploy thành công! 🎉🎊**

Nếu gặp vấn đề, hãy kiểm tra lại từng bước trong hướng dẫn này!
