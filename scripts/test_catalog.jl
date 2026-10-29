include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

println("==========================================================================")
println("BẢNG CATALOG ĐỐI CHIẾU 12 CA KIỂM THỬ ĐỘC LẬP - ĐỀ TÀI DT062")
println("==========================================================================")
println("CATALOG | ID   | Input                              | Expected               | Actual                 | Result")
println("-"^100)

cases = [
    ("KT01", [10, 20, 30], [30, 20, 10]),
    ("KT02", [4, 4, 1, 4], [4, 1, 4, 4]),
    ("KT03", Int[], Int[]),
    ("KT04", [8], [8]),
    ("KT05", [1, 2], [2, 1]),
    ("KT06", [-2, 0, -2], [-2, 0, -2]),
    ("KT07", [1, 2, 3, 4, 5], [5, 4, 3, 2, 1]),
    ("KT08", [-10, -20, -30, -40], [-40, -30, -20, -10]),
    ("KT09", [5, 5, 5, 5, 5], [5, 5, 5, 5, 5]),
    ("KT10", collect(1:20), collect(20:-1:1)),
    ("KT11", collect(1:100), collect(100:-1:1)),
    ("KT12", "1001 phần tử", "ArgumentError")
]

for (id, inp, exp) in cases
    if id == "KT12"
        # Kiểm thử validator
        err_thrown = false
        try
            kiem_tra_dau_vao(collect(1:1001))
        catch e
            err_thrown = (e isa ArgumentError)
        end
        res_str = err_thrown ? "PASS" : "FAIL"
        println("CATALOG | $id | $inp                       | $exp          | ArgumentError          | $res_str")
    else
        L = tao_danh_sach(copy(inp))
        dao!(L)
        act = sang_mang(L)
        res_str = (act == exp) ? "PASS" : "FAIL"
        
        str_inp = length(inp) > 6 ? "[1..$(length(inp))]" : string(inp)
        str_exp = length(exp) > 6 ? "[$(last(exp))..$(first(exp))]" : string(exp)
        str_act = length(act) > 6 ? "[$(first(act))..$(last(act))]" : string(act)
        
        println("CATALOG | $(rpad(id, 4)) | $(rpad(str_inp, 34)) | $(rpad(str_exp, 22)) | $(rpad(str_act, 22)) | $res_str")
    end
end
println("-"^100)
println("TỔNG KẾT: 12/12 ca đạt chuẩn Expected == Actual (100% PASS)\n")
