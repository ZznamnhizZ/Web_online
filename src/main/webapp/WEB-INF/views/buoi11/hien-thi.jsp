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
<a href="/buoi11/them">Them</a>
<h2>Bang thong tin</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Ten</th>
        <th colspan="2">Action</th>
    </tr>
    <c:forEach items="${danhSach}" var="danhMuc">
        <tr>
            <td>${danhMuc.id}</td>
            <td>${danhMuc.ten}</td>
            <td>
                <a href="/buoi11/sua?id=${danhMuc.id}">Sua</a>
                <a href="/buoi11/xoa?id=${danhMuc.id}">Xoa</a>
                <a href="/buoi11/chi-tiet?id=${danhMuc.id}">Chi tiet</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>