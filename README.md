Chia sẻ website tĩnh từ thư mục này

Tệp này chứa một trang tĩnh (HTML/CSS/JS). Hướng dẫn nhanh để bạn bè truy cập từ máy của bạn.

Hai cách chính:

- Tạm thời (nhanh): khởi động server tĩnh trên máy của bạn rồi mở một tunnel (ngrok hoặc localtunnel) để có URL công khai.
- Lâu dài (khuyên dùng): đẩy repo lên GitHub và kích hoạt GitHub Pages (hoặc host trên Netlify/Vercel).

## Cách nhanh (PowerShell)

1. Mở PowerShell trong thư mục này (`d:\vs code\hi`).
2. Chạy script khởi động server tĩnh:

```powershell
.\serve.ps1 -Port 8000
```

Script sẽ tự động dùng Python (`python -m http.server`) hoặc `npx http-server` nếu có. Sau khi chạy, mở trình duyệt vào:

```
http://localhost:8000
```

3. Để chia sẻ với bạn bè (tạo đường dẫn công khai), dùng một trong các công cụ tunnel sau:

- ngrok (cần đăng ký và tải về):

```powershell
# sau khi cài và đăng nhập
ngrok http 8000
```

Ngrok sẽ cung cấp một URL public (https://...).

- localtunnel (không cần cài đặt hệ thống, dùng npx):

```powershell
npx localtunnel --port 8000
# hoặc muốn subdomain
npx localtunnel --port 8000 --subdomain tenban
```

Lưu ý: localtunnel có thể cho subdomain bị chiếm hoặc không ổn định; ngrok ổn định hơn.

## Đăng lên GitHub Pages (lâu dài)

1. Tạo repo trên GitHub.
2. Từ thư mục này, chạy (nếu chưa có git):

```powershell
git init
git add .
git commit -m "Initial site"
git branch -M main
git remote add origin https://github.com/<your-user>/<your-repo>.git
git push -u origin main
```

3. Vào cài đặt repo trên GitHub -> Pages -> chọn branch `main` (hoặc `gh-pages`) làm source. Sau vài phút bạn sẽ có URL `https://<your-user>.github.io/<your-repo>/`.

## Ghi chú

- Nếu tập tin của bạn tham chiếu đến đường dẫn tuyệt đối (ví dụ `/static/favicon.ico`) — khi dùng server tĩnh từ thư mục gốc hãy đảm bảo file tồn tại đúng như đường dẫn hoặc sửa lại đường dẫn thành tương đối (ví dụ `static/favicon.ico` hoặc `favicon.ico`).
- Nếu PowerShell chặn chạy script, bạn có thể chạy:

```powershell
# chỉ một lần cho session này
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\serve.ps1
```

Nếu bạn muốn, tôi có thể hướng dẫn cụ thể để cấu hình ngrok, hoặc giúp bạn đẩy lên GitHub và kích hoạt GitHub Pages.
