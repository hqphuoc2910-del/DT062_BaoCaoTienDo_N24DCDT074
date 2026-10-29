include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

println(">>> 2. VÍ DỤ 2 TRÊN PHIẾU GIAO ĐỀ TÀI (Ảnh A02 / VD02):")
giai_bai([4, 4, 1, 4]; in_trace=true)
