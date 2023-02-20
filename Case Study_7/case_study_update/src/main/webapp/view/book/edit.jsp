<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous">
</head>
<body>
<div class="row">
  <div class="col-md-10 container">
    <center>
      <h1 class="font-text-footer">Edit Books</h1>
      <c:if test="${mess !=null}">
        <h2 class="text-danger">${mess}</h2>
      </c:if>
      <br>
      <div class="container">
        <form action="/books?action=edit" method="post">
          <input type="hidden"name="id" value="${book.id}">
          <div class="input-group mb-3">
            <span class="input-group-text">name</span>
            <input name="title" type="text" class="form-control me-2" value="${book.name}">
          </div>

          <div class="input-group mb-3">
            <span class="input-group-text">Page Size</span>
            <input name="page_size" type="text" class="form-control me-2"
                   value="${book.pageSize}">
          </div>

          <div class="input-group mb-3">
            <span class="input-group-text">author</span>
            <input name="author" type="text" class="form-control me-2"
                   value="${book.author}">
          </div>

          <div class="input-group mb-3">
            <span class="input-group-text">Category</span>
            <input name="category" type="text" class="form-control me-2"
                   value="${book.category}">
          </div>
          <br>
          <button type="submit" class="btn btn-primary">Edit</button>
        </form>
      </div>
    </center>
  </div>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
</html>