<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Trang Quản Trị</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="https://mdbootstrap.com/img/logo/mdb-transaprent-noshadows.png" height="30" alt=""
                 loading="lazy"/>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/asm/kh/hien-thi">Quản lý khách hàng</a>
                </li>
                <c:if test="${not empty user && user.trangThai}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Quản
                            lý hóa đơn</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Quản lý hóa đơn</a></li>
                            <li><a class="dropdown-item" href="#">Hóa đơn chi tiết</a></li>
                        </ul>
                    </li>
                </c:if>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Quản lý
                        sản phẩm</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/asm/sp/hien-thi">Quản lý sản phẩm</a></li>
                        <li><a class="dropdown-item" href="#">Sản phẩm chi tiết</a></li>
                        <li><a class="dropdown-item" href="/asm/tt/hien-thi-mausac">Màu sắc</a></li>
                        <li><a class="dropdown-item" href="/asm/tt/hien-thi-kichthuoc">Kích thước</a></li>
                    </ul>
                </li>
                <c:if test="${not empty user && user.trangThai}">
                    <li class="nav-item">
                        <a class="nav-link" href="/asm/nv/hien-thi">Quản lý nhân viên</a>
                    </li>
                </c:if>
            </ul>
            <form class="d-flex input-group w-auto" action="/asm/admin/search" method="get">
                <input type="search" name="keyword" class="form-control" placeholder="Type query" aria-label="Search"/>
                <button class="btn btn-outline-primary" type="submit">
                    <i class="fas fa-search"></i> Search
                </button>
            </form>
            <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownUser" role="button"
                       data-bs-toggle="dropdown"
                       aria-expanded="false">
                        <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(2).jpg"
                             class="rounded-circle img-fluid"
                             height='25' width='25'>
                        ${user.tenNV}
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end p-1" aria-labelledby="navbarDropdownUser">
                        <li><a class="dropdown-item" href="#">Your Account</a></li>
                        <li><a class="dropdown-item" href="#">Help</a></li>
                        <li><a class="dropdown-item" href="/asm/logout">Log Out</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5 pt-5">
    <h1>Chào mừng bạn đến với trang quản trị!</h1>
    <p>Đây là trang quản trị của hệ thống. Bạn có thể quản lý khách hàng, nhân viên, sản phẩm và hóa đơn từ đây.</p>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
