<%-- 
    Document   : index
    Created on : Mar 21, 2022, 12:26:01 AM
    Author     : SE161714 Ha Anh Tu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${root}/css/style.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FeedBack!</title>
    </head>
    <body>
        <div class="feedback-contain">
            <div class="feedback">

                <form action="<c:url value="/feedback/add.do"/>" >
                    <input type="hidden" value="${feedbackId}" class="form-control" id="id" placeholder="Enter id" name="id" >
                    <input type="hidden" value="${user.userName}" class="form-control" id="id" placeholder="Enter id" name="userName" >
                    <h1 class="feedback__user">Chào mừng ${user.name}</h1>
                    <label class="feddBack-title" for="description">Vui lòng cho chúng tôi biết đánh giá của bạn</label><br/>
                    <textarea name="description" id="" cols="30" rows="10" placeholder="Đánh giá của bạn" class="feedback__text"></textarea><br>
                    <input class="btn btn-outline-danger" type="submit" name="" value="Nhận xét">
                </form>             
                <img class="feedback-img"  src="${root}/img/feedback1.jpg"/>
            </div>
            <div class="feedback-cmt-title p-4"><p><strong>ĐÁNH GIÁ CỬA HÀNG</strong></p></div>

            <div class="feedback-cmt">                
                <div class="stars">
                    <input type="radio" id="five" name="rate" value="5">
                    <label for="five"></label>
                    <input type="radio" id="four" name="rate" value="4">
                    <label for="four"></label>
                    <input type="radio" id="three" name="rate" value="3">
                    <label for="three"></label>
                    <input type="radio" id="two" name="rate" value="2">
                    <label for="two"></label>
                    <input type="radio" id="one" name="rate" value="1">
                    <label for="one"></label>
                </div>
                <br/>   
                <br/>   
                <div class="p-4">
                    <c:forEach var="item" items="${list}" >
                        <i class="bi bi-person-circle"></i> ${item.userName.userName}<br/>
                        <p>${item.descriptions}</p>                      
                    </c:forEach>
                </div>
            </div>            
        </div>
    </body>
</html>
