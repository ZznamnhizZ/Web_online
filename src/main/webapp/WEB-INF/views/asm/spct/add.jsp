<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Chi Tiết Sản Phẩm</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Thêm Chi Tiết Sản Phẩm</h2>
    <form action="/asm/spct/add" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="maSPCT" class="form-label">Mã Chi Tiết Sản Phẩm</label>
            <input type="text" class="form-control" id="maSPCT" name="maSPCT" required>
        </div>
        <div class="mb-3">
            <label for="sanPhamAsm" class="form-label">Sản Phẩm</label>
            <select class="form-select" id="sanPhamAsm" name="sanPhamAsm.idSanPham" required>
                <option value="" selected>Chọn Sản Phẩm</option>
                <c:forEach items="${dsSanPham}" var="sp">
                    <option value="${sp.idSanPham}">${sp.tenSanPham}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="mauSac" class="form-label">Màu Sắc</label>
            <select class="form-select" id="mauSac" name="mauSac.id" required>
                <option value="" selected>Chọn Màu Sắc</option>
                <c:forEach items="${dsMauSac}" var="ms">
                    <option value="${ms.id}">${ms.tenMauSac}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="kichThuoc" class="form-label">Kích Thước</label>
            <select class="form-select" id="kichThuoc" name="kichThuoc.id" required>
                <option value="" selected>Chọn Kích Thước</option>
                <c:forEach items="${dsKichThuoc}" var="kt">
                    <option value="${kt.id}">${kt.tenKichThuoc}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="soLuong" class="form-label">Số Lượng</label>
            <input type="number" class="form-control" id="soLuong" name="soLuong" min="0" required>
        </div>
        <div class="mb-3">
            <label for="donGia" class="form-label">Đơn Giá</label>
            <input type="number" step="0.01" class="form-control" id="donGia" name="donGia" min="0" required>
        </div>
        <div class="mb-3">
            <label for="image" class="form-label">Hình Ảnh</label>
            <input type="text" class="form-control" id="image" name="image">
        </div>
        <div class="mb-3">image
            <label for="trangThai" class="form-label">Trạng Thái</label>
            <select class="form-select" id="trangThai" name="trangThai" required>
                <option value="true" selected>Hoạt Động</option>
                <option value="false">Không Hoạt Động</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Lưu</button>
        <a href="/asm/spct/hien-thi" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Quay Lại</a>
    </form>
</div>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
