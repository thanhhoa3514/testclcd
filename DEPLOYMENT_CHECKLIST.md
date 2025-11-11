# ✅ Deployment Checklist

Sử dụng checklist này để đảm bảo bạn không bỏ sót bước nào!

---

## 📋 Pre-Deployment

### Chuẩn Bị Somee.com

- [ ] Đã đăng ký tài khoản Somee.com
- [ ] Đã đăng nhập vào Control Panel
- [ ] Đã tìm thấy thông tin FTP trong Control Panel
- [ ] Đã ghi chú lại:
  - [ ] FTP Server: `_______________________`
  - [ ] FTP Username: `_______________________`
  - [ ] FTP Password: `_______________________`

### Chuẩn Bị GitHub

- [ ] Đã có tài khoản GitHub
- [ ] Đã tạo repository mới (hoặc sử dụng repo có sẵn)
- [ ] Đã biết URL repository: `_______________________`

---

## 🔐 GitHub Secrets Configuration

### Truy Cập Settings

- [ ] Đã mở repository trên GitHub
- [ ] Đã click vào tab **Settings**
- [ ] Đã click **Secrets and variables** → **Actions**

### Thêm Secrets

- [ ] Đã click **New repository secret**
- [ ] Đã thêm secret `FTP_SERVER`
  - Name: `FTP_SERVER`
  - Value: `_______________________`
- [ ] Đã thêm secret `FTP_USERNAME`
  - Name: `FTP_USERNAME`
  - Value: `_______________________`
- [ ] Đã thêm secret `FTP_PASSWORD`
  - Name: `FTP_PASSWORD`
  - Value: `_______________________`
- [ ] Đã verify tất cả 3 secrets đã được lưu

---

## 📁 Project Files

### Kiểm Tra Files Cần Thiết

- [ ] File `.github/workflows/deploy.yml` đã tồn tại
- [ ] File `public/web.config` đã tồn tại
- [ ] File `.gitignore` không ignore thư mục `.github`
- [ ] File `package.json` có script `build`

### Test Local Build

- [ ] Đã chạy `npm install` thành công
- [ ] Đã chạy `npm run build` thành công
- [ ] Thư mục `build/` đã được tạo
- [ ] Đã test build local với `npx serve -s build`

---

## 🚀 Git & GitHub

### Initialize Git (nếu chưa có)

- [ ] Đã chạy `git init`
- [ ] Đã chạy `git add .`
- [ ] Đã chạy `git commit -m "Initial commit"`

### Connect to GitHub

- [ ] Đã chạy `git remote add origin <URL>`
- [ ] Đã chạy `git branch -M main`
- [ ] Đã chạy `git push -u origin main`
- [ ] Code đã xuất hiện trên GitHub

---

## ⚙️ GitHub Actions

### Kiểm Tra Workflow

- [ ] Đã vào tab **Actions** trên GitHub
- [ ] Đã thấy workflow "Build and Deploy to Somee"
- [ ] Workflow đang chạy (màu vàng 🟡) hoặc đã hoàn thành

### Monitor Build Job

- [ ] Đã click vào workflow run
- [ ] Step "Checkout code" - ✅ Success
- [ ] Step "Setup Node.js" - ✅ Success
- [ ] Step "Install dependencies" - ✅ Success
- [ ] Step "Build project" - ✅ Success
- [ ] Step "Archive build artifacts" - ✅ Success

### Monitor Deploy Job

- [ ] Deploy job đã bắt đầu
- [ ] Step "Download build artifacts" - ✅ Success
- [ ] Step "Deploy to Somee via FTP" - ✅ Success
- [ ] Toàn bộ workflow màu xanh ✅

---

## 🌐 Verify Deployment

### Kiểm Tra Website

- [ ] Đã truy cập `http://yourdomain.somee.com`
- [ ] Website hiển thị đúng
- [ ] Không có blank page
- [ ] Không có lỗi 404
- [ ] React app hoạt động bình thường

### Test Functionality

- [ ] Tất cả links hoạt động
- [ ] Routing hoạt động (nếu có React Router)
- [ ] Images hiển thị đúng
- [ ] CSS/Styles hiển thị đúng
- [ ] JavaScript hoạt động

### Browser Console

- [ ] Đã mở Developer Tools (F12)
- [ ] Không có lỗi trong Console
- [ ] Không có warning nghiêm trọng

---

## 🔄 Test Auto-Deployment

### Make a Change

- [ ] Đã sửa một file (ví dụ: `src/App.js`)
- [ ] Đã commit: `git commit -am "Test auto-deploy"`
- [ ] Đã push: `git push`

### Verify Auto-Deploy

- [ ] Workflow tự động chạy trên GitHub Actions
- [ ] Build thành công
- [ ] Deploy thành công
- [ ] Thay đổi đã xuất hiện trên website

---

## 📝 Documentation

### Update Documentation

- [ ] Đã cập nhật badge URL trong `README.md`
  - Thay `yourusername/your-repo` bằng repo thực
- [ ] Đã cập nhật domain trong `DEPLOYMENT_GUIDE.md`
- [ ] Đã cập nhật domain trong `QUICK_START.md`

---

## 🎉 Final Checks

- [ ] Website hoạt động hoàn hảo
- [ ] Auto-deployment hoạt động
- [ ] Documentation đầy đủ
- [ ] Team members biết cách deploy
- [ ] Đã backup FTP credentials an toàn

---

## 🆘 Troubleshooting Log

Nếu gặp vấn đề, ghi chú lại đây:

### Issue 1:

- **Problem**: **********\_\_\_**********
- **Solution**: **********\_\_\_**********
- **Status**: ⬜ Resolved / ⬜ Pending

### Issue 2:

- **Problem**: **********\_\_\_**********
- **Solution**: **********\_\_\_**********
- **Status**: ⬜ Resolved / ⬜ Pending

### Issue 3:

- **Problem**: **********\_\_\_**********
- **Solution**: **********\_\_\_**********
- **Status**: ⬜ Resolved / ⬜ Pending

---

## 📞 Support Resources

- **Somee.com Support**: https://somee.com/help.aspx
- **GitHub Actions Docs**: https://docs.github.com/en/actions
- **FTP-Deploy-Action**: https://github.com/SamKirkland/FTP-Deploy-Action
- **Create React App**: https://create-react-app.dev/docs/deployment/

---

**Date Completed**: **********\_\_\_**********

**Deployed By**: **********\_\_\_**********

**Website URL**: **********\_\_\_**********

---

🎊 **Congratulations! Your React app is now live!** 🎊
