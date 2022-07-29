<%-- 
    Document   : main
    Created on : Mar 5, 2022, 10:11:41 PM
    Author     : SE161817 Vu Thi Ngoc Mai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FSHOP - Mua điện thoại online giá tốt</title>
        <link rel="icon" type="image/png" sizes="16x16" href="${root}/favicon/favicon-16x16.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <link href="${root}/css/style.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <!-- Begin Header -->
        <div id="header" class="row">

            <!-- Brand name & Logo -->
            <div class="store-name col-sm-3 text-center mg-auto">
                <a href="<c:url value="/home/index.do"/>"><img class="logo mg-auto" src="${root}/img/f-shop.png" alt=""></a>
            </div>

            <!-- Search products -->
            <div class="search-box col-sm-3 mg-auto">
                <form action="<c:url value="/home/search.do"/>">
                    <input type="text" name="searchText" class="form-control" placeholder="Bạn cần tìm gì?..." value="${searchText==null?"":searchText}">
                    <button type="submit" class="search-btn btn btn-info mg-auto" >
                        <i class="bi bi-search"></i>
                    </button>
                </form>
            </div>

            <!-- Customer's information required -->
            <ul id="customer-nav" class="col-sm-6 text-center mg-auto">
                <li>
                    <a href="<c:url value="/home/maintenance.do"/>" class="info-btn">
                        <i class="bi bi-telephone-fill"></i> <br />
                        Gọi mua hàng
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/feedback/index.do"/>" class="info-btn">
                        <i class="bi bi-chat-left-dots-fill"></i><br />
                        Đánh giá
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/cart/index.do"/>" class="info-btn">
                        <i class="bi bi-cart4"></i> <br />
                        Giỏ hàng của tôi
                        <span class="fs-cartic">${cart==null?0:cart.numOfProducts}</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="info-btn account-btn">

                        <c:if test="${user == null}"><i class="bi bi-person-fill"></i> <br />Tài khoản</c:if>
                        <c:if test="${user != null}"><i class="bi bi-person-check-fill"></i><br/>${user.name}</c:if>
                        </a>

                        <ul class="account-subnav">
                        <c:if test="${user == null}">
                            <li><a href="${pageContext.request.contextPath}/login/indexlogin.do">Đăng nhập</a></li>
                            <li><a href="${pageContext.request.contextPath}/login/indexsignup.do">Đăng ký</a></li>
                            </c:if>
                            <c:if test="${user != null}">                            
                            <li><a href="${pageContext.request.contextPath}/login/logout.do">Đăng xuất</a></li>
                            </c:if>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- End Header -->

        <!-- Begin Body -->
        <div class="container body-contain">

            <div class="row content py-3">
                <div class="col">                    
                    <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp" />
                </div>
            </div>

        </div>

        <!-- End Body -->

        <!-- Begin Footer -->
        <div class="bg-footer">
            <div id="footer" class="container">
                <div class="footer-company-detail row">
                    <div class="detail-col col-sm-3">
                        <span class="text-bold">Tìm cửa hàng</span> <br/>
                        Tìm cửa hàng gần nhất <br/>
                        Mua hàng từ xa <br/>
                        Gặp trực tiếp cửa hàng gần nhất (Zalo hoặc gọi điện) <br/>
                        <span class="text-bold">Phương thức thanh toán</span> <br/><br/>
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
                    <div class="detail-col col-sm-3">
                        Gọi mua hàng: <span class="text-bold">1800.0000</span> (8h00 - 22h00) <br/>
                        Gọi khiếu nại: <span class="text-bold">1800.0001</span> (8h00 - 21h30) <br/>
                        Gọi bảo hành: <span class="text-bold">1800.0002</span> (8h00 - 21h00) <br/>
                    </div>
                    <div class="detail-col col-sm-3">
                        <a href="">Mua hàng và thanh toán Online </a> <br/>
                        <a href="">Mua hàng trả góp Online </a> <br/>
                        <a href="">Tra thông tin đơn hàng </a> <br/>
                        <a href="">Tra thông tin bảo hành </a> <br/>
                        <a href="">Tra cứu hoá đơn điện tử </a> <br/>
                        <a href="">Trung tâm bảo hành chính hãng </a> <br/>
                        <a href="">Quy định về việc sao lưu dữ liệu </a> <br/>
                        <a href="">Dịch vụ bảo hành điện thoại </a> <br/>
                    </div>
                    <div class="detail-col col-sm-3">
                        <a href="">Quy chế hoạt động</a> <br/>
                        <a href="">Chính sách Bảo hành</a> <br/>
                        <a href="">Liên hệ hợp tác kinh doanh</a> <br/>
                        <a href="">Đơn Doanh nghiệp</a> <br/>
                        <a href="" class="text-red">Ưu đãi từ đối tác</a> <br/>
                        <a href="" class="text-red">Tuyển dụng</a> <br/>
                    </div>
                </div>
            </div>
            <div class="footer_copyright">
                <div class="footer-copyright text-center mg-auto">
                    Công ty TNHH Thương mại và dịch vụ kỹ thuật F-SHOP: <br/>
                    0316172372 do sở KH & ĐT TP. HCM cấp ngày 04/03/2022. Địa chỉ: Đường D1, Khu Công nghệ cao, Quận 9, Thành phố Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam. Điện thoại: 088.8888.8888.
                </div>
            </div>
        </div>
        <!-- End Footer -->
        <script src="${root}/js/main.js"></script>
    </body>
</html>
