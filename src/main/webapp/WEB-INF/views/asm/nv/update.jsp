<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cập Nhật Nhân Viên</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <h2>Cập Nhật Nhân Viên</h2>
    <form action="/asm/nv/update" method="post">
        <div class="mb-3">
            <label for="tenNV" class="form-label">Tên Nhân Viên</label>
            <input type="text" name="idNhanVien" class="form-control" id="idNhanVien" value="${nv.idNhanVien}" readonly
                   required>
        </div>

        <div class="mb-3">
            <label for="tenNV" class="form-label">Tên Nhân Viên</label>
            <input type="text" name="tenNV" class="form-control" id="tenNV" value="${nv.tenNV}" required>
        </div>

        <div class="mb-3">
            <label for="maNV" class="form-label">Mã Nhân Viên</label>
            <input type="text" name="maNV" class="form-control" id="maNV" value="${nv.maNV}" required>
        </div>

        <div class="mb-3">
            <label for="username" class="form-label">Tên Đăng Nhập</label>
            <input type="text" name="username" class="form-control" id="username" value="${nv.username}" required>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Mật Khẩu</label>
            <input type="password" name="password" class="form-control" id="password" value="${nv.password}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Trạng Thái</label><br>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="trangThai" id="hoatDong" value="true"
                ${nv.trangThai ? "checked" : ""} required>
                <label class="form-check-label" for="hoatDong">Hoạt Động</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="trangThai" id="khongHoatDong" value="false"
                ${!nv.trangThai ? "checked" : ""} required>
                <label class="form-check-label" for="khongHoatDong">Không Hoạt Động</label>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Cập Nhật</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
