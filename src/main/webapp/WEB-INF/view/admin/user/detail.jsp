<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Table User</title>

                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script>
                    function confirmDelete(userId) {
                        // Hiển thị thông báo xác nhận
                        if (confirm("Are you sure you want to delete this user?")) {
                            // Nếu người dùng chọn OK, gửi yêu cầu xóa
                            document.getElementById("deleteForm" + userId).submit(); // Gửi form DELETE
                        }
                    }
                </script>
            </head>

            <body>
                <%@ include file="/WEB-INF/view/admin/layout/header.jsp" %>
                    <%@ include file="/WEB-INF/view/admin/layout/silebar.jsp" %>
                        <div class="container mt-5" style="margin-left: 200px; padding: 0 100px 0;">
                            <div class="d-flex justify-content-between mb-3">
                                <h2>Table User</h2>
                                <!-- Nút Create User -->
                                <a href="/admin/user/create" class="btn btn-success">Create User</a>
                            </div>

                            <!-- Bảng người dùng -->
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Email</th>
                                        <th>Full Name</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Lặp qua danh sách người dùng -->
                                    <c:forEach var="user" items="${users}">
                                        <tr>
                                            <td>${user.id}</td>
                                            <td>${user.email}</td>
                                            <td>${user.fullName}</td>
                                            <td>
                                                <!-- Các thẻ a cho View, Update, Delete -->
                                                <a href="/admin/user/${user.id}" class="btn btn-info btn-sm">View</a>
                                                <a href="/admin/user/update/${user.id}"
                                                    class="btn btn-warning btn-sm">Update</a>

                                                <!-- Form ẩn để gửi yêu cầu DELETE -->
                                                <form id="deleteForm${user.id}" action="/admin/user/delete/${user.id}"
                                                    method="POST" style="display: none;">
                                                    <input type="hidden" name="_method" value="DELETE">
                                                    <!-- Thêm trường ẩn cho phương thức DELETE -->
                                                </form>

                                                <button type="button" class="btn btn-danger btn-sm"
                                                    onclick="confirmDelete('${user.id}')">Delete</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
            </body>

            </html>