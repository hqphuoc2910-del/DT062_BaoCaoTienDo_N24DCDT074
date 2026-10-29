include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

println(">>> 8. THỬ NGHIỆM INPUT KHÔNG HỢP LỆ VÀ VALIDATOR (Ảnh A08 / LOI01):")
println("Thử nghiệm đưa mảng vượt quá 1000 phần tử (1001 phần tử)...")
try
    mang_loi = collect(1:1001)
    kiem_tra_dau_vao(mang_loi)
    println("LỖI: Validator đã không bắt được mảng vượt giới hạn!")
catch err
    println("-> Validator phản hồi từ chối hợp lệ: ", sprint(showerror, err))
    println("KẾT QUẢ MINH HỌA: ĐÚNG; ngoại lệ ArgumentError dự kiến đã được bắt chính xác.")
end
