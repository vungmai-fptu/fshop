<%-- 
    Document   : hotline
    Created on : Mar 19, 2022, 9:27:29 PM
    Author     : SE161740 Pham Nguyen Hung Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${root}/css/style.css" rel="stylesheet" type="text/css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotline!</title>
    </head>
    <body>        
        <div class="maintenance" >
            <h1>Chức năng hiện đang bảo trì</h1>
            <div class="maintenance-img">
                <img src="${root}/img/BaoTri.jpg" />    
                <a href="<c:url value="/home/index.do"/>" class="btn btn-info"><i class="bi bi-house-door-fill"></i>Trang Chủ</a>
            </div>      

        </div>        
    </body>
</html>
