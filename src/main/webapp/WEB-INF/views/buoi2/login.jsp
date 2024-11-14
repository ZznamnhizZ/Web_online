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
${error}
<form action="/buoi2/login" method="post">
    <p>Username <input type="text" name="username"></p>
    <p>Password <input type="password" name="password"></p>
    <p><input type="checkbox" name="remember">Remember me?</p>

    <button type="submit">Login</button>
</form>
</body>
</html>