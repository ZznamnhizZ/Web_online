<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Kich Thuoc</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h2>Add Kich Thuoc</h2>
    <form action="/asm/tt/addkt" method="post">
        <div class="mb-3">
            <label for="maKichThuoc" class="form-label">Ma Kich Thuoc</label>
            <input type="text" class="form-control" id="maKichThuoc" name="maKichThuoc" required>
        </div>
        <div class="mb-3">
            <label for="tenKichThuoc" class="form-label">Ten Kich Thuoc</label>
            <input type="text" class="form-control" id="tenKichThuoc" name="tenKichThuoc" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Trang Thai</label>
            <div>
                <input type="radio" name="trangThai" value="true" id="on" checked>
                <label for="on">On</label>
                <input type="radio" name="trangThai" value="false" id="off">
                <label for="off">Off</label>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Add</button>
        <a href="/asm/tt/hien-thi-kichthuoc" class="btn btn-secondary">Cancel</a>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
