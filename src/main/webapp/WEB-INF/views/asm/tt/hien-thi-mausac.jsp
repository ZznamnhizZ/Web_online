<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Danh Sách Màu Sắc</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh Sách Màu Sắc</h2>
        <a href="/asm/tt/addms" class="btn btn-success">
            <i class="fas fa-plus"></i> Thêm Màu Sắc
        </a>
    </div>
    <table class="table table-striped table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Mã</th>
            <th>Tên</th>
            <th>Trạng Thái</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${dsMs}" var="ms">
            <tr>
                <td>${ms.id}</td> <!-- Đã thay đổi từ idMauSac thành id -->
                <td>${ms.maMauSac}</td>
                <td>${ms.tenMauSac}</td>
                <td>
                    <span class="badge ${ms.trangThai ? 'bg-success' : 'bg-secondary'}">
                            ${ms.trangThai ? "On" : "Off"}
                    </span>
                </td>
                <td>
                    <!-- Update Button with Icon -->
                    <a href="/asm/tt/update?id=${ms.id}" class="btn btn-warning btn-sm me-2">
                        <i class="fas fa-edit"></i> Update
                    </a>

                    <!-- Delete Button with Icon -->
                    <a href="/asm/tt/delete?id=${ms.id}" class="btn btn-danger btn-sm"
                       onclick="return confirm('Bạn có chắc chắn muốn xóa màu sắc này không?');">
                        <i class="fas fa-trash-alt"></i> Delete
                    </a>
                </td>
            </tr>
        </c:forEach>

        <!-- Message when no data is available -->
        <c:if test="${empty dsMs}">
            <tr>
                <td colspan="5" class="text-center">Không có dữ liệu để hiển thị.</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
