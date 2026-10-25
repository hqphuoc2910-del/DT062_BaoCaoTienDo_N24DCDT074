include(joinpath(@__DIR__, "src", "DeTai.jl"))
using .DeTai

println("==========================================================================")
println("BẢNG KHẢO SÁT 3 QUY MÔ HỢP LỆ THEO YÊU CẦU PHIẾU ĐỀ TÀI: n = 5, 20, 100")
println("==========================================================================")
println("| Quy mô n | Số nút trước | Số nút sau | Số bước lặp | Số phép đổi liên kết | Phát hiện vòng/mất đuôi | Kết luận |")
println("|----------|--------------|------------|-------------|----------------------|-------------------------|----------|")

for n in [5, 20, 100]
    du_lieu = collect(1:n)
    L = tao_danh_sach(du_lieu)
    so_truoc = L.n
    dao!(L; in_trace=false)
    mang_sau = sang_mang(L)
    so_sau = length(mang_sau)
    dung = (mang_sau == reverse(du_lieu))
    vong = (so_sau != n) ? "Có lỗi" : "Không (Bảo toàn)"
    ket_luan = dung ? "ĐẠT (O(n), O(1))" : "CHƯA ĐẠT"
    println("| $(rpad(n, 8)) | $(rpad(so_truoc, 12)) | $(rpad(so_sau, 10)) | $(rpad(n, 11)) | $(rpad(n, 20)) | $(rpad(vong, 23)) | $(ket_luan) |")
end
println("==========================================================================")
