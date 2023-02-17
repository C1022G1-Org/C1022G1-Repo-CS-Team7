<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2/17/2023
  Time: 9:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Library</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<h1>Library</h1>
<p>
 <a href="/book-servlet?action=create">Create new Book</a>
</p>
<form class="d-flex">
    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="name" name="name">
    <button class="btn btn-outline-success" type="submit">Search</button>
</form>
<table>
    <tr>
        <td>Tittle</td>
        <td>PageSize</td>
        <td>Author</td>
        <td>Category</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items="${bookList}" var="book">
        <tr>
            <td>${book.getTitle()}</td>
            <td>${book.getPageSize()}</td>
            <td>${book.getAuthor()}</td>
            <td>${book.getCost()}</td>
            <td>${book.getCategory()}</td>
            <td> <a href="/book-servlet?action=delete&id"${book.getId()}>Delete</a> </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
