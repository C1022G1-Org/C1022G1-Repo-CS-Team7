<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2/15/2023
  Time: 2:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid row" style="background-color: #ecf4f4; margin: 0 auto;">
    <div class="col-md-3">
        <img src="/image/Thiết%20kế%20chưa%20có%20tên.png" style="height: 100px; width: 300px">
    </div>
    <div class="col-md-8">
        <a href="https://furamavietnam.com/vi/" style=" text-decoration: none;font-family: 'Algerian';
        font-size: 300%;font-weight: bold;color: coral;margin-left: 200px">
            Thư Viện Nhóm 7</a>
    </div>
    <div class="col-md-1 container-fluid " >
        <c:if test="${sessionUser!=null}">
            <span class="text-info col-md-6 $green-700 fw-bold">${sessionUser.name}</span>
            <a class="text-info col-md-6 fw-bold" href="/logout" style="text-decoration: none;">logout</a>
        </c:if>
        <c:if test="${sessionUser==null}">
            <a class="text-info col-md-6 fw-bold" href="/login" style="text-decoration: none;">login</a>
        </c:if>
    </div>

</div>
<div class="mt-2 sticky row" style="background: #ecf4f4;margin-top: -0.5rem!important;">
    <nav class="navbar navbar-light">
        <div class="container-fluid" style="color: coral">
            <a class="navbar-brand text-warning ps-5 click col-l-2" href="/view/landing/home.jsp" >Trang Chủ</a>
            <a class="navbar-brand text-warning click col-l-2" href="/view/book/list.jsp" >Các Loại Sách</a>
            <a class="navbar-brand text-warning click col-l-2" href="">Các Sách Đã Mượn</a>
            <a class="navbar-brand text-warning click col-l-2" href="" >Blog</a>
            <a class="navbar-brand text-warning click col-l-2" href="">Thông Tin Liên Hệ</a>
            <form class="d-flex m-0 col-l-2">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-warning" style="background-color: coral" type="submit">Search</button>
            </form>
        </div>
    </nav>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</html>
