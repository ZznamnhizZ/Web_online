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
<form action="/buoi6/add" method="post">
    <p>Id <input type="text" name="id"></p>
    <p>Ten <input type="text" name="ten"></p>
    <p>Luong <input type="text" name="luong"></p>
    <p>GioiTinh
        <input type="radio" name="gioiTinh" value="true">Nam
        <input type="radio" name="gioiTinh" value="false">Nu
    </p>
    <button type="submit">Add</button>
</form>
</body>
</html>