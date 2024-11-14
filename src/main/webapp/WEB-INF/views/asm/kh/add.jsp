<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Khách Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        /* Tùy chọn: Thêm các kiểu CSS tùy chỉnh nếu cần */
        .form-container {
            max-width: 700px; /* Điều chỉnh kích thước tối đa theo ý bạn */
            padding: 30px;
            border: 1px solid #dee2e6;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body class="container mt-5">
<div class="row justify-content-center">
    <div class="col-md-8 form-container">
        <h2 class="text-center mb-4">Thêm Khách Hàng</h2>
        <form:form action="/asm/kh/add" method="post" modelAttribute="khachHang" cssClass="needs-validation"
                   novalidate="novalidate">
            <!-- Tên Khách Hàng -->
            <div class="row mb-3">
                <label for="tenKH" class="col-sm-3 col-form-label">Tên Khách Hàng</label>
                <div class="col-sm-9">
                    <form:input path="tenKH" cssClass="form-control" id="tenKH"/>
                    <form:errors path="tenKH" cssClass="text-danger"/>
                </div>
            </div>

            <!-- SĐT -->
            <div class="row mb-3">
                <label for="sdt" class="col-sm-3 col-form-label">SĐT</label>
                <div class="col-sm-9">
                    <form:input path="sdt" cssClass="form-control" id="sdt"/>
                    <form:errors path="sdt" cssClass="text-danger"/>
                </div>
            </div>

            <!-- Mã KH -->
            <div class="row mb-3">
                <label for="maKH" class="col-sm-3 col-form-label">Mã KH</label>
                <div class="col-sm-9">
                    <form:input path="maKH" cssClass="form-control" id="maKH"/>
                    <form:errors path="maKH" cssClass="text-danger"/>
                </div>
            </div>

            <!-- Loại KH -->
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label">Loại KH</label>
                <div class="col-sm-9">
                    <div class="form-check form-check-inline">
                        <form:radiobutton path="trangThai" cssClass="form-check-input" id="vip" value="true"/>
                        <form:label path="trangThai" cssClass="form-check-label" for="vip">Vip</form:label>
                    </div>
                    <div class="form-check form-check-inline">
                        <form:radiobutton path="trangThai" cssClass="form-check-input" id="thuong" value="false"/>
                        <form:label path="trangThai" cssClass="form-check-label" for="thuong">Thường</form:label>
                    </div>
                    <form:errors path="trangThai" cssClass="text-danger"/>
                </div>
            </div>

            <!-- Nút Submit và Hủy -->
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-9 d-flex justify-content-between">
                    <button type="submit" class="btn btn-success">Thêm</button>
                    <a href="/asm/kh/hien-thi" class="btn btn-secondary">Hủy</a>
                </div>
            </div>
        </form:form>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
