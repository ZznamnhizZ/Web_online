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
Id: <input type="text" name="id" value="${ns.id}"> <br>
Ten: <input type="text" name="ten" value="${ns.ten}"> <br>
Luong: <input type="text" name="luong" value="${ns.luong}"><br>
Gioi tinh: <input type="radio" name="gioiTinh" value="true" ${ns.gioiTinh ? "checked" : ""}> Nam
<input type="radio" name="gioiTinh" value="false" ${!ns.gioiTinh ? "checked" : ""}> Nữ <br>
</body>
</html>