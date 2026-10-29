include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

println(">>> 7. CA BIÊN 3 (BIEN03): ĐẢO 2 LẦN KHÔI PHỤC [1, 2, 3, 4, 5] (Ảnh A07 / BIEN03):")
L_bien = tao_danh_sach([1, 2, 3, 4, 5])
println("Dãy gốc ban đầu : ", in_danh_sach(L_bien))
dao!(L_bien; in_trace=false)
println("Sau khi đảo lần 1: ", in_danh_sach(L_bien))
dao!(L_bien; in_trace=false)
println("Sau khi đảo lần 2: ", in_danh_sach(L_bien), " (Khôi phục nguyên vẹn 100%)")
