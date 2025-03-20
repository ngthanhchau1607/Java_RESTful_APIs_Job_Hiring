<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Update User</title>

                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </head>

            <body>
                <%@ include file="/WEB-INF/view/admin/layout/header.jsp" %>
                    <%@ include file="/WEB-INF/view/admin/layout/silebar.jsp" %>
                        <div class="container mt-5" style="margin-left: 200px; padding: 0 100px 0;">
                            <h2>Update User</h2>
                            <!-- Form cập nhật người dùng -->
                            <form:form method="POST" modelAttribute="user" action="/admin/user/update/${user.id}">

                                <!-- Trường ID ẩn -->
                                <form:input type="hidden" path="id" />

                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <form:input type="email" class="form-control" id="email" path="email"
                                        disabled="true" />
                                </div>

                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <form:input type="password" class="form-control" id="password" path="password" />
                                </div>

                                <div class="mb-3">
                                    <label for="fullName" class="form-label">Full Name</label>
                                    <form:input type="text" class="form-control" id="fullName" path="fullName" />
                                </div>

                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <form:input type="text" class="form-control" id="address" path="address" />
                                </div>

                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone</label>
                                    <form:input type="text" class="form-control" id="phone" path="phone" />
                                </div>

                                <button type="submit" class="btn btn-primary">Cập nhật</button>
                            </form:form>
                        </div>
            </body>

            </html>