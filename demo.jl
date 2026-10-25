include(joinpath(@__DIR__, "src", "DeTai.jl"))
using .DeTai

function chay_demo()
    println("==========================================================================")
    println("  HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG - KHOA CÔNG NGHỆ THÔNG TIN")
    println("  BÁO CÁO ĐỒ ÁN MÔN HỌC: CẤU TRÚC DỮ LIỆU VÀ GIẢI THUẬT (INT13185 - NHÓM 03)")
    println("  ĐỀ TÀI: DT062 - ĐẢO NGƯỢC DANH SÁCH LIÊN KẾT ĐƠN BẰNG BA CON TRỎ")
    println("  Sinh viên: Hà Quang Phước | MSSV: N24DCDT074 | Lớp: D24CQDT01-N")
    println("==========================================================================\n")

    # Kiểm tra xem có truyền tham số dòng lệnh không
    if length(ARGS) > 0
        println(">>> ĐANG CHẠY VỚI THAM SỐ DÒNG LỆNH:")
        try
            mang_nhap = [parse(Int, x) for x in ARGS]
            giai_bai(mang_nhap; in_trace=true)
        catch e
            println("Lỗi phân tích tham số: ", e)
        end
        return
    end

    # 1. Chạy Ví dụ 1 trên phiếu giao đề (A01)
    println(">>> 1. VÍ DỤ 1 TRÊN PHIẾU GIAO ĐỀ TÀI (Ảnh A01):")
    giai_bai([10, 20, 30]; in_trace=true)
    println()

    # 2. Chạy Ví dụ 2 trên phiếu giao đề (A02)
    println(">>> 2. VÍ DỤ 2 TRÊN PHIẾU GIAO ĐỀ TÀI (Ảnh A02):")
    giai_bai([4, 4, 1, 4]; in_trace=true)
    println()

    # 3. Chạy ca tự thiết kế 1 (A03)
    println(">>> 3. CA TỰ THIẾT KẾ TK01 - DÃY HỖN HỢP ÂM DƯƠNG (Ảnh A03):")
    giai_bai([7, -3, 15, 0]; in_trace=true)
    println()

    # 4. Chạy ca tự thiết kế 2 (A04)
    println(">>> 4. CA TỰ THIẾT KẾ TK02 - DÃY ĐỐI XỨNG CÓ TRÙNG (Ảnh A04):")
    giai_bai([1, -5, 9, 9, -5, 1]; in_trace=true)
    println()

    # 5. Các ca biên (A05, A06, A07)
    println(">>> 5. CA BIÊN 1 (BIEN01): DANH SÁCH RỖNG [] (Ảnh A05):")
    giai_bai(Int[]; in_trace=true)
    println()

    println(">>> 6. CA BIÊN 2 (BIEN02): DANH SÁCH MỘT NÚT [8] (Ảnh A06):")
    giai_bai([8]; in_trace=true)
    println()

    println(">>> 7. CA BIÊN 3 (BIEN03): ĐẢO 2 LẦN KHÔI PHỤC [1, 2, 3, 4, 5] (Ảnh A07):")
    L_bien = tao_danh_sach([1, 2, 3, 4, 5])
    println("Dãy gốc     : ", in_danh_sach(L_bien))
    dao!(L_bien; in_trace=false)
    println("Sau đảo lần 1: ", in_danh_sach(L_bien))
    dao!(L_bien; in_trace=false)
    println("Sau đảo lần 2: ", in_danh_sach(L_bien), " (Khôi phục nguyên vẹn)")
    println()

    # 8. Ca thử nghiệm lỗi đầu vào (A08)
    println(">>> 8. THỬ NGHIỆM INPUT KHÔNG HỢP LỆ VÀ VALIDATOR (Ảnh A08):")
    try
        println("Thử nghiệm đưa mảng vượt quá 1000 phần tử (1001 phần tử)...")
        mang_loi = collect(1:1001)
        kiem_tra_dau_vao(mang_loi)
    catch err
        println("-> Validator phản hồi từ chối hợp lệ: ", sprint(showerror, err))
    end
    println()

    println("==========================================================================")
    println("Mẹo: Để nhập dữ liệu tùy ý từ bàn phím, bạn có thể chạy:")
    println("     julia demo.jl 10 20 30 40 50")
    println("==========================================================================")
end

chay_demo()
