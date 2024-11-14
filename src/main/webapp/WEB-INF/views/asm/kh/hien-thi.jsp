<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Khách Hàng</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <!-- Header with Add Button -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh Sách Khách Hàng</h2>
        <a href="/asm/kh/add" class="btn btn-success">
            <i class="fas fa-plus"></i> Thêm Khách Hàng
        </a>
    </div>

    <!-- Success Message -->
    <c:if test="${not empty message}">
        <div class="alert alert-success">
                ${message}
        </div>
    </c:if>

    <!-- Search Form -->
    <form method="get" action="/asm/kh/hien-thi" class="mb-4">
        <div class="input-group" style="max-width: 300px;">
            <input type="text" name="keyword" class="form-control" placeholder="Nhập tên hoặc mã KH" value="${keyword}"
                   required>
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-search"></i> Tìm Kiếm
            </button>
        </div>
    </form>

    <!-- Customer Table -->
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Tên KH</th>
                <th>SDT</th>
                <th>Mã KH</th>
                <th>Loại KH</th>
                <th>Hành Động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${dsKH}" var="kh">
                <tr>
                    <td>${kh.idKhachHang}</td>
                    <td>${kh.tenKH}</td>
                    <td>${kh.sdt}</td>
                    <td>${kh.maKH}</td>
                    <td>
                        <span class="badge ${kh.trangThai ? 'bg-success' : 'bg-secondary'}">
                                ${kh.trangThai ? "Vip" : "Thường"}
                        </span>
                    </td>
                    <td>
                        <!-- Update Button -->
                        <a href="/asm/kh/update?id=${kh.idKhachHang}" class="btn btn-warning btn-sm me-2"
                           title="Cập Nhật">
                            <i class="fas fa-edit"></i> Cập Nhật
                        </a>
                        <!-- Delete Button -->
                        <a href="/asm/kh/delete?id=${kh.idKhachHang}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Bạn có chắc chắn muốn xóa khách hàng này không?');" title="Xóa">
                            <i class="fas fa-trash-alt"></i> Xóa
                        </a>
                    </td>
                </tr>
            </c:forEach>
            <!-- Message When No Data is Available -->
            <c:if test="${empty dsKH}">
                <tr>
                    <td colspan="6" class="text-center">Không có dữ liệu để hiển thị.</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>

    <!-- Pagination Controls -->
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <c:if test="${currentPage > 1}">
                <li class="page-item">
                    <a class="page-link"
                       href="/asm/kh/hien-thi?page=${currentPage - 1}&keyword=${keyword != null ? keyword : ''}"
                       aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
            <c:forEach begin="1" end="${totalPages}" var="i">
                <li class="page-item ${i == currentPage ? 'active' : ''}">
                    <a class="page-link"
                       href="/asm/kh/hien-thi?page=${i}&keyword=${keyword != null ? keyword : ''}">${i}</a>
                </li>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <li class="page-item">
                    <a class="page-link"
                       href="/asm/kh/hien-thi?page=${currentPage + 1}&keyword=${keyword != null ? keyword : ''}"
                       aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
