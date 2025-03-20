<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>View Product</title>

                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </head>

            <body>
                <%@ include file="/WEB-INF/view/admin/layout/header.jsp" %>
                    <%@ include file="/WEB-INF/view/admin/layout/silebar.jsp" %>
                        <div class="container mt-5" style="margin-left: 200px; padding: 0 100px 0;">
                            <h2>View Product Details</h2>

                            <!-- Hiển thị thông tin sản phẩm -->
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Product Information</h5>
                                    <table class="table table-striped">
                                        <tr>
                                            <th>ID</th>
                                            <td>${product.id}</td>
                                        </tr>
                                        <tr>
                                            <th>Name</th>
                                            <td>${product.name}</td>
                                        </tr>
                                        <tr>
                                            <th>Price</th>
                                            <td>${product.price}</td>
                                        </tr>
                                        <tr>
                                            <th>Factory</th>
                                            <td>${product.factory}</td>
                                        </tr>
                                    </table>

                                    <!-- Action Buttons (Edit, Delete, etc.) -->
                                    <a href="/admin/product/edit/${product.id}" class="btn btn-warning">Edit</a>
                                    <a href="/admin/product/delete/${product.id}" class="btn btn-danger"
                                        onclick="return confirm('Are you sure you want to delete this product?')">Delete</a>
                                    <a href="/admin/product" class="btn btn-primary">Back to Product List</a>
                                </div>
                            </div>
                        </div>
            </body>

            </html>