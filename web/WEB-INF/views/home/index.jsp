<%-- 
    Document   : index
    Created on : Mar 1, 2022, 4:40:00 PM
    Author     : SE161740 Pham Nguyen Hung Anh
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
        <!-- Slider -->
        <div class="slideshow-container">
            <div class="mySlides fade">
                <img src="${root}/img/banner1.png" style="width: 100%" />
            </div>

            <div class="mySlides fade">
                <img src="${root}/img/banner2.png" style="width: 100%" />
            </div>

            <div class="mySlides fade">
                <img src="${root}/img/banner3.png" style="width: 100%" />
            </div>

            <div class="mySlides fade">
                <img src="${root}/img/banner4.png" style="width: 100%" />
            </div>
        </div>
        <br />

        <div style="text-align: center">
            <span class="dot" onclick="currentSlide(0)"></span>
            <span class="dot" onclick="currentSlide(1)"></span>
            <span class="dot" onclick="currentSlide(2)"></span>
            <span class="dot" onclick="currentSlide(3)"></span>
        </div>
        <!--End Slider-->
       
        <!-- Begin Tag List -->
        <h1 class="tag-list-title text-bold">Thương hiệu nổi bật</h1> <br/>
        <div id="list-related-tag">
            <a href="${root}/brand/apple.do" class="item-related-tag">
                <img src="${root}/img/logo-iphone-220x48.png" class="img-responsive" alt="">
            </a>
            <a href="${root}/brand/samsung.do" class="item-related-tag">
                <img src="${root}/img/samsungnew-220x48-1.png" class="img-responsive" alt="">    
            </a>
            <a href="${root}/brand/oppo.do" class="item-related-tag">
                <img src="${root}/img/OPPO42-b_5.jpg" class="img-responsive" alt="">    
            </a>
            <a href="${root}/brand/nokia.do" class="item-related-tag">
                <img src="${root}/img/Nokia42-b_21.jpg" class="img-responsive" alt="">    
            </a>
        </div> 
        <!-- End Tag List -->
        <div class="row">
            <c:forEach var="product" items="${list}">
                <div class="card col-sm-4 p-2">
                    <form action="<c:url value="/cart/add.do"/>" class="form_Product" style="height: 100%">
                        <div class="card-img">
                            <img src="<c:url value="/products/${product.id}.jpg"/>" width="100%"  />
                        </div>
                        <div class="card-title">
                            <input type="hidden" value="${product.id}" name="id"/>
                            Id: ${product.id}~${product.description}<br/>
                        </div>
                        <div class="card-price">
                            <strike> <fmt:formatNumber value=" ${product.price}" type="currency"/></strike>
                            <span style="color: red; font-size: 20px"><fmt:formatNumber value=" ${product.price*(1-product. discount)}" type="currency"/></span>
                        </div>
                        <div class="card-discount">
                            Đã được khuyến mãi: <fmt:formatNumber value=" ${product. discount}" type="percent"/><br/>
                        </div>    
                        <div class="card-quantity">
                            Số lượng: <input type="number" class="" name="quantity" style="width: 46px" value="1"/> <br/>
                        </div>

                        <div class="card-action">
                            <button type="submit"><i class="bi bi-cart-plus"></i> Thêm vào giỏ hàng</button>
                        </div>
                    </form>
                </div>
            </c:forEach>
        </div>
        <div class="row pageBtn">
            <div class="col" style="text-align: right;">
                <br/>
                <form action="<c:url value="/home/index.do" />">
                    <button type="submit" class="btn btn-danger btn-sm btn-info" name="op" value="FirstPage" title="First Page" <c:if test="${page==1}">disabled</c:if>><i class="bi bi-chevron-bar-left"></i></button>
                    <button type="submit" class="btn btn-danger btn-sm btn-info" name="op" value="PreviousPage" title="Previous Page" <c:if test="${page==1}">disabled</c:if>><i class="bi bi-chevron-left"></i></button>
                    <button type="submit" class="btn btn-danger btn-sm btn-info" name="op" value="NextPage" title="Next Page" <c:if test="${page==totalPage}">disabled</c:if>><i class="bi bi-chevron-right"></i></button>
                    <button type="submit" class="btn btn-danger btn-sm btn-info" name="op" value="LastPage" title="Last Page" <c:if test="${page==totalPage}">disabled</c:if>><i class="bi bi-chevron-bar-right"></i></button>
                    <input type="text" name="gotoPage" value="${page}" class="btn btn-danger btn-sm btn-outline-info" style="text-align: right;color:#fff;width: 32px;" title="Enter page number"/>
                    <button type="submit" class="btn btn-danger btn-sm btn-info" name="op" value="GotoPage" title="Goto Page"><i class="bi bi-arrow-up-right-circle"></i></button>
                </form>
                Page ${page}/${totalPage}
            </div>
        </div>
    </body>
</html>