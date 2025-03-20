<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Create User</title>

            <!-- Latest compiled and minified CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

            <style>
                .is-invalid {
                    border-color: #dc3545;
                }

                .invalid-feedback {
                    color: #dc3545;
                    font-size: 0.875em;
                }
            </style>
        </head>

        <body>
            <%@ include file="/WEB-INF/view/admin/layout/header.jsp" %>
                <%@ include file="/WEB-INF/view/admin/layout/silebar.jsp" %>

                    <div class="container mt-5" style="margin-left: 200px; padding: 0 100px 0;">
                        <h2>Create User</h2>

                        <!-- Sử dụng form:form để kết nối với Spring MVC Model -->
                        <form:form action="/admin/user/create" method="POST" modelAttribute="newUser"
                            enctype="multipart/form-data">
                            <div class="row">
                                <!-- Email và Password chung một dòng -->
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <form:input type="email" class="form-control" id="email" path="email" />
                                        <form:errors path="email" cssClass="invalid-feedback" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="password" class="form-label">Password</label>
                                        <form:input type="password" class="form-control" id="password"
                                            path="password" />
                                        <form:errors path="password" cssClass="invalid-feedback" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <!-- Full Name và Phone chung một dòng -->
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="fullName" class="form-label">Full Name</label>
                                        <form:input type="text" class="form-control" id="fullName" path="fullName" />
                                        <form:errors path="fullName" cssClass="invalid-feedback" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="phone" class="form-label">Phone</label>
                                        <form:input type="text" class="form-control" id="phone" path="phone" />
                                        <form:errors path="phone" cssClass="invalid-feedback" />
                                    </div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <!-- Address ở 1 dòng riêng -->
                                <label for="address" class="form-label">Address</label>
                                <form:input type="text" class="form-control" id="address" path="address" />
                                <form:errors path="address" cssClass="invalid-feedback" />
                            </div>

                            <div class="row">
                                <!-- Thẻ select ánh xạ Spring -->
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="role" class="form-label">Role</label>
                                        <form:select id="role" class="form-select" path="role.name">
                                            <form:option value="Admin" label="Admin" />
                                            <form:option value="User" label="User" />
                                        </form:select>
                                        <form:errors path="role.name" cssClass="invalid-feedback" />
                                    </div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <!-- Nút tải ảnh lên -->
                                <label for="imageUpload" class="form-label">Upload Image</label>
                                <input type="file" class="form-control" id="imageUpload" name="imageUpload" />
                            </div>

                            <!-- Phần Preview ảnh -->
                            <div class="mb-3">
                                <label class="form-label">Image Preview:</label>
                                <img id="previewImage" src="" alt="Image Preview" class="img-fluid"
                                    style="display:none; max-width: 200px;" />
                            </div>

                            <!-- Nút tạo người dùng -->
                            <button type="submit" class="btn btn-primary">Create User</button>
                        </form:form>
                    </div>

                    <script>
                        // jQuery code to preview the image before uploading
                        $("#imageUpload").change(function (e) {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                // Show the preview image
                                $("#previewImage").attr("src", e.target.result).show();
                            };
                            reader.readAsDataURL(this.files[0]);
                        });
                    </script>
        </body>

        </html>