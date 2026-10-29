include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

println(">>> [CA 12] KHẢO SÁT QUY MÔ LỚN n = 100 [1..100]:")
a = collect(1:100)
L = tao_danh_sach(a)
println("Dãy ban đầu : [1, 2, ..., 100] (Số nút: 100)")
dao!(L; in_trace=false)
println("Dãy sau đảo : [100, 99, ..., 1]")
println("Đầu mới: ", L.dau.gt, " | Cuối mới: ", L.cuoi.gt)
println("Kiểm tra toàn vẹn 100 nút: ĐẠT")
