<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,com.wish.model.*,com.wish.controller.*"%>
<%@ page import="com.reta.model.*,com.user.model.*,com.rest.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%if (session.getAttribute("userVO") != null) {
	UserVO userVO = (UserVO)session.getAttribute("userVO");
	String account =(String) session.getAttribute("account");
	Integer user_id =userVO.getUser_id();
	
    pageContext.setAttribute("user_id",user_id);
}

%>
<jsp:useBean id="retaSvc" scope="page" class="com.reta.model.RetaService" />
<jsp:useBean id="userSvc" scope="page" class="com.user.model.UserService" />
<jsp:useBean id="restSvc" scope="page" class="com.rest.model.RestService" />
<jsp:useBean id="avtbSvc" scope="page" class="com.avtb.model.AvtbService" />


<!DOCTYPE html>
<html lang="en" class="easy-sidebar-active">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>listOneUser_idAllOrd</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="<%=request.getContextPath() %>/front-end/css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/front-end/css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath() %>/front-end/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<link href="<%= request.getContextPath() %>/front-end/font-awesome/css/animation_style.css" rel="stylesheet" type="text/css">
    <style type="text/css">
    body {
			background:linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
			url('<%=request.getContextPath()%>/front-end/member_interface_rest/rest/images/1.jpg');
            background-position: center;
            background-size: cover;
		}
        .item img{
            height: 250px;
            width:100%;
        }
        .panel-body{
        font-size:13px;
        border:#dcdcdc 1px solid; ;
        }
        .content: {
          position: relative;
          border-radius:10px;
        }
        .box{
          width: 110px;
          height: 50px;
          position: fixed;
          top: 52px;
          left: 5px;
          margin: auto;
        }
        #accordion{
        font-size:12px;
        }
        #accordion>div{
        padding:5px;
        
        }
        .pop{
        font-size:14px;
        text-align:center;
        color: #FFE48B;
        }
        
    </style>
</head>

<body>
<div class="bkimg">
 
     <%@include file="/front-end/member_interface/headerBar.file" %>
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

<div class="container">
    <div class="row">
        <div class="callout"></div>
        <div class="col-md-11 col-xs-12" >
            <h3>訂位記錄</h3>
        </div>         
    </div>
</div>
    
    <header id="myCarousel top" class="carousel slide">
    </header>
   
<div class="container content">
        <div class="row">
        <header  class="header">
        <div class="text-vertical-center">
            <h1>Anytime Grip</h1>
            <h3>SHOP OUR COLLECTIONS &amp; SHOP WITH RUNWAY</h3>
            <div id="canvas-container" >
    			<canvas id="sineCanvas"  width="1024" height="300"></canvas>
			</div>
            <a href="#about" class="btn btn-dark btn-lg">Grip Now!!</a>
        </div>
       </header> 
</div>
</div>

<div class="container">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="<%=request.getContextPath()%>/front-end/index.jsp">首頁</a>
				</li>
				<li class="active">餐廳訂位記錄</li>

			</ol>


			<!-- paneltitle -->
			<div class="pop">
				<div class="col-xs-12 col-sm-2">訂位編號</div>
				<div class="col-xs-12 col-sm-4">餐廳	名稱</div>
				<div class="col-xs-12 col-sm-2">訂位日期</div>
				<div class="col-xs-12 col-sm-2">訂位人數</div>
				<div class="col-xs-12 col-sm-2">評分</div>
			</div>
			<br>
			<!-- paneltitleEND -->
			<!-- panelbodyStart -->
			<div class="container">
				<div class="row">

					<div id="accordion">
						<c:forEach var="retaVO" items="${retaSvc.findByUserId(userVO.getUser_id())}" varStatus="s">
							<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;訂位編號#${retaVO.reta_id}</div>
							<div class="text-center">
								<!-- 內容 -->
								<div class="col-xs-12 col-sm-2"><a href="<%=request.getContextPath()%>/front-end/restaurant/reta/reta.do?reta_id=${retaVO.reta_id}&action=Update_rankres_formember">【${retaVO.reta_id}】</a></div>
								<div class="col-xs-12 col-sm-4">${restSvc.getOneRest(avtbSvc.getOneAvtb(retaVO.avtb_id).rest_id).rest_name}</div>
								<div class="col-xs-12 col-sm-2">${avtbSvc.getOneAvtb(retaVO.avtb_id).avtb_date_s}<br>${avtbSvc.getOneAvtb(retaVO.avtb_id).avtb_date_e}</div>
								<div class="col-xs-12 col-sm-2">${retaVO.reta_number}</div>
								<div class="col-xs-12 col-sm-2">${retaVO.reta_rank_res} 
<!-- 								<td><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">修改</button></td> -->
								</div>
							</div>
							<!-- 內容結束 -->
						</c:forEach>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	
<!-- Modal -->
	<div class="container">
		

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">修改評分&感想</h4>
					</div>
					<form METHOD="post"	ACTION="<%=request.getContextPath()%>/front-end/restaurant/reta/reta.do">
					<div class="modal-body">
						<td>
							評分:
							<select name="reta_rank_res" id="reta_rank_res" value="${retaVO.reta_rank_res}">
								<option value="1" selected>1分</option>
								<option value="2" >2分</option>
								<option value="3" >3分</option>
								<option value="4" >4分</option>
								<option value="5" >5分</option>
							</select>
						</td>
						<br>
						<td>用餐感想:
						  <textarea class="form-control" name="reta_review" id="reta_review" cols="40" rows="8" >${retaVO.reta_review}</textarea>
						</td> 
					</div>
					<div class="modal-footer">
						<button class="btn btn-default" data-dismiss="modal">Close</button>
						<input type="submit" value="修改">
					</div>
					
					<input type="hidden" name="user_id" value="${userVO.user_id}">
					<input type="hidden" name="reta_id" value="${retaSvc.getOneRetaByUserID(userVO.user_id).reta_id}">
					<input type="hidden" name="avtb_id" value="${retaVO.avtb_id}">
<%-- 					<input type="hidden" name="reta_number" value="${retaVO.reta_number}"> --%>
<%-- 					<input type="hidden" name="reta_status" value="${retaVO.reta_status}"> --%>
<%-- 					<input type="hidden" name="reta_grant" value="${retaVO.reta_grant}"> --%>
<%-- 					<input type="hidden" name="reta_date" value="${retaVO.reta_date}"> --%>
<%-- 					<input type="hidden" name="reta_rank_res" value="${retaVO.reta_rank_res}"> --%>
					<input type="hidden" name="action" value="Update_rankres_formember">
					</form>
				</div>

			</div>
		</div>

	</div>
<!-- Modal End -->
			
			

<div class="callout"></div>
 <a id="to-top" href="#top" class="btn btn-dark btn-lg"><i class="fa fa-chevron-up fa-fw fa-1x"></i></a>
<%@ include file="/front-end/member_interface/script.file" %>	
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script src="<%= request.getContextPath() %>/front-end/js/animation.js"></script>
	
<script>
		$(function() {
			$("#accordion").accordion();
		});
</script>	

<script>
		function rank(){
			$.ajax({ 
					url : '<%=request.getContextPath()%>/front-end/restaurant/reta/reta.do', 
					type : 'POST', 
					data : { 
			   		
						action:'',
						reta_id: ,
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
</script>


</div>
</body>
</html>
