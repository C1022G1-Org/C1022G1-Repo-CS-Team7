<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <style>
        body, html {
            margin:0;
            padding:0;
        }

        .image-book-new {
            height: 310px;
            margin: 0 20%
        }

        .form-header {
            background-color: #ecf4f4;
            color: coral;
            width: 100%;
            gap: 5%;
            display: flex;
        }

        .cancel {
            text-decoration: none;
            color: #ffffff;
        }
    </style>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid row" style="background-color: #ecf4f4; margin: 0 auto;">
    <div class="col-md-2">
        <img src="/image/Thiết%20kế%20chưa%20có%20tên.png" style="height: 100px; width: 300px">
    </div>
    <div class="col-md-8">
        <a href="https://furamavietnam.com/vi/" style=" text-decoration: none;font-family: 'Algerian';
        font-size: 300%;font-weight: bold;color: coral;margin-left: 200px">
            Thư Viện Nhóm 7</a>
    </div>
    <div class="col-md-1 container-fluid ">
        <c:if test="${sessionUser!=null}">
            <span class="text-info col-md-6 $green-700 fw-bold">${sessionUser.name}</span>
            <a class="text-info col-md-6 fw-bold" href="/logout" style="text-decoration: none;">logout</a>
        </c:if>
        <c:if test="${sessionUser==null}">
            <a class="text-info col-md-6 fw-bold" href="/login" style="text-decoration: none;">login</a>
        </c:if>
    </div>
</div>
<div class="form-header">
    <a class="navbar-brand text-warning ps-5 click col-l-2" href="/view/landing/home.jsp">Trang Chủ</a>
    <a class="navbar-brand text-warning click col-l-2" href="/books">Các Loại Sách</a>
    <a class="navbar-brand text-warning click col-l-2" href="">Các Sách Đã Mượn</a>
    <a class="navbar-brand text-warning click col-l-2" href="">Blog</a>
    <a class="navbar-brand text-warning click col-l-2" href="">Thông Tin Liên Hệ</a>
    <form class="d-flex m-0 col-l-2">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-warning" style="background-color: coral" type="submit">Search</button>
    </form>
</div>
<div class="container">
    <h1 class="text-center col-8 mt-4">Thêm mới sách</h1>
    <div class="d-flex">
        <div class="col-8">
            <form method="post" action="/books?action=create">
                <div class="form-group fw-bolder ">
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name" class="form-control" required>
                </div>
                <div class="form-group fw-bolder">
                    <label for="pageSize">Page</label>
                    <input type="text" name="pageSize" id="pageSize" class="form-control" required>
                </div>
                <div class="form-group fw-bolder">
                    <label for="cost">Cost</label>
                    <input type="text" name="cost" id="cost" class="form-control" required>
                </div>
                <div class="form-group fw-bolder">
                    <label for="author">Author</label>
                    <input type="text" name="author" id="author" class="form-control" required>
                </div>

                <div class="form-group fw-bolder">
                    <label>Category</label>
                    <select name="category" class="form-select" aria-label="Vui lòng chọn thể loại sách">
                        <option selected>Vui lòng chọn thể loại sách</option>
                        <c:forEach items="${categoryList}" var="category">
                            <option value="${category.getId()}">${category.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <br>
                <div class="form-group mt-3">
                    <button type="submit" class="btn btn-primary col-3">Save</button>
                    <button type="button" class="btn btn-secondary col-3"><a class="cancel" href="/books">Cancel</a></button>
                </div>
            </form>
        </div>

        <div class="col-4">
            <img class="image-book-new" src="https://img.freepik.com/free-vector/abstract-elegant-winter-book-cover_23-2148798745.jpg?w=740&t=st=1676908173~exp=1676908773~hmac=86569da12aa2d5d8e2ed186d52cb80ba32b7dc5697dd251559d61a404fc60fb7">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>