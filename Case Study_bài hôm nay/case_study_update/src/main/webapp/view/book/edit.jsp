<%--
  Created by IntelliJ IDEA.
  User: K7
  Date: 2/20/2023
  Time: 9:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Chỉnh sửa thông tin sách</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<div class="row">
    <div class="col-md-10 container">
            <h1 class="font-text-footer">Edit Books</h1>
            <c:if test="${mess !=null}">
                <h2 class="text-danger">${mess}</h2>
            </c:if>
            <br>
            <div class="container">
                <form method="post">
                    <input type="hidden" name="id" value="${books.id}">
                    <div class="input-group mb-3">
                        <span class="input-group-text">Name</span>
                        <input name="name" type="text" class="form-control me-2" value="${books.name}">
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">Page Size</span>
                        <input name="pageSize" type="text" class="form-control me-2"
                               value="${books.pageSize}">
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">Cost</span>
                        <input name="cost" type="text" class="form-control me-2"
                               value="${books.cost}">
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">author</span>
                        <input name="author" type="text" class="form-control me-2"
                               value="${books.author}">
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">Category</span>
                        <input name="category" type="text" class="form-control me-2"
                               value="${books.category}">
                    </div>
                    <br>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
    </div>
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
