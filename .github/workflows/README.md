# GitHub Actions Workflows

## 📁 File Workflow

### `deploy.yml` - Build and Deploy to Somee

Workflow này tự động build React app và deploy lên Somee.com.

#### Khi Nào Workflow Chạy?

- ✅ Khi push code lên branch `main` hoặc `master`
- ✅ Khi tạo Pull Request vào `main` hoặc `master`
- ✅ Khi trigger thủ công (Manual workflow dispatch)

#### Các Job

**1. Build Job**

- Checkout code
- Setup Node.js 18
- Install dependencies với `npm ci`
- Build project với `npm run build`
- Upload build artifacts

**2. Deploy Job** (chỉ chạy khi push vào main/master)

- Download build artifacts
- Deploy lên Somee.com qua FTP

#### Secrets Cần Thiết

Workflow cần 3 secrets được cấu hình trong GitHub:

| Secret         | Mô Tả                                                      |
| -------------- | ---------------------------------------------------------- |
| `FTP_SERVER`   | FTP server của Somee.com (ví dụ: ftp.yourdomain.somee.com) |
| `FTP_USERNAME` | FTP username                                               |
| `FTP_PASSWORD` | FTP password                                               |

#### Cách Thêm Secrets

1. Vào repository trên GitHub
2. Settings → Secrets and variables → Actions
3. Click "New repository secret"
4. Thêm từng secret với name và value tương ứng

#### Manual Trigger

Để chạy workflow thủ công:

1. Vào tab Actions
2. Chọn "Build and Deploy to Somee"
3. Click "Run workflow"
4. Chọn branch và click "Run workflow"

#### Troubleshooting

**Build Failed?**

- Kiểm tra log trong Actions tab
- Đảm bảo `package.json` có đầy đủ dependencies
- Test build local: `npm run build`

**Deploy Failed?**

- Kiểm tra FTP credentials trong Secrets
- Đảm bảo FTP service đang hoạt động trên Somee.com
- Kiểm tra `server-dir` trong workflow file

**Artifacts Not Found?**

- Đảm bảo build job hoàn thành thành công
- Kiểm tra build folder được tạo ra

---

## 🔧 Tùy Chỉnh Workflow

### Thay Đổi Node Version

```yaml
- name: Setup Node.js
  uses: actions/setup-node@v4
  with:
    node-version: "20" # Thay đổi version ở đây
```

### Thay Đổi Build Command

```yaml
- name: Build project
  run: npm run build:production # Thay đổi command
```

### Thay Đổi Deploy Directory

```yaml
- name: Deploy to Somee via FTP
  uses: SamKirkland/FTP-Deploy-Action@v4.3.5
  with:
    server-dir: ./wwwroot/ # Thay đổi thư mục đích
```

### Thêm Environment Variables

```yaml
- name: Build project
  run: npm run build
  env:
    CI: false
    REACT_APP_API_URL: ${{ secrets.API_URL }}
```

---

## 📊 Workflow Status Badge

Thêm badge vào README.md:

```markdown
![Deploy Status](https://github.com/yourusername/your-repo/actions/workflows/deploy.yml/badge.svg)
```

---

**Xem hướng dẫn chi tiết trong file `DEPLOYMENT_GUIDE.md`**
