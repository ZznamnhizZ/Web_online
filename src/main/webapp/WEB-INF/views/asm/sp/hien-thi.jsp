<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Quản Lý Sản Phẩm</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh Sách Sản Phẩm</h2>
        <a href="/asm/sp/add" class="btn btn-success">
            <i class="fas fa-plus"></i> Thêm Sản Phẩm
        </a>
    </div>
    <table class="table table-striped table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th class="text-start">ID SP</th>
            <th class="text-start">Mã SP</th>
            <th class="text-start">Tên SP</th>
            <th class="text-start">Trạng Thái</th>
            <th class="text-start">Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${dsSP}" var="sp">
            <tr>
                <td class="text-start">${sp.idSanPham}</td>
                <td class="text-start">${sp.maSanPham}</td>
                <td class="text-start">${sp.tenSanPham}</td>
                <td class="text-start">
                    <span class="badge ${sp.trangThai ? 'bg-success' : 'bg-secondary'}">
                            ${sp.trangThai ? "On" : "Off"}
                    </span>
                </td>
                <td class="text-start">
                    <!-- Xóa Button với Icon và xác nhận -->
                    <a href="/asm/sp/delete?id=${sp.idSanPham}" class="btn btn-danger btn-sm me-2"
                       onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');">
                        <i class="fas fa-trash-alt"></i> Xóa
                    </a>

                    <!-- Cập Nhật Button với Icon -->
                    <a href="/asm/sp/update?id=${sp.idSanPham}" class="btn btn-warning btn-sm me-2">
                        <i class="fas fa-edit"></i> Cập Nhật
                    </a>

                    <!-- Xem Chi Tiết Button với Icon -->
                    <a href="/asm/spct/hien-thi?id=${sp.idSanPham}" class="btn btn-info btn-sm">
                        <i class="fas fa-eye"></i> Xem Chi Tiết
                    </a>
                </td>
            </tr>
        </c:forEach>

        <!-- Thông báo khi không có dữ liệu -->
        <c:if test="${empty dsSP}">
            <tr>
                <td colspan="5" class="text-center">Không có dữ liệu để hiển thị.</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
