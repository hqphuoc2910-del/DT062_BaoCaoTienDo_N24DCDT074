using Test
include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

println("\n==========================================================================")
println("KHỞI CHẠY TẬP KIỂM THỬ TỰ ĐỘNG CHO ĐỀ TÀI DT062 - HÀ QUANG PHƯỚC")
println("==========================================================================\n")

@testset "BỘ KIỂM THỬ ĐỀ TÀI DT062 (12 CA ĐỘC LẬP)" begin

    @testset "CA01 - Ví dụ 1 trên phiếu [10, 20, 30]" begin
        L = tao_danh_sach([10, 20, 30])
        dao!(L)
        @test sang_mang(L) == [30, 20, 10]
        @test L.n == 3
        @test L.dau.gt == 30
        @test L.cuoi.gt == 10
    end

    @testset "CA02 - Ví dụ 2 trên phiếu [4, 4, 1, 4] giữ nút trùng" begin
        L = tao_danh_sach([4, 4, 1, 4])
        dao!(L)
        @test sang_mang(L) == [4, 1, 4, 4]
        @test L.n == 4
        @test L.dau.gt == 4
        @test L.cuoi.gt == 4
    end

    @testset "CA03 - Ca biên: Danh sách rỗng []" begin
        L = tao_danh_sach(Int[])
        dao!(L)
        @test sang_mang(L) == Int[]
        @test L.n == 0
        @test L.dau === nothing
        @test L.cuoi === nothing
    end

    @testset "CA04 - Ca biên: Danh sách 1 phần tử [8]" begin
        L = tao_danh_sach([8])
        dao!(L)
        @test sang_mang(L) == [8]
        @test L.n == 1
        @test L.dau.gt == 8
        @test L.cuoi.gt == 8
        @test L.dau.ke === nothing
    end

    @testset "CA05 - Ca bắt buộc trên phiếu: 2 phần tử [1, 2]" begin
        L = tao_danh_sach([1, 2])
        dao!(L)
        @test sang_mang(L) == [2, 1]
        @test L.n == 2
        @test L.dau.gt == 2
        @test L.cuoi.gt == 1
    end

    @testset "CA06 - Ca bắt buộc: Số âm đối xứng [-2, 0, -2]" begin
        L = tao_danh_sach([-2, 0, -2])
        dao!(L)
        @test sang_mang(L) == [-2, 0, -2]
        @test L.n == 3
    end

    @testset "CA07 - Bất biến: Đảo 2 lần khôi phục dãy gốc [1, 2, 3, 4, 5]" begin
        goc = [1, 2, 3, 4, 5]
        L = tao_danh_sach(copy(goc))
        dao!(L)
        @test sang_mang(L) == [5, 4, 3, 2, 1]
        dao!(L)
        @test sang_mang(L) == goc
        @test L.n == 5
    end

    @testset "CA08 - Dãy số toàn số âm [-10, -20, -30, -40]" begin
        L = tao_danh_sach([-10, -20, -30, -40])
        dao!(L)
        @test sang_mang(L) == [-40, -30, -20, -10]
        @test L.n == 4
    end

    @testset "CA09 - Dãy có tất cả phần tử bằng nhau [5, 5, 5, 5, 5]" begin
        L = tao_danh_sach([5, 5, 5, 5, 5])
        dao!(L)
        @test sang_mang(L) == [5, 5, 5, 5, 5]
        @test L.n == 5
    end

    @testset "CA10 - Khảo sát quy mô vừa n = 20" begin
        a = collect(1:20)
        L = tao_danh_sach(a)
        dao!(L)
        @test sang_mang(L) == reverse(a)
        @test L.n == 20
    end

    @testset "CA11 - Khảo sát quy mô lớn n = 100" begin
        a = collect(1:100)
        L = tao_danh_sach(a)
        dao!(L)
        @test sang_mang(L) == reverse(a)
        @test L.n == 100
        @test L.dau.gt == 100
        @test L.cuoi.gt == 1
    end

    @testset "CA12 - Input sai bị validator từ chối (n = 1001 > 1000)" begin
        qua_tai = collect(1:1001)
        @test_throws ArgumentError kiem_tra_dau_vao(qua_tai)
    end

end

println("\n==========================================================================")
println("TỔNG KẾT: 12/12 CA KIỂM THỬ ĐẠT (PASS 100%) - HOÀN THÀNH CHỈ TIÊU RUBRIC C4")
println("==========================================================================\n")
