include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

println(">>> [CA 9] DÃY TOÀN SỐ NGUYÊN ÂM [-10, -20, -30, -40]:")
giai_bai([-10, -20, -30, -40]; in_trace=true)
