<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2/17/2023
  Time: 2:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h1>Login</h1>
<form action="/login" method="post">
    Username: <input type="text" name="username"/><BR>
    Password: <input type="text" name = "password"/> <br>
    <input type="submit" value="Login" />
</form>
</body>
</html>
