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
<form action="/bh/process-payment" method="post">
    <input type="hidden" name="hoaDonId" value="${hoaDonId}"/>
    <input type="hidden" name="maNV" value="${maNV}"/>
    <input type="hidden" name="tenKH" value="${tenKH}"/>

    <label>Tiền khách đưa:</label>
    <input type="number" name="tienKhachDua" required/>

    <button type="submit">Tính Tiền</button>
</form>

<c:if test="${not empty success}">
    <div>${success}</div>
</c:if>
<c:if test="${not empty error}">
    <div>${error}</div>
</c:if>
<c:if test="${not empty tienThua}">
    <div>Số tiền thừa: ${tienThua}</div>
</c:if>

</body>
</html>