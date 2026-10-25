# DT062 — ĐẢO NGƯỢC DANH SÁCH LIÊN KẾT ĐƠN BẰNG BA CON TRỎ

## Thông tin sinh viên và đề tài
- **Họ và tên:** Hà Quang Phước
- **MSSV:** N24DCDT074
- **Lớp:** D24CQDT01-N
- **Học phần:** Cấu trúc dữ liệu và giải thuật (INT13185 — Nhóm 03)
- **Giảng viên hướng dẫn:** ThS. Hồ Nhựt Minh
- **Mã đề tài:** DT062
- **Tên đề tài:** Đảo ngược danh sách liên kết đơn bằng ba con trỏ
- **Cơ sở giáo trình:** *Giáo trình Cấu trúc dữ liệu và Giải thuật (INT1306)* — Chương 5, Mục 5.2.5 "Đảo ngược danh sách", Ví dụ 5.1; trang in 121–122, trang PDF 133–134.

## Mô tả thuật toán
Thuật toán đảo ngược danh sách liên kết đơn tại chỗ (*in-place*) mà không tạo thêm nút mới hay sao chép sang mảng phụ:
- Dùng ba con trỏ: `truoc` (nút đứng trước), `p` (nút hiện tại đang xét), `sau` (nút kế tiếp được lưu tạm).
- Điểm cốt lõi: Phải lưu `sau = p.ke` trước khi gán `p.ke = truoc`, tránh làm mất liên kết tới phần danh sách phía sau.
- Độ phức tạp thời gian: $\mathcal{O}(n)$.
- Độ phức tạp bộ nhớ phụ: $\mathcal{O}(1)$.

## Hướng dẫn chạy chương trình

### 1. Kiểm tra môi trường
```powershell
julia --version
```

### 2. Chạy chương trình demo chính
```powershell
julia demo.jl
```

Chạy với dữ liệu nhập tùy ý:
```powershell
julia demo.jl 10 20 30 40 50
```

### 3. Chạy toàn bộ bộ kiểm thử tự động (12 ca)
```powershell
julia test/runtests.jl
```

## Bằng chứng kiểm thử và ảnh kết quả
Toàn bộ ảnh chụp kết quả thật từ A01 đến A11 được lưu trữ tại thư mục: `docs/anh_ket_qua/`.
