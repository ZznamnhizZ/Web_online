<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thêm Sinh Viên</title>
</head>
<body>
<h2>Thêm Sinh Viên Mới</h2>
<form action="/buoi4/add" method="post">
    <label for="id">ID:</label>
    <input type="text" id="id" name="id" required/><br/><br/>

    <label for="ten">Tên:</label>
    <input type="text" id="ten" name="ten" required/><br/><br/>

    <label for="tuoi">Tuổi:</label>
    <input type="text" id="tuoi" name="tuoi" required/><br/><br/>

    <label for="diaChi">Địa Chỉ:</label>
    <input type="text" id="diaChi" name="diaChi" required/><br/><br/>

    <label>Giới Tính:</label><br>
    <input type="radio" id="nam" name="gioiTinh" value="true" checked>
    <label for="nam">Nam</label><br>
    <input type="radio" id="nu" name="gioiTinh" value="false">
    <label for="nu">Nữ</label><br/><br/>


    <button type="submit">Thêm</button>
</form>

<br/>
</body>
</html>
