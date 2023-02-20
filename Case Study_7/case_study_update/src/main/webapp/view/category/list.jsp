<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2/20/2023
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="table">
    <tr>
        <td>Name</td>
    </tr>
    <c:forEach items="${categoryList}" var="category">
        <tr>
            <td>${category.getName()}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
