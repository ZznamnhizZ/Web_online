<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Color</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h2>Add New Color</h2>
    <form action="/asm/tt/addms" method="post">
        <div class="mb-3">
            <label for="maMauSac" class="form-label">Ma MS</label>
            <input type="text" class="form-control" id="maMauSac" name="maMauSac">
        </div>
        <div class="mb-3">
            <label for="tenMauSac" class="form-label">Ten MS</label>
            <input type="text" class="form-control" id="tenMauSac" name="tenMauSac">
        </div>
        <div class="mb-3">
            <label class="form-label">Trang Thai</label>
            <div>
                <input type="radio" name="trangThai" value="true" id="on">
                <label for="on">On</label>
                <input type="radio" name="trangThai" value="false" id="off">
                <label for="off">Off</label>
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
