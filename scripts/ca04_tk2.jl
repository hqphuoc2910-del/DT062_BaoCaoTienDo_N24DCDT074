include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

println(">>> 4. CA TỰ THIẾT KẾ TK02 - DÃY ĐỐI XỨNG CÓ TRÙNG (Ảnh A04 / TK02):")
giai_bai([1, -5, 9, 9, -5, 1]; in_trace=true)
