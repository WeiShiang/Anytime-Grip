<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.reta.model.*,com.avtb.model.*,com.rest.model.*,com.user.model.*"%>
<%
request.setCharacterEncoding("UTF-8");
RetaVO retaVO = (RetaVO) request.getAttribute("retaVO");
AvtbVO avtbVO = (AvtbVO) request.getAttribute("avtbVO");
RestVO restVO = (RestVO) request.getAttribute("restVO");
// UserVO userVO = (UserVO) session.getAttribute("userVO");
%>

<jsp:useBean id="avtbSvc" scope="page" class="com.avtb.model.AvtbService"></jsp:useBean>

<html>
<head>
<title>新增訂位</title>
<meta charset="UTF-8">	

	<!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="<%= request.getContextPath() %>/front-end/css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%= request.getContextPath() %>/front-end/css/stylish-portfolio.css" rel="stylesheet">
	<link href="<%= request.getContextPath() %>/front-end/member_interface_rest/rest/style.css" rel="stylesheet">
	
    <!-- Custom Fonts -->
    <link href="<%= request.getContextPath() %>/front-end/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">


	<link href="<%= request.getContextPath() %>/front-end/font-awesome/css/animation_style.css" rel="stylesheet" type="text/css">
	
	<link href="<%= request.getContextPath() %>/front-end/font-awesome/css/jelly_button.css" rel="stylesheet" type="text/css">
	
<style>
	.restName {
		text-align: center;
	}
	
	.bannerPic{
		text-align:center;
		margin-top:0;
	}
	
	.red {
		width: 1100px;
		height: 180px;
	}
	.dishPic {
		width: 500px;
		margin-top:0;
	}

	body {
		background-image: url('<%=request.getContextPath()%>/front-end/member_interface_rest/rest/images/simple-wallpaper-26.jpg');
        background-position: center;
        background-size: cover;
	}
	button { 
		color: #000000; 
	} 




.styled-select {
   background: url(http://i62.tinypic.com/15xvbd5.png) no-repeat 96% 0;
   height: 29px;
   overflow: hidden;
   width: 240px;
}

.styled-select select {
   background: transparent;
   border: none;
   font-size: 14px;
   height: 29px;
   padding: 5px; /* If you add too much padding here, the options won't show in IE */
   width: 268px;
}

.styled-select.slate {
   background: url(http://i62.tinypic.com/2e3ybe1.jpg) no-repeat right center;
   height: 34px;
   width: 240px;
}

.styled-select.slate select {
   border: 1px solid #ccc;
   font-size: 16px;
   height: 34px;
   width: 268px;
}

/* -------------------- Rounded Corners */
.rounded {
   -webkit-border-radius: 20px;
   -moz-border-radius: 20px;
   border-radius: 20px;
}

.semi-square {
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
}

/* -------------------- Colors: Background */
.slate   { background-color: #ddd; }
.green   { background-color: #779126; }
.blue    { background-color: #3b8ec2; }
.yellow  { background-color: #eec111; }
.black   { background-color: #000; }

/* -------------------- Colors: Text */
.slate select   { color: #000; }
.green select   { color: #fff; }
.blue select    { color: #000; } 
.yellow select  { color: #000; }
.black select   { color: #fff; }
 

 
</style>
</head>


<body bgcolor='white'>
<%@include file="headerBar.file" %>
	<br>
	<br>
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
java.util.Date sql = new Date(System.currentTimeMillis()); 
%>

<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/front-end/restaurant/reta/reta.do" name="form1" id="form1">

<section id="contact" class="section-padding" style="margin-top:180px;">
        <div class="container">
            <div class="row" style="margin-bottom: 20px;">
                <div class="col-md-12 text-center">
                    <h1 class="header-h">Book Your table</h1>
                </div>
            </div>
            
	<table border="0">
		<div class="col-md-12 col-sm-6">
		
		<div class="col-md-6 col-sm-6 contact-form">
			<div class="form-group">
				<div>會員帳號：${userVO.user_id}</div>
				<div class="validation"></div>
			</div>
		</div>
		
 		<div class="col-md-6 col-sm-6 contact-form pad-form">    <!--訂位人數 -->
			<div class="form-group">
				<input class="form-control label-floating is-empty" type="text"
					name="reta_number" size="20"
					value="<%=(retaVO == null) ? "" : retaVO.getReta_number()%>"
				placeholder="請輸入人數" required />
			<div class="validation"></div>
			</div>
		</div>
		
		<div class="col-md-6 col-sm-6 contact-form">
			<div class="form-group">
				<div>訂位成立日期：<%=sql %></div>
				<div class="validation"></div>
			</div>
		</div>
		
		<div class="col-md-6 col-sm-6 contact-form">
			<div class="form-group">
				<div class="styled-select blue rounded">
					<select name="avtb_id" id="select">
						<option value="123">請選擇時段
							<c:forEach var="avtbVO"
								items="${avtbSvc.findByPrimaryKeyByRest(restVO.rest_id)}">
								<option value="${avtbVO.avtb_id}">
									<fmt:formatDate value="${avtbVO.avtb_date_s}"
										pattern="MM/dd HH:mm" /> ~
									<fmt:formatDate value="${avtbVO.avtb_date_e}"
										pattern="MM/dd HH:mm" />
								</option>
							</c:forEach>
					</select>
				</div>
			</div>
		</div>


		<div class="col-md-6 col-sm-6 contact-form">
			<div class="form-group">
				<div class="validation"></div>
			</div>
		</div>
		
		<div class="col-md-6 col-sm-6 contact-form">
			<div class="form-group">
				<div>剩餘人數：</div><div id="number">${avtbVO.avtb_max_reservation-avtbVO.avtb_reservation}</div>
				<div class="validation"></div>
			</div>
		</div>

		
			
			
			<!-- 	   <b>選擇訂位日期:</b> -->
<!--        <select size="1" name="avtb_id" id="select"> -->
<!--        <option value="123">請選擇時段 -->
<%--          <c:forEach var="avtbVO" items="${avtbSvc.findByPrimaryKeyByRest(restVO.rest_id)}" > --%>
<%--           	<option value="${avtbVO.avtb_id}"> --%>
<%--           	<fmt:formatDate value="${avtbVO.avtb_date_s}" pattern="MM/dd HH:mm"/> ~  --%>
<%--           	<fmt:formatDate value="${avtbVO.avtb_date_e}" pattern="MM/dd HH:mm"/> --%>
<!--           	</option> -->
<%--          </c:forEach>    --%>
<!--        </select> -->

<!-- 	<tr> -->
<!-- 		<td>使用者編號:</td> -->
<%-- 		<td>${userVO.user_id}</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>訂位人數:</td> -->
<!-- 		<td><input type="TEXT" name="reta_number" size="45"  -->
<%-- 			value="<%= (retaVO==null)? "" :retaVO.getReta_number() %>" required/> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>訂位成立日期:</td> -->
<!-- 		<td><input type="TEXT" name="reta_date" size="45" -->
<%-- 			value="<%= (retaVO==null)? sql : retaVO.getReta_date()%>" style="disable"/></td> --%>
<!-- 	</tr> -->
</div>
</table>


<br>
<input type="hidden" name="action" value="insert">
<input type="hidden" name="user_id" value="${userVO.user_id}">
<input type="hidden" name="reta_grant" value="1">
<input type="hidden" name="rest_rpstatus" value="0">
<input type="hidden" name="reta_id" value="3400001">
<input type="hidden" name="reta_date" value="<%=sql%>">
<input type="hidden" name="reta_rank_res" value="0">
<input type="hidden" name="reta_status" value="0">
<input type="hidden" name="reta_review" value="">
<!-- <input type="submit" value="送出新增"> -->


	<div class="col-md-4 col-md-offset-5 btnpad">
		<div class="contacts-btn-pad button">
			<button>預約訂位</button>
		</div>
	</div>
</div>
</section>
 	<!-- animation -->
	<div id="canvas-container" >
    	<canvas id="sineCanvas"  width="1024" height="300"></canvas>
	</div>

</FORM>
<%@ include file="/front-end/member_interface/script.file" %>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="<%= request.getContextPath() %>/front-end/js/animation.js"></script>

<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.12.1/TweenMax.min.js'></script>
<script src="<%= request.getContextPath() %>/front-end/js/jelly_button.js"></script>

<script>
	$().ready(function() {
		$("#form1").validate({
			rules : {
				reta_number : {
					required : true,
					range : [ 1, 99 ],
					digits : true,
					number : true
				}
			},
			messages : {
				reta_number : {
					required : "請輸入訂位人數",
					digits : "請輸入整數",
					number : "請輸入整數",
					range : "輸入錯誤/人數過多"
				}
			}
		});
	

			
		
		$("#select").on('change', function() {
			 
			var sel_text = $("[id$=select]").find("option:selected").text()
		    var sel_val = $("[id$=select]").val();
			
			if(sel_val != 123){
			$.ajax({ 
		  		url : '<%=request.getContextPath()%>/front-end/restaurant/avtb/avtb.do', 
		  		type : 'POST', 
		  		data : { 
			   		
		  			action:'FFF',
		  			avtb_id: sel_val,
			  	}, 
		  	
			  	dataType: "text",
			  	
			    success : function(msg) { 
			    	console.log(msg)
			    	$("#number").html(msg).css("color","red");
			     }, 
			    error : function(xhr) { 
			     	alert("ajax發生錯誤"); 
			     	alert(xhr.status);  
			    } 
			   }); 
			}
		  });
		
		
	});
</script> 
</body>
</html>
