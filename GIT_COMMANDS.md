# 📝 Các Lệnh Git Cần Thiết

## 🚀 Lần Đầu Tiên Setup

### 1. Khởi tạo Git repository

```bash
git init
```

### 2. Thêm tất cả files

```bash
git add .
```

### 3. Commit lần đầu

```bash
git commit -m "Initial commit with GitHub Actions workflow"
```

### 4. Kết nối với GitHub

Thay `yourusername` và `your-repo` bằng thông tin của bạn:

```bash
git remote add origin https://github.com/yourusername/your-repo.git
```

### 5. Đổi branch thành main

```bash
git branch -M main
```

### 6. Push lên GitHub

```bash
git push -u origin main
```

---

## 🔄 Các Lần Sau (Workflow Thường Ngày)

### 1. Kiểm tra trạng thái

```bash
git status
```

### 2. Thêm files đã thay đổi

```bash
# Thêm tất cả files
git add .

# Hoặc thêm file cụ thể
git add src/App.js
```

### 3. Commit với message

```bash
git commit -m "Mô tả thay đổi của bạn"
```

**Ví dụ commit messages tốt:**

```bash
git commit -m "Add user login feature"
git commit -m "Fix button styling issue"
git commit -m "Update homepage content"
git commit -m "Improve performance"
```

### 4. Push lên GitHub

```bash
git push
```

**Hoặc đầy đủ:**

```bash
git push origin main
```

---

## ⚡ Lệnh Kết Hợp Nhanh

### Commit tất cả thay đổi và push

```bash
git add . && git commit -m "Your message" && git push
```

### Commit với message ngắn

```bash
git commit -am "Your message"
```

_Lưu ý: Chỉ work với files đã được tracked_

---

## 🔍 Các Lệnh Kiểm Tra

### Xem lịch sử commits

```bash
git log
```

### Xem lịch sử ngắn gọn

```bash
git log --oneline
```

### Xem thay đổi chưa commit

```bash
git diff
```

### Xem branches

```bash
git branch
```

### Xem remote repositories

```bash
git remote -v
```

---

## 🌿 Làm Việc Với Branches

### Tạo branch mới

```bash
git branch feature-name
```

### Chuyển sang branch khác

```bash
git checkout feature-name
```

### Tạo và chuyển sang branch mới

```bash
git checkout -b feature-name
```

### Merge branch vào main

```bash
git checkout main
git merge feature-name
```

### Xóa branch

```bash
git branch -d feature-name
```

---

## 🔙 Undo Changes

### Hủy thay đổi chưa commit (1 file)

```bash
git checkout -- filename
```

### Hủy tất cả thay đổi chưa commit

```bash
git reset --hard
```

### Hủy commit cuối (giữ lại changes)

```bash
git reset --soft HEAD~1
```

### Hủy commit cuối (xóa luôn changes)

```bash
git reset --hard HEAD~1
```

### Revert commit (tạo commit mới)

```bash
git revert HEAD
```

---

## 📥 Pull Changes Từ GitHub

### Pull changes mới nhất

```bash
git pull
```

### Pull và rebase

```bash
git pull --rebase
```

---

## 🔧 Fix Common Issues

### Lỗi: "remote origin already exists"

```bash
git remote remove origin
git remote add origin https://github.com/yourusername/your-repo.git
```

### Lỗi: "Updates were rejected"

```bash
# Option 1: Pull trước
git pull origin main
git push

# Option 2: Force push (NGUY HIỂM - chỉ dùng khi chắc chắn)
git push -f origin main
```

### Lỗi: "Please tell me who you are"

```bash
git config --global user.email "your-email@example.com"
git config --global user.name "Your Name"
```

### Lỗi: Conflict khi merge

```bash
# 1. Xem files bị conflict
git status

# 2. Mở file và sửa conflict (tìm <<<<<<, ======, >>>>>>)

# 3. Sau khi sửa xong
git add .
git commit -m "Resolve merge conflict"
```

---

## 🔐 Authentication

### Sử dụng Personal Access Token

Khi GitHub yêu cầu password, sử dụng Personal Access Token:

1. Tạo token: https://github.com/settings/tokens
2. Chọn scopes: `repo`, `workflow`
3. Copy token
4. Dùng token thay vì password khi push

### Cache credentials (không cần nhập lại)

```bash
# Windows
git config --global credential.helper wincred

# Mac
git config --global credential.helper osxkeychain

# Linux
git config --global credential.helper cache
```

---

## 📋 Workflow Hoàn Chỉnh

### Workflow hàng ngày:

```bash
# 1. Kiểm tra có gì mới trên GitHub không
git pull

# 2. Làm việc, sửa code...

# 3. Kiểm tra thay đổi
git status

# 4. Thêm files
git add .

# 5. Commit
git commit -m "Describe your changes"

# 6. Push lên GitHub (tự động trigger deploy!)
git push
```

---

## 🎯 Best Practices

### ✅ DO:

- Commit thường xuyên với messages rõ ràng
- Pull trước khi push
- Kiểm tra `git status` trước khi commit
- Sử dụng branches cho features mới
- Test code trước khi push

### ❌ DON'T:

- Commit code lỗi lên main branch
- Force push lên main (trừ khi thật sự cần)
- Commit files nhạy cảm (.env, passwords)
- Commit node_modules hoặc build folder
- Viết commit messages không rõ ràng

---

## 📝 Commit Message Templates

### Format tốt:

```
[Type] Short description

Detailed explanation (optional)
```

### Ví dụ:

```bash
git commit -m "[Feature] Add user authentication"
git commit -m "[Fix] Resolve login button bug"
git commit -m "[Update] Improve homepage UI"
git commit -m "[Refactor] Clean up code structure"
git commit -m "[Docs] Update README"
```

---

## 🆘 Emergency Commands

### Lưu thay đổi tạm thời (stash)

```bash
# Lưu thay đổi
git stash

# Xem danh sách stash
git stash list

# Lấy lại thay đổi
git stash pop
```

### Xem ai commit gì

```bash
git blame filename
```

### Tìm kiếm trong commits

```bash
git log --grep="search term"
```

---

## 🔗 Useful Aliases

Thêm vào `.gitconfig` hoặc chạy:

```bash
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
```

Sau đó có thể dùng:

```bash
git st      # thay vì git status
git co main # thay vì git checkout main
git br      # thay vì git branch
git ci      # thay vì git commit
```

---

## 📚 Tài Liệu Tham Khảo

- **Git Official**: https://git-scm.com/doc
- **GitHub Docs**: https://docs.github.com
- **Git Cheat Sheet**: https://education.github.com/git-cheat-sheet-education.pdf

---

## 💡 Pro Tips

1. **Commit nhỏ, commit thường**: Dễ rollback nếu có lỗi
2. **Pull trước khi làm việc**: Tránh conflicts
3. **Test trước khi push**: Đừng push code lỗi
4. **Backup quan trọng**: Push lên GitHub = backup miễn phí
5. **Đọc messages**: Git messages thường rất hữu ích

---

**Chúc bạn sử dụng Git hiệu quả! 🚀**
