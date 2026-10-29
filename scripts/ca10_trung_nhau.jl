include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

println(">>> [CA 10] DÃY CÓ TẤT CẢ PHẦN TỬ BẰNG NHAU [5, 5, 5, 5, 5]:")
giai_bai([5, 5, 5, 5, 5]; in_trace=true)
