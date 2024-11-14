<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Danh Sách Nhân Viên</title>
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
        <h2>Danh Sách Nhân Viên</h2>
        <a href="/asm/nv/add" class="btn btn-success">
            <i class="fas fa-plus"></i> Thêm Nhân Viên
        </a>
    </div>

    <!-- Search Form -->
    <form method="get" action="/asm/nv/hien-thi" class="mb-4">
        <div class="input-group" style="max-width: 400px;">
            <input type="text" name="keyword" class="form-control" placeholder="Nhập tên hoặc mã NV" value="${keyword}">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-search"></i> Tìm Kiếm
            </button>
        </div>
    </form>

    <!-- Employee Table -->
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Tên NV</th>
                <th>Mã NV</th>
                <th>Tên Đăng Nhập</th>
                <th>Mật Khẩu</th>
                <th>Trạng Thái</th>
                <th>Hành Động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${dsNV}" var="nv">
                <tr>
                    <td>${nv.idNhanVien}</td>
                    <td>${nv.tenNV}</td>
                    <td>${nv.maNV}</td>
                    <td>${nv.username}</td>
                    <td>${nv.password}</td>
                    <td>
                        <span class="badge ${nv.trangThai ? 'bg-success' : 'bg-secondary'}">
                                ${nv.trangThai ? "Hoạt động" : "Không hoạt động"}
                        </span>
                    </td>
                    <td>
                        <!-- Update Button -->
                        <a href="/asm/nv/update?id=${nv.idNhanVien}" class="btn btn-warning btn-sm me-2"
                           title="Cập Nhật">
                            <i class="fas fa-edit"></i> Update
                        </a>
                        <!-- Delete Button -->
                        <a href="/asm/nv/delete?id=${nv.idNhanVien}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Bạn có chắc chắn muốn xóa nhân viên này không?');" title="Xóa">
                            <i class="fas fa-trash-alt"></i> Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
            <!-- Message When No Data is Available -->
            <c:if test="${empty dsNV}">
                <tr>
                    <td colspan="7" class="text-center">Không có dữ liệu để hiển thị.</td>
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
                       href="/asm/nv/hien-thi?page=${currentPage - 1}&keyword=${fn:escapeXml(keyword)}"
                       aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
            <c:forEach begin="1" end="${totalPages}" var="i">
                <li class="page-item ${i == currentPage ? 'active' : ''}">
                    <a class="page-link" href="/asm/nv/hien-thi?page=${i}&keyword=${fn:escapeXml(keyword)}">${i}</a>
                </li>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <li class="page-item">
                    <a class="page-link"
                       href="/asm/nv/hien-thi?page=${currentPage + 1}&keyword=${fn:escapeXml(keyword)}"
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
