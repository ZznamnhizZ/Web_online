<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
${message}
<body class="container-md">
<div class="d-flex justify-content-center">
    <form:form action="/buoi8/staff" method="post" modelAttribute="staff" class="form-horizontal">
        <div class="form-group">
            <label for="id" class="col-sm-2 control-label">ID</label>
            <div class="col-sm-12">
                <form:input path="id" class="form-control" id="id"/>
                <form:errors path="id" class="text-danger"/>
            </div>
        </div>

        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">NAME</label>
            <div class="col-sm-12">
                <form:input path="name" class="form-control" id="name"/>
                <form:errors path="name" class="text-danger"/>
            </div>
        </div>

        <div class="form-group">
            <label for="age" class="col-sm-2 control-label">TUOI</label>
            <div class="col-sm-12">
                <form:input path="age" class="form-control" id="age"/>
                <form:errors path="age" class="text-danger"/>
            </div>
        </div>

        <div class="form-group">
            <label for="position" class="col-sm-2 control-label">VITRI</label>
            <div class="col-sm-12">
                <form:radiobuttons path="position" items="${positions}" class="form-check-input" delimiter=" "/>
                <form:errors path="position" class="text-danger"/>
            </div>
        </div>

        <div class="form-group">
            <label for="hobbies" class="col-sm-2 control-label">SOTHICH</label>
            <div class="col-sm-12">
                <form:checkboxes path="hobbies" items="${hobbies}" class="form-check-input"/>
                <form:errors path="hobbies" class="text-danger"/>
            </div>
        </div>

        <div class="form-group">
            <label for="country" class="col-sm-2 control-label">QuocGia</label>
            <div class="col-sm-12">
                <form:select path="country.id" cssClass="form-control" id="country">
                    <option disabled hidden selected>Vui long chon</option>
                    <form:options items="${nationalities}" itemValue="id" itemLabel="name"/>
                </form:select>
                <form:errors path="country" class="text-danger"/> <br>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-12">
                <button class="btn btn-primary">Save</button>
            </div>
        </div>
    </form:form>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</html>