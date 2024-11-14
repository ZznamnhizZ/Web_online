<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<form action="/buoi11/san-pham/sua" method="post">
    <input type="hidden" name="id" value="${sanPham.id}">
    Ten: <input type="text" name="ten" value="${sanPham.ten}"> <br>
    Gia: <input type="text" name="gia" value="${sanPham.gia}"> <br>
    NgayTao: <input type="date" name="ngayTao" value="${sanPham.ngayTao}"> <br>
    Danh Muc:
    <select name="danhMuc">
        <c:forEach items="${listDanhMuc}" var="danhMuc">
            <option value="${danhMuc.id}"
                    label="${danhMuc.ten}" ${sanPham.danhMuc.id == danhMuc.id ? "selected" : ""}></option>
        </c:forEach>
    </select> <br>
    <button type="submit">Update</button>
</form>
</body>
</html>