include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

println(">>> 3. CA TỰ THIẾT KẾ TK01 - DÃY HỖN HỢP ÂM DƯƠNG (Ảnh A03 / TK01):")
giai_bai([7, -3, 15, 0]; in_trace=true)
