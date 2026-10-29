include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

println(">>> [CA 11] KHẢO SÁT QUY MÔ VỪA n = 20 [1..20]:")
a = collect(1:20)
L = tao_danh_sach(a)
println("Dãy ban đầu : [1, 2, ..., 20] (Số nút: 20)")
dao!(L; in_trace=false)
println("Dãy sau đảo : ", in_danh_sach(L))
println("Đầu mới: ", L.dau.gt, " | Cuối mới: ", L.cuoi.gt)
