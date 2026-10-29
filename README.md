# ĐỒ ÁN CẤU TRÚC DỮ LIỆU VÀ GIẢI THUẬT (INT13185 - NHÓM 03)
## ĐỀ TÀI: DT062 - ĐẢO NGƯỢC DANH SÁCH LIÊN KẾT ĐƠN BẰNG BA CON TRỎ

- **Sinh viên thực hiện**: Hà Quang Phước
- **Mã số sinh viên (MSSV)**: N24DCDT074
- **Lớp sinh hoạt**: D24CQDT01-N
- **Giáo viên hướng dẫn**: ThS. Hồ Nhựt Minh
- **Ngôn ngữ & Phiên bản**: Julia 1.12.7 (64-bit trên Windows)

---

## 1. Cấu trúc thư mục mã nguồn
```text
N24DCDT074_DT062_HaQuangPhuoc_MaNguon/
├── src/
│   └── DeTai.jl              # Module chính: định nghĩa Nut, DSLK, dao!, tao_danh_sach, validator
├── test/
│   └── runtests.jl           # Bộ kiểm thử 12 ca độc lập (chạy riêng hoặc toàn bộ)
├── scripts/
│   ├── ca01_vd1.jl           # Chạy riêng Ví dụ 1 (VD01)
│   ├── ca02_vd2.jl           # Chạy riêng Ví dụ 2 (VD02)
│   ├── ca03_tk1.jl           # Chạy riêng Ca tự thiết kế 1 (TK01)
│   ├── ca04_tk2.jl           # Chạy riêng Ca tự thiết kế 2 (TK02)
│   ├── ca05_bien1.jl         # Chạy riêng Ca biên 1 (BIEN01)
│   ├── ca06_bien2.jl         # Chạy riêng Ca biên 2 (BIEN02)
│   ├── ca07_bien3.jl         # Chạy riêng Ca biên 3 (BIEN03)
│   ├── ca08_loi.jl           # Chạy riêng Ca lỗi validator (LOI01)
│   └── test_catalog.jl       # Bảng đối chiếu 12 ca kiểm thử
├── docs/
│   └── anh_ket_qua/          # 11 ảnh minh chứng thực chạy console
├── demo.jl                   # Trình điều phối chạy demo độc lập hoặc nhập tự do
├── khao_sat.jl               # Khảo sát 3 quy mô n = 5, 20, 100
├── Run_all.ps1               # Kịch bản PowerShell chạy kiểm thử trọn gói
└── README.md                 # Hướng dẫn chi tiết
```

---

## 2. Hướng dẫn chạy chương trình

### Cách 1: Chạy riêng từng ca độc lập (mỗi bài 1 lệnh độc lập)
Để hiển thị kết quả gọn gàng phục vụ chụp ảnh minh chứng:

- **Ví dụ 1 trên phiếu (VD01 - [10, 20, 30])**:
  ```powershell
  julia demo.jl 1
  # hoặc: julia scripts/ca01_vd1.jl
  ```

- **Ví dụ 2 trên phiếu (VD02 - [4, 4, 1, 4])**:
  ```powershell
  julia demo.jl 2
  # hoặc: julia scripts/ca02_vd2.jl
  ```

- **Ca tự thiết kế 1 (TK01 - [7, -3, 15, 0])**:
  ```powershell
  julia demo.jl 3
  # hoặc: julia scripts/ca03_tk1.jl
  ```

- **Ca tự thiết kế 2 (TK02 - [1, -5, 9, 9, -5, 1])**:
  ```powershell
  julia demo.jl 4
  # hoặc: julia scripts/ca04_tk2.jl
  ```

- **Ca biên 1 (BIEN01 - Rỗng [])**:
  ```powershell
  julia demo.jl 5
  # hoặc: julia scripts/ca05_bien1.jl
  ```

- **Ca biên 2 (BIEN02 - Một nút [8])**:
  ```powershell
  julia demo.jl 6
  # hoặc: julia scripts/ca06_bien2.jl
  ```

- **Ca biên 3 (BIEN03 - Đảo 2 lần phục hồi [1, 2, 3, 4, 5])**:
  ```powershell
  julia demo.jl 7
  # hoặc: julia scripts/ca07_bien3.jl
  ```

- **Ca kiểm tra từ chối dữ liệu lỗi (LOI01 - n=1001)**:
  ```powershell
  julia demo.jl 8
  # hoặc: julia scripts/ca08_loi.jl
  ```

---

### Cách 2: Chạy kiểm thử tự động (Unit Tests)

- **Chạy toàn bộ 12 ca kiểm thử (Ảnh A09)**:
  ```powershell
  julia test/runtests.jl
  ```
  *(Kết quả: 37/37 assertions PASS, 100% đạt chuẩn)*

- **Chạy riêng 1 ca kiểm thử bất kỳ (ví dụ ca 1)**:
  ```powershell
  julia test/runtests.jl 1
  ```

- **Xem bảng Catalog đối chiếu kỳ vọng và thực tế của 12 ca**:
  ```powershell
  julia scripts/test_catalog.jl
  ```

---

### Cách 3: Nhập dữ liệu tùy ý từ bàn phím hoặc dòng lệnh

- **Nhập tương tác qua bàn phím**:
  ```powershell
  julia demo.jl --nhap
  ```

- **Truyền trực tiếp dãy số từ dòng lệnh**:
  ```powershell
  julia demo.jl 10 20 30 40 50
  ```

---

### Cách 4: Chạy toàn bộ kiểm định tự động End-to-End
```powershell
powershell -ExecutionPolicy Bypass -File .\Run_all.ps1
```
*(Tự động chạy tuần tự từng ca demo từ 1 đến 8, kiểm thử 12 ca, bảng catalog và khảo sát quy mô)*
