<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>Bán Hàng</title>
</head>
<body>
<h3>Hóa Đơn</h3>

<!-- Hiển thị thông báo lỗi nếu có -->
<c:if test="${not empty error}">
    <div class="error">
            ${error}
    </div>
</c:if>

<table>
    <tr>
        <th>ID Hóa Đơn</th>
        <th>Ngày mua hàng</th>
        <th>Trạng thái</th>
        <th>Mã nhân viên</th>
        <th>Khách hàng</th>
    </tr>
    <c:forEach items="${danhSachHD}" var="hd">
        <tr>
            <td>${hd.idHoaDon}</td>
            <td>${hd.ngayMuaHang}</td>
            <td>${hd.trangThai ? "Đã thanh toán" : "Chưa thanh toán"}</td>
            <td>${hd.nhanVien.maNV}</td>
            <td>${hd.khachHang.tenKH}</td>
        </tr>
    </c:forEach>
</table>
<br>

<h3>Tạo Hóa Đơn Mới</h3>
<form action="/asm/bh/create-invoice" method="post">
    <label for="ngayMuaHang">Ngày Mua Hàng:</label>
    <input type="date" id="ngayMuaHang" name="ngayMuaHang" required><br><br>

    <label for="maNV">Mã Nhân Viên:</label>
    <select id="maNV" name="maNV" required>
        <c:forEach var="nhanVien" items="${danhSachNhanVien}">
            <option value="${nhanVien.maNV}">${nhanVien.maNV} - ${nhanVien.tenNV}</option>
        </c:forEach>
    </select><br><br>

    <label for="tenKH">Tên Khách Hàng:</label>
    <select id="tenKH" name="tenKH" required>
        <c:forEach var="khachHang" items="${danhSachKhachHang}">
            <option value="${khachHang.tenKH}">${khachHang.tenKH}</option>
        </c:forEach>
    </select><br><br>

    <button type="submit">Tạo Hóa Đơn</button>
</form>
<br>

<h2>Sản Phẩm Chi Tiết</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Mã SPCT</th>
        <th>Sản Phẩm</th>
        <th>Màu Sắc</th>
        <th>Kích Thước</th>
        <th>Số lượng</th>
        <th>Đơn giá</th>
        <th>Trạng thái</th>
        <th>Chọn Số lượng</th>
        <th>Thêm vào giỏ hàng</th>
    </tr>
    <c:forEach items="${danhSachSPCT}" var="spct">
        <tr>
            <td>${spct.id}</td>
            <td>${spct.maSPCT}</td>
            <td>${spct.sanPhamAsm.tenSanPham}</td>
            <td>${spct.mauSac.tenMauSac}</td>
            <td>${spct.kichThuoc.tenKichThuoc}</td>
            <td>${spct.soLuong}</td>
            <td>${spct.donGia}</td>
            <td>${spct.trangThai ? "Còn hàng" : "Hết hàng"}</td>
            <td>
                <input type="number" min="1" name="soLuong" id="soLuong_${spct.id}"
                       required ${spct.soLuong <= 0 ? 'disabled' : ''} />
            </td>
            <td>
                <form action="/asm/bh/add-to-cart" method="get">
                    <input type="hidden" name="idSPCT" value="${spct.id}"/>
                    <input type="number" min="1" name="soLuong" id="soLuong_${spct.id}" required
                            <c:if test="${spct.soLuong <= 0}"> disabled </c:if> />
                    <button type="submit"
                            <c:if test="${spct.soLuong <= 0}"> disabled </c:if> >Add
                    </button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<br>

<h3>Giỏ Hàng</h3>
<c:if test="${empty gioHang}">
    <p>Giỏ hàng trống.</p>
</c:if>
<c:if test="${not empty gioHang}">
    <table>
        <tr>
            <th>ID SPCT</th>
            <th>Tên Sản Phẩm</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
            <th>Thành tiền</th>
        </tr>
        <c:forEach items="${gioHang}" var="item">
            <tr>
                <td>${item.sanPhamCt.id}</td>
                <td>${item.sanPhamCt.sanPhamAsm.tenSanPham}</td>
                <td>${item.soLuong}</td>
                <td>${item.sanPhamCt.donGia}</td>
                <td>${item.thanhTien}</td>
                <td><a href="/bh/process-payment">Thanh toán </a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
