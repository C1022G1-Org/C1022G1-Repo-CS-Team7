<%--
  Created by IntelliJ IDEA.
  User: K7
  Date: 2/18/2023
  Time: 2:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Thêm mới sách</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h1 class="text-center">Thêm mới sách</h1>
    <form method="post">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" name="name" id="name" class="form-control" >
        </div>
        <div class="form-group">
            <label for="pageSize">Page</label>
            <input type="text" name="pageSize" id="pageSize" class="form-control" >
        </div>
        <div class="form-group">
            <label for="cost">Cost</label>
            <input type="text" name="cost" id="cost" class="form-control" >
        </div>
        <div class="form-group">
            <label for="author">Author</label>
            <input type="text" name="author" id="author" class="form-control" >
        </div>
        <div class="form-group">
            <label for="category">Category</label>
            <input type="text" name="category" id="category" class="form-control" >
        </div>
        <div class="form-group">
            <button type="submit">Save</button>
            <button type="button"><a href="/books">Cancel</a></button>
        </div>
    </form>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>