## Lark Popup Blocker Script

### Mô tả

Script `lark_uia_log_all.ahk` tự động ẩn các popup thông báo từ ứng dụng Lark khi phát hiện các text cụ thể. Script sử dụng UIA-v2 để quét nội dung của các cửa sổ popup và ẩn chúng ngay lập tức khi tìm thấy text trong danh sách chặn.

### Yêu cầu hệ thống

- Windows 10/11
- AutoHotkey v2.0
- Ứng dụng Lark đã được cài đặt

### Hướng dẫn cài đặt

#### Bước 1: Tải và cài đặt AutoHotkey v2.0

1. Truy cập trang tải AutoHotkey v2.0:
   - **Trang chủ**: https://www.autohotkey.com/
   - **Tải trực tiếp**: https://www.autohotkey.com/download/ahk-v2.exe

2. Chạy file cài đặt `ahk-v2.exe`

3. Làm theo hướng dẫn cài đặt:
   - Chọn "Install" để cài đặt vào thư mục mặc định
   - Hoặc chọn "Custom installation" để tùy chỉnh thư mục cài đặt

4. Sau khi cài đặt xong, AutoHotkey v2.0 sẽ được liên kết với các file `.ahk`

#### Bước 2: Tải và giải nén UIA-v2

1. Tải repository này về máy (hoặc clone nếu có Git):
   ```bash
   git clone https://github.com/Descolada/UIA-v2.git
   ```
   Hoặc tải file ZIP và giải nén

2. Đảm bảo cấu trúc thư mục như sau:
   ```
   UIA-v2-main/
   ├── Lib/
   │   └── UIA.ahk
   └── lark_uia_log_all.ahk
   ```

#### Bước 3: Cấu hình script

1. Mở file `lark_uia_log_all.ahk` bằng Notepad hoặc bất kỳ text editor nào

2. Tùy chỉnh danh sách text cần chặn (dòng 9):
   ```ahk
   blockedTexts := ["Phạm Huyền My", "Bùi Thị Bảo Anh"]
   ```
   Thay đổi các text trong mảng này theo nhu cầu của bạn.

3. Lưu file

#### Bước 4: Chạy script

**Cách 1: Chạy trực tiếp**
- Double-click vào file `lark_uia_log_all.ahk`
- Script sẽ chạy ngầm trong background

**Cách 3: Chạy từ Command Prompt**
```cmd
cd "đường-dẫn-đến-thư-mục-UIA-v2"
"C:\Program Files\AutoHotkey\v2\AutoHotkey.exe" lark_uia_log_all.ahk
```
Lưu ý: Thay `đường-dẫn-đến-thư-mục-UIA-v2` bằng đường dẫn thực tế trên máy của bạn.

### Cách sử dụng

1. Đảm bảo ứng dụng Lark đang chạy

2. Chạy script `lark_uia_log_all.ahk`

3. Script sẽ tự động:
   - Kiểm tra các popup của Lark mỗi 10ms
   - Quét nội dung text trong các popup
   - Tự động ẩn popup nếu phát hiện text trong danh sách `blockedTexts`

4. Script chạy ngầm, không có giao diện. Để dừng script:
   - Mở Task Manager (Ctrl + Shift + Esc)
   - Tìm process "AutoHotkey.exe"
   - End task

### Tùy chỉnh

- **Thay đổi thời gian kiểm tra**: Sửa giá trị ở dòng 12 (mặc định: 10ms)
- **Thêm/xóa text cần chặn**: Sửa mảng `blockedTexts` ở dòng 10
- **Thay đổi kích thước cửa sổ popup**: Sửa điều kiện ở dòng 28 (mặc định: bỏ qua cửa sổ >= 800x500)

### Lưu ý

- Script chỉ hoạt động với các popup của Lark (ahk_exe Lark.exe)
- Script cần quyền truy cập UIA (UI Automation) để đọc nội dung cửa sổ
- Đảm bảo thư mục `Lib\UIA.ahk` tồn tại và đúng đường dẫn