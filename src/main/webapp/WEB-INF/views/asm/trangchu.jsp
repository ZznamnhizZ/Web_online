<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
<div class="container-fluid">
    <header class="row">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQSPdNBcSevnsodK2K80ICySD_-IgSYW64ifbOBs4Fak54RzQk_"
                             alt="" style="width: 100px; height:100px;">

                        <li class="nav-item" style="padding-left: 15px; font-size: large; padding-top: 30px;">
                            <a class="nav-link active" aria-current="page" href="#">Trang chủ</a>
                        </li>
                        <li class="nav-item" style="padding-left: 15px; font-size: large; padding-top: 30px;">
                            <a class="nav-link active" aria-current="page" href="#">Giới thiệu</a>
                        </li>
                        <li class="nav-item dropdown"
                            style="padding-left: 15px; font-size: large; padding-top: 30px;">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown"
                               aria-expanded="false" style="color: black;">
                                Sản phẩm
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Áo</a></li>
                                <li><a class="dropdown-item" href="#">Áo khoác</a></li>
                                <li><a class="dropdown-item" href="#">Áo len</a></li>
                                <hr class="dropdown-divider">
                                <li><a class="dropdown-item" href="#">Quần</a></li>
                                <li><a class="dropdown-item" href="#">Quần jean</a></li>
                                <li><a class="dropdown-item" href="#">Quần tây</a></li>
                                <li><a class="dropdown-item" href="#">Quần thể thao</a></li>
                                <li><a class="dropdown-item" href="#">Quần đùi</a></li>
                                <hr class="dropdown-divider">
                                <li><a class="dropdown-item" href="#">Phụ kiện</a></li>
                                <li><a class="dropdown-item" href="#">Mũ</a></li>
                                <li><a class="dropdown-item" href="#">Túi xách</a></li>
                                <li><a class="dropdown-item" href="#">Đồng hồ</a></li>
                            </ul>
                        </li>
                        <li class="nav-item" style="padding-left: 15px; font-size: large; padding-top: 30px;">
                            <a class="nav-link active" aria-current="page" href="#">Tin tức</a>
                        </li>
                        <li class="nav-item" style="padding-left: 15px; font-size: large; padding-top: 30px;">
                            <a class="nav-link active" aria-current="page" href="#">Liên hệ</a>
                        </li>
                    </ul>
                    <form class="d-flex" role="search">
                        <input class="form-control me-md-2" type="search" placeholder="Nhập sản phẩm ở đây"
                               aria-label="Search">
                        <button class="btn btn-outline-success" type="submit"
                                style="margin-right: 30px;">Search
                        </button>
                        <a href="/asm/login" class="btn btn-primary" style="text-decoration: none;">
                            <i class="fa-solid fa-user fa-2x"></i>
                        </a>
                    </form>
                </div>
            </div>
        </nav>
    </header>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</html>