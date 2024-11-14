<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Danh Sách Kích Thước</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome (Để sử dụng các biểu tượng) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <!-- Header với tiêu đề và nút thêm -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh Sách Kích Thước</h2>
        <a href="/asm/tt/addkt" class="btn btn-success">
            <i class="fas fa-plus"></i> Thêm KT
        </a>
    </div>

    <!-- Bảng danh sách Kích Thước -->
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Mã KT</th>
                <th>Tên KT</th>
                <th>Trạng Thái</th>
                <th>Hành Động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${dsKichThuoc}" var="kichThuoc">
                <tr>
                    <td>${kichThuoc.id}</td>
                    <td>${kichThuoc.maKichThuoc}</td>
                    <td>${kichThuoc.tenKichThuoc}</td>
                    <td>
                            <span class="badge ${kichThuoc.trangThai ? 'bg-success' : 'bg-secondary'}">
                                    ${kichThuoc.trangThai ? "On" : "Off"}
                            </span>
                    </td>
                    <td>
                        <a href="/asm/tt/updatekt?id=${kichThuoc.id}" class="btn btn-warning btn-sm me-2"
                           title="Cập Nhật">
                            <i class="fas fa-edit"></i> Update
                        </a>
                        <a href="/asm/tt/deletekt?id=${kichThuoc.id}" class="btn btn-danger btn-sm" title="Xóa"
                           onclick="return confirm('Bạn có chắc chắn muốn xóa kích thước này không?');">
                            <i class="fas fa-trash-alt"></i> Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty dsKichThuoc}">
                <tr>
                    <td colspan="5" class="text-center">Không có dữ liệu để hiển thị.</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS và các phụ thuộc -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESa
