include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

println(">>> 1. VÍ DỤ 1 TRÊN PHIẾU GIAO ĐỀ TÀI (Ảnh A01 / VD01):")
giai_bai([10, 20, 30]; in_trace=true)
