<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: K7
  Date: 2/18/2023
  Time: 1:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Danh sách </title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body style="background-image: url(https://file.vfo.vn/hinh/2016/08/hinh-anh-dep-ve-quyen-sach-2.jpg)">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Thư Viện</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Category</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Option
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Literary</a>
                    <a class="dropdown-item" href="#">Author</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Review</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
            </li>
        </ul>

        <form class="form-inline my-2 my-lg-0" action="/books?action=search" method="post">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" id="name"
                   name="name">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <center>
            <h1 class="font-text-footer" style="font-style: initial; color: darkorange">Book List</h1>
            <c:if test="${mess !=null}">
                <h2 class="text-danger">${mess}</h2>
            </c:if>
        </center>
        <br>
        <table id="tableBook" class="table table-hover" >
    <thead>
    <tr>
        <td style="color: red">ID</td>
        <td style="color: red">Name</td>
        <td style="color: red">Page</td>
        <td style="color: red">Author</td>
        <td style="color: red">Cost</td>
        <td style="color: red">Category</td>
    </tr>
    </thead>
    <c:forEach var="book" items="${booksList}">
        <tr>
            <td style="color: white">${book.id}</td>
            <td style="color: white">${book.name}</td>
            <td style="color: white">${book.pageSize}</td>
            <td style="color: white">${book.author}</td>
            <td style="color: white">${book.cost}</td>
            <td style="color: white">${book.category}</td>
            <td>
                <div>   <%--            Thêm href để chỉnh sửa     --%>
                <a href="/books?action=edit&id=${book.id}">
                    <button class="btn btn-primary" style="background: red">Edit</button>
                </a>
                </div>
            </td>
            <td>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelId"
                        onclick="infoDelete('${book.getId()}','${book.getName()}')">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- Modal -->
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/books?action=delete" method="post">
                <div class="modal-body">
                    <label for="deleteId"></label>
                    <input type="text" hidden id="deleteId" name="deleteId">

                    Bạn có muốn xóa sách <span id="deleteName"
                                               style="color: brown; font-weight: bold"></span>
                    không ?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-primary">Có,Hãy Xoá</button>
                </div>
            </form>
        </div>

    </div>
</div>
</div>


<table>
    <%--    Thêm href để chuyển hướng qua showCreateForm--%>
    <h3><a href="/books?action=create">Thêm mới sách</a></h3>
</table>

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
<script>
    function $(document) {
        
    }

    $(document).ready(function () {
        $('#tableBooks').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 6
        });
    });
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
</div>
</body>
</html>