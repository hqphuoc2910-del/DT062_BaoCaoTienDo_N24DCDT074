module DeTai

export Nut, DSLK, tao_danh_sach, in_danh_sach, sang_mang, dao!, kiem_tra_dau_vao, giai_bai

"""
    Nut
Cấu trúc một nút trong danh sách liên kết đơn:
- `gt`: giá trị số nguyên chứa trong nút.
- `ke`: con trỏ trỏ tới nút kế tiếp (hoặc `nothing` nếu là nút cuối).
"""
mutable struct Nut
    gt::Int
    ke::Union{Nut, Nothing}
end
Nut(gt::Int) = Nut(gt, nothing)

"""
    DSLK
Cấu trúc danh sách liên kết đơn:
- `dau`: con trỏ trỏ tới nút đầu danh sách (hoặc `nothing` nếu rỗng).
- `cuoi`: con trỏ trỏ tới nút cuối danh sách (tùy chọn mở rộng của đề tài).
- `n`: số lượng nút hiện có trong danh sách.
"""
mutable struct DSLK
    dau::Union{Nut, Nothing}
    cuoi::Union{Nut, Nothing}
    n::Int
end
DSLK() = DSLK(nothing, nothing, 0)

"""
    kiem_tra_dau_vao(du_lieu)
Hợp đồng kiểm tra đầu vào:
- Kiểu dữ liệu phải là Vector{Int}.
- Kích thước mảng n thỏa mãn: 0 <= n <= 1000.
Nếu không thỏa mãn, ném ra ngoại lệ ArgumentError với thông báo cụ thể.
"""
function kiem_tra_dau_vao(du_lieu)
    if !(du_lieu isa Vector{Int})
        throw(ArgumentError("Dữ liệu đầu vào không hợp lệ: phải là một mảng số nguyên (Vector{Int})."))
    end
    n = length(du_lieu)
    if n > 1000
        throw(ArgumentError("Số lượng phần tử vi phạm hợp đồng (n = $n > 1000). Yêu cầu 0 <= n <= 1000."))
    end
    return true
end

"""
    tao_danh_sach(a::Vector{Int}) -> DSLK
Dựng danh sách liên kết đơn từ mảng số nguyên `a`.
Cập nhật đúng con trỏ `dau`, `cuoi` và số lượng `n`.
"""
function tao_danh_sach(a::Vector{Int})
    kiem_tra_dau_vao(a)
    L = DSLK()
    n = length(a)
    if n == 0
        return L
    end
    
    L.dau = Nut(a[1])
    hien_tai = L.dau
    for i in 2:n
        nut_moi = Nut(a[i])
        hien_tai.ke = nut_moi
        hien_tai = nut_moi
    end
    L.cuoi = hien_tai
    L.n = n
    return L
end

"""
    sang_mang(L::DSLK) -> Vector{Int}
Trích xuất danh sách liên kết thành một mảng Vector{Int} theo thứ tự liên kết hiện tại.
Dùng để đối chiếu kiểm thử và xác minh tính toàn vẹn.
"""
function sang_mang(L::DSLK)
    res = Int[]
    p = L.dau
    dem = 0
    # Phòng ngừa trường hợp danh sách bị chu trình (vô hạn)
    while p !== nothing && dem <= L.n + 1
        push!(res, p.gt)
        p = p.ke
        dem += 1
    end
    if dem > L.n + 1
        error("Phát hiện chu trình lặp vô tận trong danh sách liên kết!")
    end
    return res
end

"""
    in_danh_sach(L::DSLK) -> String
Xuất biểu diễn dạng chuỗi của danh sách liên kết.
"""
function in_danh_sach(L::DSLK)
    mang = sang_mang(L)
    return "[" * join(mang, ", ") * "]"
end

"""
    dao!(L::DSLK; in_trace::Bool=false) -> DSLK
Thuật toán đảo ngược danh sách liên kết đơn tại chỗ bằng ba con trỏ (truoc, p, sau).
- Độ phức tạp thời gian: O(n)
- Độ phức tạp bộ nhớ phụ: O(1)
- Nếu L.n <= 6 và in_trace=true, in bảng chi tiết ba biến sau mỗi vòng lặp.
- Cập nhật con trỏ `cuoi` mới là `dau` cũ theo yêu cầu mở rộng của phiếu giao.
"""
function dao!(L::DSLK; in_trace::Bool=false)
    cuoi_moi = L.dau   # Đầu cũ sẽ trở thành cuối mới sau khi đảo
    truoc = nothing
    p = L.dau
    buoc = 0

    if in_trace && L.n <= 6
        println("  +------+----------+----------+----------+-------------------------------------+")
        println("  | Bước |  truoc   |  hien_tai|   sau    | Trạng thái liên kết vừa thay đổi    |")
        println("  +------+----------+----------+----------+-------------------------------------+")
    end

    while p !== nothing
        buoc += 1
        # BẮT BUỘC: lưu lại nút kế tiếp trước khi bẻ gãy liên kết p.ke
        sau = p.ke
        
        # Đổi chiều liên kết: nút hiện tại trỏ ngược về nút đứng trước
        p.ke = truoc

        if in_trace && L.n <= 6
            str_truoc = truoc === nothing ? "null" : string(truoc.gt)
            str_p = string(p.gt)
            str_sau = sau === nothing ? "null" : string(sau.gt)
            thao_tac = "Nút $(str_p) đổi liên kết -> $(str_truoc)"
            println("  | $(rpad(buoc, 4)) | $(rpad(str_truoc, 8)) | $(rpad(str_p, 8)) | $(rpad(str_sau, 8)) | $(rpad(thao_tac, 35)) |")
        end

        # Tịnh tiến hai con trỏ sang bước kế tiếp
        truoc = p
        p = sau
    end

    if in_trace && L.n <= 6
        println("  +------+----------+----------+----------+-------------------------------------+")
    end

    # Cập nhật con trỏ đầu và cuối danh sách
    L.dau = truoc
    L.cuoi = cuoi_moi
    return L
end

"""
    giai_bai(du_lieu; in_trace::Bool=true)
Hàm thực thi bài toán theo đặc tả phiếu giao đề tài:
- Nhận mảng đầu vào `du_lieu`.
- Kiểm tra tính hợp lệ.
- Dựng danh sách và in thông tin ban đầu.
- Đảo ngược danh sách và in vết nếu n <= 6.
- In kết quả cuối cùng sau khi đảo.
"""
function giai_bai(du_lieu; in_trace::Bool=true)
    kiem_tra_dau_vao(du_lieu)
    L = tao_danh_sach(du_lieu)
    chuoi_truoc = in_danh_sach(L)
    so_nut = L.n
    
    println("==================================================================")
    println("ĐẢO NGƯỢC DANH SÁCH LIÊN KẾT ĐƠN BẰNG BA CON TRỎ")
    println("Dãy ban đầu : $chuoi_truoc (Số nút: $so_nut)")
    
    dao!(L; in_trace=in_trace)
    
    chuoi_sau = in_danh_sach(L)
    println("Dãy sau đảo : $chuoi_sau (Số nút: $(L.n))")
    dau_val = L.dau === nothing ? "null" : string(L.dau.gt)
    cuoi_val = L.cuoi === nothing ? "null" : string(L.cuoi.gt)
    println("Đầu mới: $dau_val | Cuối mới: $cuoi_val")
    println("==================================================================")
    return L
end

end # module DeTai
