<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 2/17/2023
  Time: 10:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="template/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="template/datatable/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="template/style.css">
</head>
<body>
<div class="row">
    <div class="col-md-10 container">
        <center>
            <h1 class="font-text-footer">Create User</h1>
            <c:if test="${mess !=null}">
                <h2 class="text-danger">${mess}</h2>
            </c:if>
            <br>
            <div class="container">
                <form name="formCreate" action="/login?action=create" method="post"
                      onsubmit="return validateForm()">
                    <div class="input-group mb-3">
                        <span class="input-group-text">Name</span>
                        <input name="name" type="text" class="form-control me-2" placeholder="name"
                               value="${name}">

                    </div>
                    <%-- Thông báo không nhập input--%>
                    <div class="input-group mb-5">
                                <span class="me-2 text-danger " style="left: 5px; position: absolute; font-weight: bold"
                                      id="TitleNotInput"></span>
                        <span class="me-2 text-danger" id="genderNotInput"
                              style="right: 5px; position: absolute; font-weight: bold"></span>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">Username</span>
                        <input name="username" value="${username}" type="text" class="form-control me-2"
                               placeholder="username">

                        <%-- sau khi tạo thất bại--%>
                        </select>
                    </div>



                    <div class="input-group mb-3">
                        <span class="input-group-text">Password</span>
                        <input name="password" value="${password}" type="text" class="form-control me-2"
                               placeholder="password">
                    </div>



                    <div class="dropdown mb-3">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            Role
                        </button>
                        <ul class="role" aria-labelledby="dropdownMenuButton1">
                            <li><a class="Admin" href="">1.Admin</a></li>
                            <li><a class="User" href=" ">2.User</a></li>
                        </ul>
                    </div>

                    <br>
                    <div class="input-group mb-5 d-flex align-content-center justify-content-center">
                        <button type="submit" class="btn btn-primary">Create</button>
                        <button type="button" class="btn btn-primary ms-3"><a style="text-decoration: none"
                                                                              class="text-light"
                                                                              href="/login">Huỷ</a></button>
                    </div>
                </form>
            </div>
        </center>
    </div>
</div>

<%--+++++footer+++++++--%>
</body>
<script src="template/bootstrap/jquery-3.6.0.min.js"></script>
<script src="template/bootstrap/js/bootstrap.js"></script>
<script src="template/datatable/js/jquery.dataTables.min.js"></script>
<script src="template/datatable/js/dataTables.bootstrap4.min.js"></script>
<script src="template/main.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 6
        });
    });

    function showInfo(id, name) {
        document.getElementById("idCustomer").value = id;
        document.getElementById("nameCustomer").innerText = name;
    }
</script>
</html>
