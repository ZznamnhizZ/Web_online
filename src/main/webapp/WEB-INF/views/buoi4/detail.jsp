<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cập Nhật Thông Tin Sinh Viên</title>
</head>
<body>
<h2>Chi Tiết Sinh Viên</h2>
<form action="/buoi4/update" method="post">
    <input type="hidden" name="id" value="${sinhVien.id}"/>

    <label for="ten">Tên:</label>
    <input type="text" id="ten" name="ten" value="${sinhVien.ten}" required/><br/><br/>

    <label for="tuoi">Tuổi:</label>
    <input type="text" id="tuoi" name="tuoi" value="${sinhVien.tuoi}" required/><br/><br/>

    <label for="diaChi">Địa Chỉ:</label>
    <input type="text" id="diaChi" name="diaChi" value="${sinhVien.diaChi}" required/><br/><br/>

    <label>Giới Tính:</label><br>
    <input type="radio" id="nam" name="gioiTinh" value="true" ${sinhVien.gioiTinh ? "checked" : ""}>
    <label for="nam">Nam</label><br>

    <input type="radio" id="nu" name="gioiTinh" value="false" ${!sinhVien.gioiTinh ? "checked" : ""}>
    <label for="nu">Nữ</label><br><br>
    <button type="submit">Update</button>
</form>
<br/>
<a href="/buoi4/hien-thi">Quay lại danh sách</a>
</body>
</html>
