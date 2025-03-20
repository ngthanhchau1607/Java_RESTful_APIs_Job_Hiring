<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Table Product</title>

                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script>
                    function confirmDelete(productId) {
                        // Hiển thị thông báo xác nhận
                        if (confirm("Are you sure you want to delete this product?")) {
                            // Nếu người dùng chọn OK, gửi yêu cầu xóa
                            document.getElementById("deleteForm" + productId).submit(); // Gửi form DELETE
                        }
                    }
                </script>
            </head>

            <body>
                <%@ include file="/WEB-INF/view/admin/layout/header.jsp" %>
                    <%@ include file="/WEB-INF/view/admin/layout/silebar.jsp" %>
                        <div class="container mt-5" style="margin-left: 200px; padding: 0 100px 0;">
                            <div class="d-flex justify-content-between mb-3">
                                <h2>Table Product</h2>
                                <!-- Nút Create Product -->
                                <a href="/admin/product/create" class="btn btn-success">Create Product</a>
                            </div>

                            <!-- Bảng sản phẩm -->
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Factory</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Lặp qua danh sách sản phẩm -->
                                    <c:forEach var="product" items="${products}">
                                        <tr>
                                            <td>${product.id}</td>
                                            <td>${product.name}</td>
                                            <td>${product.price}</td>
                                            <td>${product.factory}</td>
                                            <td>
                                                <!-- Các thẻ a cho View, Update, Delete -->
                                                <a href="/admin/product/${product.id}"
                                                    class="btn btn-info btn-sm">View</a>
                                                <a href="/admin/product/update/${product.id}"
                                                    class="btn btn-warning btn-sm">Update</a>

                                                <!-- Form ẩn để gửi yêu cầu DELETE -->
                                                <form id="deleteForm${product.id}"
                                                    action="/admin/product/delete/${product.id}" method="POST"
                                                    style="display: none;">
                                                    <input type="hidden" name="_method" value="DELETE">
                                                    <!-- Thêm trường ẩn cho phương thức DELETE -->
                                                </form>

                                                <button type="button" class="btn btn-danger btn-sm"
                                                    onclick="confirmDelete('${product.id}')">Delete</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
            </body>

            </html>