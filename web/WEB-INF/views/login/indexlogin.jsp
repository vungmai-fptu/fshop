<%-- 
    Document   : indexlogin
    Created on : Mar 16, 2022, 4:14:43 PM
    Author     : SE161714 Ha Anh Tu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="vh-100">
  <div class="container py-5 h-100">
    <div class="row d-flex align-items-center justify-content-center h-100">
      <div class="col-md-8 col-lg-7 col-xl-6">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg" class="img-fluid" alt="Phone image">
      </div>
      <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
          <form action="<c:url value="/login/login.do"/>">
          <!-- Email input -->
          <div class="text-success" style="font-style: italic;">${successMessage}</div>
          <div class="form-outline mb-4">
            <input type="text" name="username" id="form1Example13" class="form-control form-control-lg" />
            <label class="form-label" for="form1Example13">Tên đăng nhập</label>
          </div>

          <!-- Password input -->
          <div class="form-outline mb-4">
            <input type="password" name="password" id="form1Example23" class="form-control form-control-lg" />
            <label class="form-label" for="form1Example23">Mật khẩu</label>
          </div>

          <div class="d-flex justify-content-around align-items-center mb-4">
            <!-- Checkbox -->
            <div class="form-check">
              <input
                class="form-check-input"
                type="checkbox"
                value=""
                id="form1Example3"
                checked
              />
              <label class="form-check-label" for="form1Example3"> Ghi nhớ mật khẩu </label>
            </div>
            <a href="#!">Quên mật khẩu?</a>
          </div>

          <!-- Submit button -->
          <button type="submit" class="btn btn-primary btn-lg btn-block">Đăng nhập</button>

         <div class="text-danger" style="font-style: italic;">${errorMessage}</div>

         

        </form>
      </div>
    </div>
  </div>
</section>
