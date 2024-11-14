<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Quản Lý Chi Tiết Sản Phẩm</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        /* Tùy chỉnh kích thước hình ảnh trong bảng */
        .product-image {
            width: 100px;
            height: auto;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <!-- Tiêu Đề Trang -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Danh Sách Chi Tiết Sản Phẩm</h2>
        <a href="/asm/spct/add" class="btn btn-success">
            <i class="fas fa-plus"></i> Thêm Chi Tiết Sản Phẩm
        </a>
    </div>

    <!-- Hiển thị thông tin sản phẩm nếu có -->
    <c:if test="${not empty sanPham}">
        <div class="mb-4">
            <h4>Chi Tiết Sản Phẩm: ${sanPham.tenSanPham} (Mã: ${sanPham.maSanPham})</h4>
            <p>Trạng Thái:
                <span class="badge ${sanPham.trangThai ? 'bg-success' : 'bg-secondary'}">
                        ${sanPham.trangThai ? "Hoạt Động" : "Không Hoạt Động"}
                </span>
            </p>
        </div>
    </c:if>

    <!-- Bảng Chi Tiết Sản Phẩm -->
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover align-middle">
            <thead class="table-dark">
            <tr>
                <th class="text-start">ID SPCT</th>
                <th class="text-start">Mã SPCT</th>
                <th class="text-start">Số Lượng</th>
                <th class="text-start">Đơn Giá</th>
                <th class="text-start">Màu Sắc</th>
                <th class="text-start">Kích Thước</th>
                <th class="text-start">Hình Ảnh</th>
                <th class="text-start">Trạng Thái</th>
                <th class="text-center">Hành Động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${dsSPCT}" var="spct">
                <tr>
                    <td class="text-start">${spct.id}</td>
                    <td class="text-start">${spct.maSPCT}</td>
                    <td class="text-start">${spct.soLuong}</td>
                    <td class="text-start">
                        <fmt:formatNumber value="${spct.donGia}" type="currency" currencySymbol="₫"
                                          groupingUsed="true"/>
                    </td>
                    <td class="text-start">
                        <c:choose>
                            <c:when test="${spct.mauSac != null}">
                                ${spct.mauSac.tenMauSac}
                            </c:when>
                            <c:otherwise>
                                Không xác định
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="text-start">
                        <c:choose>
                            <c:when test="${spct.kichThuoc != null}">
                                ${spct.kichThuoc.tenKichThuoc}
                            </c:when>
                            <c:otherwise>
                                Không xác định
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="text-start">
                        <c:choose>
                            <c:when test="${not empty spct.image}">
                                <img src="${spct.image}" alt="Hình ảnh SPCT" class="product-image">
                            </c:when>
                            <c:otherwise>
                                Không có hình ảnh
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="text-start">
                        <span class="badge ${spct.trangThai ? 'bg-success' : 'bg-secondary'}">
                                ${spct.trangThai ? "Hoạt Động" : "Không Hoạt Động"}
                        </span>
                    </td>
                    <td class="text-center">
                        <!-- Nút Cập Nhật -->
                        <a href="/asm/spct/update?id=${spct.id}" class="btn btn-warning btn-sm me-2">
                            <i class="fas fa-edit"></i> Cập Nhật
                        </a>
                        <!-- Nút Xóa với xác nhận -->
                        <a href="/asm/spct/delete?id=${spct.id}" class="btn btn-danger btn-sm me-2"
                           onclick="return confirm('Bạn có chắc chắn muốn xóa chi tiết sản phẩm này không?');">
                            <i class="fas fa-trash-alt"></i> Xóa
                        </a>
                    </td>
                </tr>
            </c:forEach>

            <!-- Thông báo khi không có dữ liệu -->
            <c:if test="${empty dsSPCT}">
                <tr>
                    <td colspan="10" class="text-center">Không có dữ liệu để hiển thị.</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
