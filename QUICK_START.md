# ⚡ Hướng Dẫn Nhanh - Deploy React App lên Somee.com

## 🎯 Các Bước Thực Hiện

### 1️⃣ Chuẩn Bị Somee.com (5 phút)

```
✅ Đăng ký tài khoản: https://somee.com
✅ Lấy thông tin FTP từ Control Panel:
   - FTP Server (ví dụ: ftp.yourdomain.somee.com)
   - FTP Username
   - FTP Password
```

---

### 2️⃣ Cấu Hình GitHub Secrets (3 phút)

**Vào GitHub Repository → Settings → Secrets and variables → Actions**

Thêm 3 secrets:

| Secret Name    | Giá Trị                    |
| -------------- | -------------------------- |
| `FTP_SERVER`   | `ftp.yourdomain.somee.com` |
| `FTP_USERNAME` | `yourusername`             |
| `FTP_PASSWORD` | `yourpassword`             |

---

### 3️⃣ Push Code Lên GitHub (2 phút)

```bash
# Nếu chưa có git repository
git init
git add .
git commit -m "Add GitHub Actions workflow for Somee deployment"

# Kết nối với GitHub
git remote add origin https://github.com/yourusername/your-repo.git
git branch -M main
git push -u origin main
```

---

### 4️⃣ Kiểm Tra Deployment (2 phút)

```
✅ Vào GitHub → Tab "Actions"
✅ Xem workflow "Build and Deploy to Somee" đang chạy
✅ Đợi workflow hoàn thành (màu xanh ✅)
✅ Truy cập: http://yourdomain.somee.com
```

---

## 🎉 Xong! Từ Giờ Tự Động

Mỗi khi bạn push code:

```bash
git add .
git commit -m "Update feature"
git push
```

→ Website tự động build và deploy! 🚀

---

## 🆘 Gặp Vấn Đề?

### ❌ Workflow Failed?

- Xem log trong GitHub Actions
- Kiểm tra lại 3 secrets đã đúng chưa

### ❌ Website Blank Page?

- Kiểm tra file `web.config` trong `public/`
- Xem browser console (F12)

### ❌ FTP Connection Error?

- Test FTP bằng FileZilla
- Đảm bảo FTP service đang bật trên Somee.com

---

## 📖 Hướng Dẫn Chi Tiết

Xem file `DEPLOYMENT_GUIDE.md` để biết thêm chi tiết!

---

**Happy Coding! 💻✨**
