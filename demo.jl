include(joinpath(@__DIR__, "src", "DeTai.jl"))
using .DeTai

function in_tieu_de()
    println("==========================================================================")
    println("  HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG - KHOA CÔNG NGHỆ THÔNG TIN")
    println("  BÁO CÁO ĐỒ ÁN: CẤU TRÚC DỮ LIỆU VÀ GIẢI THUẬT (INT13185 - NHÓM 03)")
    println("  ĐỀ TÀI: DT062 - ĐẢO NGƯỢC DANH SÁCH LIÊN KẾT ĐƠN BẰNG BA CON TRỎ")
    println("  Sinh viên: Hà Quang Phước | MSSV: N24DCDT074 | Lớp: D24CQDT01-N")
    println("==========================================================================\n")
end

# --- ĐỊNH NGHĨA 12 CA RIÊNG BIỆT (CHẠY ĐƠN LẺ TỪNG CA MỘT) ---

function chay_ca_1()
    println(">>> [CA 1] VÍ DỤ 1 TRÊN PHIẾU GIAO ĐỀ TÀI (Ảnh A01 / VD01):")
    giai_bai([10, 20, 30]; in_trace=true)
end

function chay_ca_2()
    println(">>> [CA 2] VÍ DỤ 2 TRÊN PHIẾU GIAO ĐỀ TÀI (Ảnh A02 / VD02):")
    giai_bai([4, 4, 1, 4]; in_trace=true)
end

function chay_ca_3()
    println(">>> [CA 3] CA TỰ THIẾT KẾ TK01 - DÃY HỖN HỢP ÂM DƯƠNG (Ảnh A03 / TK01):")
    giai_bai([7, -3, 15, 0]; in_trace=true)
end

function chay_ca_4()
    println(">>> [CA 4] CA TỰ THIẾT KẾ TK02 - DÃY ĐỐI XỨNG CÓ TRÙNG (Ảnh A04 / TK02):")
    giai_bai([1, -5, 9, 9, -5, 1]; in_trace=true)
end

function chay_ca_5()
    println(">>> [CA 5] CA BIÊN 1 (BIEN01): DANH SÁCH RỖNG [] (Ảnh A05 / BIEN01):")
    giai_bai(Int[]; in_trace=true)
end

function chay_ca_6()
    println(">>> [CA 6] CA BIÊN 2 (BIEN02): DANH SÁCH MỘT NÚT [8] (Ảnh A06 / BIEN02):")
    giai_bai([8]; in_trace=true)
end

function chay_ca_7()
    println(">>> [CA 7] CA BIÊN 3 (BIEN03): ĐẢO 2 LẦN KHÔI PHỤC [1, 2, 3, 4, 5] (Ảnh A07):")
    L_bien = tao_danh_sach([1, 2, 3, 4, 5])
    println("Dãy gốc ban đầu : ", in_danh_sach(L_bien))
    dao!(L_bien; in_trace=false)
    println("Sau khi đảo lần 1: ", in_danh_sach(L_bien))
    dao!(L_bien; in_trace=false)
    println("Sau khi đảo lần 2: ", in_danh_sach(L_bien), " (Khôi phục nguyên vẹn 100%)")
end

function chay_ca_8()
    println(">>> [CA 8] THỬ NGHIỆM INPUT KHÔNG HỢP LỆ VÀ VALIDATOR (Ảnh A08 / LOI01):")
    println("Thử nghiệm đưa mảng vượt quá 1000 phần tử (n = 1001 > 1000)...")
    try
        mang_loi = collect(1:1001)
        kiem_tra_dau_vao(mang_loi)
        println("LỖI: Validator đã không bắt được mảng vượt giới hạn!")
    catch err
        println("-> Validator phản hồi từ chối hợp lệ: ", sprint(showerror, err))
        println("KẾT QUẢ: ĐÚNG; ngoại lệ ArgumentError đã được bắt chính xác.")
    end
end

function chay_ca_9()
    println(">>> [CA 9] DÃY TOÀN SỐ NGUYÊN ÂM [-10, -20, -30, -40]:")
    giai_bai([-10, -20, -30, -40]; in_trace=true)
end

function chay_ca_10()
    println(">>> [CA 10] DÃY CÓ TẤT CẢ PHẦN TỬ BẰNG NHAU [5, 5, 5, 5, 5]:")
    giai_bai([5, 5, 5, 5, 5]; in_trace=true)
end

function chay_ca_11()
    println(">>> [CA 11] KHẢO SÁT QUY MÔ VỪA n = 20 [1..20]:")
    a = collect(1:20)
    L = tao_danh_sach(a)
    println("Dãy ban đầu : [1, 2, ..., 20] (Số nút: 20)")
    dao!(L; in_trace=false)
    println("Dãy sau đảo : ", in_danh_sach(L))
    println("Đầu mới: ", L.dau.gt, " | Cuối mới: ", L.cuoi.gt)
end

function chay_ca_12()
    println(">>> [CA 12] KHẢO SÁT QUY MÔ LỚN n = 100 [1..100]:")
    a = collect(1:100)
    L = tao_danh_sach(a)
    println("Dãy ban đầu : [1, 2, ..., 100] (Số nút: 100)")
    dao!(L; in_trace=false)
    println("Dãy sau đảo : [100, 99, ..., 1]")
    println("Đầu mới: ", L.dau.gt, " | Cuối mới: ", L.cuoi.gt)
    println("Kiểm tra toàn vẹn 100 nút: ĐẠT")
end

function nhap_ban_phim()
    println("Nhập các số nguyên cách nhau bởi dấu cách (ví dụ: 10 20 30 40 50):")
    dong = readline()
    cac_so = parse.(Int, split(dong))
    giai_bai(cac_so; in_trace=true)
end

function in_menu_huong_dan()
    println("VUI LÒNG CHỌN SỐ THỨ TỰ CA ĐỂ CHẠY RIÊNG TỪNG BÀI (KHÔNG CHẠY TRÀN 12 CA):")
    println("  Ca 1 : Ví dụ 1 trên phiếu (VD01 - [10, 20, 30])")
    println("  Ca 2 : Ví dụ 2 trên phiếu (VD02 - [4, 4, 1, 4])")
    println("  Ca 3 : Ca tự thiết kế 1 (TK01 - [7, -3, 15, 0])")
    println("  Ca 4 : Ca tự thiết kế 2 (TK02 - [1, -5, 9, 9, -5, 1])")
    println("  Ca 5 : Ca biên 1 rỗng (BIEN01 - [])")
    println("  Ca 6 : Ca biên 2 một nút (BIEN02 - [8])")
    println("  Ca 7 : Ca biên 3 đảo 2 lần phục hồi (BIEN03 - [1, 2, 3, 4, 5])")
    println("  Ca 8 : Thử nghiệm bắt lỗi Validator (LOI01 - n=1001)")
    println("  Ca 9 : Dãy toàn số âm ([-10, -20, -30, -40])")
    println("  Ca 10: Dãy phần tử bằng nhau ([5, 5, 5, 5, 5])")
    println("  Ca 11: Quy mô vừa n = 20 ([1..20])")
    println("  Ca 12: Quy mô lớn n = 100 ([1..100])")
    println("-"^74)
    println("CÁCH CHẠY TỪNG LỆNH CHO TỪNG CA:")
    println("  julia demo.jl 1       (Chạy riêng Ca 1)")
    println("  julia demo.jl 2       (Chạy riêng Ca 2)")
    println("  ...                   ...")
    println("  julia demo.jl 12      (Chạy riêng Ca 12)")
    println("Hoặc dùng cờ:")
    println("  julia demo.jl --ca=1  (đến --ca=12)")
    println("Hoặc chạy trực tiếp từng file riêng biệt trong thư mục scripts/:")
    println("  julia scripts/ca01_vd1.jl")
    println("  julia scripts/ca02_vd2.jl")
    println("  ... (đến ca12_quy_mo_100.jl)")
    println("-"^74)
end

# === ĐIỀU PHỐI CHẠY TỪNG CA RIÊNG BIỆT ===
in_tieu_de()

# Kiểm tra tham số truyền vào
if "--nhap" in ARGS
    nhap_ban_phim()
elseif any(startswith("--ca="), ARGS)
    ca_str = only(filter(startswith("--ca="), ARGS))
    val = parse(Int, replace(ca_str, "--ca=" => ""))
    if val == 1; chay_ca_1()
    elseif val == 2; chay_ca_2()
    elseif val == 3; chay_ca_3()
    elseif val == 4; chay_ca_4()
    elseif val == 5; chay_ca_5()
    elseif val == 6; chay_ca_6()
    elseif val == 7; chay_ca_7()
    elseif val == 8; chay_ca_8()
    elseif val == 9; chay_ca_9()
    elseif val == 10; chay_ca_10()
    elseif val == 11; chay_ca_11()
    elseif val == 12; chay_ca_12()
    else
        throw(ArgumentError("Vui lòng chọn từ --ca=1 đến --ca=12"))
    end
elseif length(ARGS) == 1 && tryparse(Int, ARGS[1]) !== nothing && 1 <= parse(Int, ARGS[1]) <= 12
    # Hỗ trợ chạy ngắn gọn: julia demo.jl 1 .. julia demo.jl 12
    c = parse(Int, ARGS[1])
    if c == 1; chay_ca_1()
    elseif c == 2; chay_ca_2()
    elseif c == 3; chay_ca_3()
    elseif c == 4; chay_ca_4()
    elseif c == 5; chay_ca_5()
    elseif c == 6; chay_ca_6()
    elseif c == 7; chay_ca_7()
    elseif c == 8; chay_ca_8()
    elseif c == 9; chay_ca_9()
    elseif c == 10; chay_ca_10()
    elseif c == 11; chay_ca_11()
    elseif c == 12; chay_ca_12()
    end
elseif length(ARGS) > 1 || (length(ARGS) == 1 && tryparse(Int, ARGS[1]) !== nothing && parse(Int, ARGS[1]) > 12)
    # Nhập dãy số tùy biến từ command line
    try
        mang_nhap = [parse(Int, x) for x in ARGS]
        println(">>> ĐANG CHẠY VỚI DÃY SỐ TỰ DO TỪ COMMAND LINE:")
        giai_bai(mang_nhap; in_trace=true)
    catch e
        println("Lỗi phân tích tham số: ", e)
    end
else
    # Khi không có tham số, hiển thị Menu hướng dẫn và KHÔNG chạy tràn cả 12 ca
    in_menu_huong_dan()
end
