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
<a href="/buoi6/add">ADD</a>
<h2>Tim kiem</h2>
<form action="/buoi6/search" method="get">
    ID: <input type="text" name="id"> <br>
    <button>Submit</button>
</form>
<form action="/buoi6/hien-thi" method="get">
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Ten</th>
            <th>Luong</th>
            <th>Gioi tinh</th>
        </tr>
        <c:forEach items="${danhSach}" var="ns">
            <tr>
                <td>${ns.id}</td>
                <td>${ns.ten}</td>
                <td>${ns.luong}</td>
                <td>${ns.gioiTinh ? "Nam" : "Nữ"}</td>
                <td><a href="/buoi6/delete?id=${ns.id}">Delete</a></td>
                <td><a href="/buoi6/update?id=${ns.id}">Update</a></td>
            </tr>
        </c:forEach>

    </table>
</form>
</body>
</html>