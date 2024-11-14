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
</head>
<body>
<form action="/buoi4/search" method="get">
    ID sinh vien: <input type="text" name="id"> <br>
    <button>Tim sinh vien</button>
</form>
<button>
    <a href="/buoi4/add">Them sinh vien</a>
</button>
<h2>Danh Sach</h2>
<table border="1">
    <thead>
    <tr>
        <th>Id</th>
        <th>Ten</th>
        <th>Tuoi</th>
        <th>Dia chi</th>
        <th>Gioi tinh</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${danhSach}" var="sinhVien">
        <tr>
            <th>${sinhVien.id}</th>
            <th>${sinhVien.ten}</th>
            <th>${sinhVien.tuoi}</th>
            <th>${sinhVien.diaChi}</th>
            <th>${sinhVien.gioiTinh ? "Nam" : "Nữ"}</th>
            <th>
                <a href="/buoi4/delete?id=${sinhVien.id}">Xoa</a>
                <a href="/buoi4/detail?id=${sinhVien.id}">Update</a>
            </th>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>