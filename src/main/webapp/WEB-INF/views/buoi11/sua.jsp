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
<h2>Sua thong tin</h2>
<form action="/buoi11/sua" method="post">
    ID: <input type="text" name="id" value="${danhMuc.id}"> <br>
    ID: <input type="text" name="ten" value="${danhMuc.ten}"> <br>
    <button>Update</button>
</form>
</body>
</html>