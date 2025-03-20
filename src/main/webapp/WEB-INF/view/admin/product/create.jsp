<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Create Product</title>

            <!-- Latest compiled and minified CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        </head>

        <body>
            <%@ include file="/WEB-INF/view/admin/layout/header.jsp" %>
                <%@ include file="/WEB-INF/view/admin/layout/silebar.jsp" %>

                    <div class="container mt-5" style="margin-left: 200px; padding: 0 100px 0;">
                        <h2>Create Product</h2>

                        <!-- Sử dụng form:form để kết nối với Spring MVC Model -->
                        <form:form action="/admin/product/create" method="POST" modelAttribute="newProduct"
                            enctype="multipart/form-data">
                            <div class="row">
                                <!-- Name và Price chung một dòng -->
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Product Name</label>
                                        <form:input type="text" class="form-control" id="name" path="name" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="price" class="form-label">Price</label>
                                        <form:input type="number" step="0.01" class="form-control" id="price"
                                            path="price" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <!-- Factory và Quantity chung một dòng -->
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="factory" class="form-label">Factory</label>
                                        <form:select id="factory" class="form-select" path="factory">
                                            <form:option value="Samsung" label="Samsung" />
                                            <form:option value="iPhone" label="iPhone" />
                                        </form:select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="quantity" class="form-label">Quantity</label>
                                        <form:input type="number" class="form-control" id="quantity" path="quantity" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <!-- Target và Sold chung một dòng -->
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="target" class="form-label">Target</label>
                                        <form:select id="target" class="form-select" path="target">
                                            <form:option value="Gaming" label="Gaming" />
                                            <form:option value="Văn phòng" label="Văn phòng" />
                                            <form:option value="Học tập" label="Học tập" />
                                        </form:select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="sold" class="form-label">Sold</label>
                                        <form:input type="number" class="form-control" id="sold" path="sold" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <!-- Image Upload -->
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="imageUpload" class="form-label">Upload Image</label>
                                        <input type="file" class="form-control" id="imageUpload" name="imageUpload" />
                                    </div>
                                </div>
                            </div>

                            <!-- Phần Preview ảnh -->
                            <div class="mb-3">
                                <label class="form-label">Image Preview:</label>
                                <img id="previewImage" src="" alt="Image Preview" class="img-fluid"
                                    style="display:none; max-width: 200px;" />
                            </div>

                            <!-- Nút tạo sản phẩm -->
                            <button type="submit" class="btn btn-primary">Create Product</button>
                        </form:form>
                    </div>

                    <!-- jQuery script to preview image before upload -->
                    <script>
                        $(document).ready(function () {
                            // Khi người dùng chọn file, thực hiện hiển thị ảnh preview
                            $("#imageUpload").change(function (e) {
                                var reader = new FileReader();

                                reader.onload = function (e) {
                                    // Hiển thị ảnh sau khi được tải lên
                                    $("#previewImage").attr("src", e.target.result).show(); // Hiển thị ảnh preview
                                };

                                reader.readAsDataURL(this.files[0]); // Đọc tệp hình ảnh
                            });
                        });
                    </script>

        </body>

        </html>