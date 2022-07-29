

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<section class="vh-100 mb-5">
    <div class="container py-5 h-100">
        <div class="row d-flex align-items-center justify-content-center h-100">
            <div class="col-md-8 col-lg-7 col-xl-6">
                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg" class="img-fluid" alt="Phone image">
            </div>
            <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                <form action="<c:url value="/login/signup.do"/>">
                    <!-- Email input -->
                    <div class="text-danger" style="font-style: italic;">${errMessage}</div>

                    <div class="form-outline mb-1">
                        <label class="form-label" for="form1Example13">Họ và tên</label>
                        <input type="text" name="fullname" id="form1Example13" class="form-control form-control-lg" required />

                    </div>

                    <div class="form-outline mb-1">
                        <label class="form-label" for="form1Example13">Địa chỉ</label>
                        <input type="text" name="address" id="form1Example13" class="form-control form-control-lg" required />

                    </div>

                    <div class="form-outline mb-1">
                        <label class="form-label" for="form1Example13">Email</label>
                        <input type="email" name="email" placeholder="abc@gmail.com" id="form1Example13" class="form-control form-control-lg" required />

                    </div>

                    <div class="form-outline mb-1">
                        <label class="form-label" for="form1Example13">Số điện thoại</label>
                        <input type="text" name="phone" id="form1Example13" class="form-control form-control-lg" required />

                    </div>

                    <div class="form-outline mb-1">
                        <label class="form-label" for="form1Example13">Tên đăng nhập</label>
                        <input type="text" name="username" id="form1Example13" class="form-control form-control-lg" required />

                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-1">
                        <label class="form-label" for="form1Example23">Mật khẩu</label>
                        <input type="password" name="password" id="form1Example23" class="form-control form-control-lg" required />

                    </div>

                    <div class="form-outline mb-2">
                        <label class="form-label" for="form1Example23">Nhập lại mật khẩu</label>
                        <input type="password" name="repassword" id="form1Example23" class="form-control form-control-lg" required />

                    </div>
                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Đăng ký</button>
                </form>
            </div>
        </div>
    </div>
</section>