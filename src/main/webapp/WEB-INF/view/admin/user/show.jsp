<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>View User</title>

                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </head>

            <body>
                <%@ include file="/WEB-INF/view/admin/layout/header.jsp" %>
                    <%@ include file="/WEB-INF/view/admin/layout/silebar.jsp" %>
                        <div class="container mt-5" style="margin-left: 200px; padding: 0 100px 0;">
                            <h2>View User Details</h2>

                            <!-- Hiển thị thông tin người dùng -->
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">User Information</h5>
                                    <table class="table table-striped">
                                        <tr>
                                            <th>ID</th>
                                            <td>${user.id}</td>
                                        </tr>
                                        <tr>
                                            <th>Email</th>
                                            <td>${user.email}</td>
                                        </tr>
                                        <tr>
                                            <th>Full Name</th>
                                            <td>${user.fullName}</td>
                                        </tr>
                                        <tr>
                                            <th>Address</th>
                                            <td>${user.address}</td>
                                        </tr>
                                        <tr>
                                            <th>Phone</th>
                                            <td>${user.phone}</td>
                                        </tr>
                                    </table>
                                    <a href="/admin/user" class="btn btn-primary">Back to User List</a>
                                </div>
                            </div>
                        </div>
            </body>

            </html>