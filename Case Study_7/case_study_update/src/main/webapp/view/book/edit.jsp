<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        body, html {
            margin:0;
            padding:0;
        }

        .image-book {
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
    </style>
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
            <form method="post" action="/books?action=edit">
                <input type="hidden" name="id" value="${books.id}">

                <div class="form-group fw-bolder">
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name" class="form-control" required value="${books.name}">
                </div>

                <div class="form-group fw-bolder">
                    <label for="page_size">Page Size</label>
                    <input type="text" name="page_size" id="page_size" class="form-control" required
                           value="${books.pageSize}">
                </div>

                <div class="form-group fw-bolder">
                    <label for="author">Author</label>
                    <input type="text" name="author" id="author" class="form-control" required
                           value="${books.author}">
                </div>

                <div class="form-group fw-bolder">
                    <label for="cost">Cost</label>
                    <input type="text" name="cost" id="cost" class="form-control" required
                           value="${books.cost}">
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
                <button type="submit" class="btn btn-primary col-3">Edit</button>
            </form>
        </div>
        <div class="col-4">
            <img class="image-book"
                 src="https://img.freepik.com/free-vector/abstract-elegant-winter-book-cover_23-2148798745.jpg?w=740&t=st=1676908173~exp=1676908773~hmac=86569da12aa2d5d8e2ed186d52cb80ba32b7dc5697dd251559d61a404fc60fb7">
        </div>
    </div>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</html>