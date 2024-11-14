<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Thêm Sản Phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Thêm Sản Phẩm</h2>
    <form action="/asm/sp/add" method="post">
        <div class="mb-3">
            <label for="maSanPham" class="form-label">Mã Sản Phẩm</label>
            <input type="text" class="form-control" id="maSanPham" name="maSanPham">
        </div>
        <div class="mb-3">
            <label for="tenSanPham" class="form-label">Tên Sản Phẩm</label>
            <input type="text" class="form-control" id="tenSanPham" name="tenSanPham">
        </div>
        <div class="mb-3">
            <label class="form-label">Trạng Thái</label><br>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="trangThai" id="on" value="true">
                <label class="form-check-label" for="on">On</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="trangThai" id="off" value="false">
                <label class="form-check-label" for="off">Off</label>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Add</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
