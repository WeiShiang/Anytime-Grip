<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.reta.model.*"%>
<%@ page import="com.avtb.model.*"%>
<%
request.setCharacterEncoding("UTF-8");
RetaVO retaVO = (RetaVO) request.getAttribute("retaVO");
AvtbVO avtbVO = (AvtbVO) request.getAttribute("avtbVO");
%>

<html>
<head>
<title>確認訂位資訊 - resultReta.jsp</title>
<meta charset="UTF-8">	

	<!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="<%= request.getContextPath() %>/front-end/css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%= request.getContextPath() %>/front-end/css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%= request.getContextPath() %>/front-end/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

<!-- 	<link href="css/sucess_style.css" rel="stylesheet" type="text/css"> -->
	<link href="<%= request.getContextPath() %>/front-end/font-awesome/css/sucess_style.css" rel="stylesheet" type="text/css">
	<link href="<%= request.getContextPath() %>/front-end/font-awesome/css/animation_style.css" rel="stylesheet" type="text/css">
	
    <style type="text/css">
	 .text-primary{
	 	color:#337ab7;
	 }
	 
	 body {
		background-image: url('<%=request.getContextPath()%>/front-end/member_interface_rest/rest/images/simple-wallpaper-26.jpg');
        background-position: center;
        background-size: cover;
	} 
	</style>
	
</head>


<body bgcolor='white'>
<%@include file="headerBar.file" %>

<jsp:useBean id="avtbSvc" scope="page" class="com.avtb.model.AvtbService"></jsp:useBean>

<br><br>
<div class="callout"></div>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<%
java.sql.Timestamp sql = new Timestamp(System.currentTimeMillis()); 
%>

	<div class="col-lg-12">
		<h2 class="page-header text-center">訂位成功</h2>
	</div>
	
	<div class="col-sd-12 col-md-2 col-md-offset-5" >
		<div class="panel panel-default text-center">
			<div class="panel">
				<div class="sa" style="margin:0px auto;"> 
				<div class="sa-success">
				<div class="sa-success-tip"></div>
				<div class="sa-success-long"></div>
				<div class="sa-success-placeholder"></div>
				<div class="sa-success-fix"></div>
				</div>
				</div> 
			</div>
			<div class="panel-body">
				<div>所選時段:<br>
				<fmt:formatDate value="${avtbSvc.getOneAvtb(retaVO.avtb_id).avtb_date_s}" pattern="yyyy-MM-dd HH:mm"/> ~
				<fmt:formatDate value="${avtbSvc.getOneAvtb(retaVO.avtb_id).avtb_date_e}" pattern="HH:mm"/></td>
				</div>

				<div>使用者編號:${retaVO.user_id}</div>

				<div>訂位人數:${retaVO.reta_number}</div>
			</div>
		</div>
		<h3 class="text-center"><a href="<%=request.getContextPath() %>/front-end/member_interface_rest/rest/listOneUser_idAllReta.jsp">回到我的訂位</a></h3>
	</div>
	<!-- 	animation -->
	<div id="canvas-container" >
    <canvas id="sineCanvas"  width="1024" height="300"></canvas>
	</div>
  
<%@ include file="/front-end/member_interface/script.file" %>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="<%= request.getContextPath() %>/front-end/js/animation.js"></script>
  
</body>
</html>