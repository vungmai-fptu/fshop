<%-- 
    Document   : index
    Created on : Mar 3, 2022, 3:33:54 PM
    Author     : SE161740 Pham Nguyen Hung Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>

</style>

<div class="cart-banner" style="margin-top: -64px; margin-bottom: 32px " >
    <img src="${root}/img/khuyenmai30-4.png" style="width: 100%">
</div>

<c:if test="${empty cart.items}">
    <div style="width: 100%; padding-bottom: 50%; text-align: center; align-items: center">
        <i class="bi bi-cart-x-fill" style="color: #D01110; font-size: 64px"></i> <br/>
        <p style="font-style: italic">Không có sản phẩm nào trong giỏ hàng!</p> <br/>
        <a href="${root}/home/index.do">
            <button type="button" class="btn btn-danger">Về trang chủ</button>
        </a>
    </div>
</c:if>
<c:if test="${not empty cart.items}">


    <div id="progress">
        <div id="progress-bar"></div>
        <ul id="progress-num">
            <li class="step active">1</li>
            <li class="step">2</li>
            <li class="step">3</li>
        </ul>
    </div>
    <div class="content1 display">
        <table class="cart-table table table-striped">
            <thead>
                <tr>
                    <th class="text-right">No.</th>
                    <th class="text-right">Id</th>
                    <th>Image</th>
                    <th>Description</th>
                    <th class="text-right">Giá cũ</th>
                    <th class="text-right">Khuyến mãi</th>
                    <th class="text-right">Giá mới</th>
                    <th class="text-right">Số lượng</th>
                    <th class="text-right">Đơn giá</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cart.items}" varStatus="loop">
                <form>
                    <tr>
                        <td class="text-right">${loop.count}</td>
                        <td class="text-right">${item.id}</td>
                        <td><img src="<c:url value="/products/${item.id}.jpg"/>" height="60px"/></td>
                        <td>${item.description}</td>
                        <%--<td><fmt:formatNumber value="${item.price}" pattern="$#,##0.00"/></td>--%>
                        <td class="text-right"><fmt:formatNumber value="${item.price}" type="currency"/></td>
                        <td class="text-right"><fmt:formatNumber value="${item.discount}" type="percent"/></td>             
                        <td class="text-right"><fmt:formatNumber value="${item.newPrice}" type="currency"/></td>
                        <td class="text-right"><input type="number" value="${item.quantity}" name="quantity" style="width: 60px"/></td>
                        <td class="text-right"><fmt:formatNumber value="${item.cost}" type="currency"/></td>
                        <td>
                            <input type="hidden" value="${item.id}" name="id"/>
                            <button  type="submit" class="btn btn-outline-success" formaction="<c:url value="/cart/update.do"/>"><i class="bi bi-check-circle"></i> Chỉnh sửa</button> 
                            <button  type="submit" class="btn btn-outline-danger" formaction="<c:url value="/cart/delete.do"/>"><i class="bi bi-x-circle"></i> Xoá sản phẩm</button>
                        </td>
                    </tr>
                </form>
            </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th>Tổng tiền</th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th class="text-right"><fmt:formatNumber value="${cart.total}" type="currency"/></th>         
                    <th><a class="cart-clearAll-btn" href="<c:url value="/cart/empty.do"/>"><i class="bi bi-cart-x"></i> Xoá giỏ hàng</a></th>
                </tr>
            </tfoot>
        </table>
    </div>


    <div class="content1">
        <div class="address text-center">
            <h1>THÔNG TIN GIAO HÀNG:</h1>
            <form action="">
                <div class="mb-3 mt-3">
                    <label for="name" class="form-label"><i class="bi bi-person-fill"></i> Tên người nhận:</label>
                    <input type="text" class="form-control" placeholder="Nhập họ và tên người nhận">
                </div>
                <div class="mb-3">
                    <label for="phonenumber" class="form-label"><i class="bi bi-telephone-fill"></i> Số điện thoại:</label>
                    <input type="text" class="form-control" placeholder="Nhập số điện thoại người nhận">
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label"><i class="bi bi-geo-alt-fill"></i> Địa chỉ nhận hàng:</label>
                    <input type="text" class="form-control" placeholder="Nhập địa chỉ nhận hàng">
                </div>
            </form>
        </div>
    </div>
    
        <form>                        
            <div class="content1 row text-center" style="align-items: center;">
                <i class="bi bi-cash-coin" style="color: #D01110; font-size:32px" ></i> <h1 style="">PHƯƠNG THỨC THANH TOÁN</h1>
                <div class="payment-method col-sm-6 online-payment-method">
                    <a href="${root}/home/index.do"><h3 style="color: #D01110; font-weight: bold">Thanh toán điện tử</h3></a>
                    <a href="#">
                        <img src="${root}/img/visa-mastercard.png" class="img-responsive" alt="">
                    </a>
                    <a href="#">
                        <img src="${root}/img/logo-momo-png-4.png" class="img-responsive" alt="">
                    </a>
                    <a href="#">
                        <img src="${root}/img/zalo-pay-logo-png-2.png" class="img-responsive" alt="">
                    </a>
                </div>
                <div class="payment-method col-sm-6">     
                                   
                    <button  type="submit" formaction="<c:url value="/cart/empty.do"/>"><h3 style="color: #D01110; font-weight: bold">Thanh toán trực tiếp</h3></button>
                    <button  type="submit" formaction="<c:url value="/cart/empty.do"/>"><h3 style="color: #D01110; font-weight: bold">(Thanh toán bằng tiền mặt sau khi nhận hàng)</h3></button>
                </div>
            </div>
        </form>        
        <button id="progress-prev" class="btn" disabled>Quay lại</button>
        <button id="progress-next" class="btn">Tiếp theo</button>

        <script>
            const progressBar = document.getElementById("progress-bar");
            const progressNext = document.getElementById("progress-next");
            const progressPrev = document.getElementById("progress-prev");
            const steps = document.querySelectorAll(".step");
            const stepContents = document.querySelectorAll(".content1");
            let active = 1;
            let display = 1;
            progressNext.addEventListener("click", () => {
                active++;
                if (active > steps.length) {
                    active = steps.length;
                }
                updateProgress();
            });

            progressPrev.addEventListener("click", () => {
                active--;
                if (active < 1) {
                    active = 1;
                }
                updateProgress();
            });
            const updateProgress = () => {
                // toggle active class on list items
                steps.forEach((step, i) => {
                    if (i < active) {
                        step.classList.add("active");
                    } else {
                        step.classList.remove("active");
                    }
                });
                // set progress bar width  
                progressBar.style.width =
                        ((active - 1) / (steps.length - 1)) * 100 + "%";
                // enable disable prev and next buttons
                if (active === 1) {
                    progressPrev.disabled = true;
                } else if (active === steps.length) {
                    progressNext.disabled = true;
                } else {
                    progressPrev.disabled = false;
                    progressNext.disabled = false;
                }
            };


            // set the content
            progressNext.addEventListener("click", () => {
                display++;
                if (display > stepContents.length) {
                    display = stepContents.length;
                }
                updateContent();
            });

            progressPrev.addEventListener("click", () => {
                display--;
                if (display < 1) {
                    display = 1;
                }
                updateContent();
            });
            const updateContent = () => {
                // toggle display class on list items
                stepContents.forEach((content, i) => {
                    if (i < display) {
                        content.classList.add("display");
                    } else {
                        content.classList.remove("display");
                    }
                });
                // enable disable prev and next buttons
                if (display === 1) {
                    progressPrev.disabled = true;
                } else if (display === stepContents.length) {
                    progressNext.disabled = true;
                } else {
                    progressPrev.disabled = false;
                    progressNext.disabled = false;
                }
            };
        </script>
</c:if>



