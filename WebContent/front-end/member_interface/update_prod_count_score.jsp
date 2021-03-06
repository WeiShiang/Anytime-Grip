<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ord.model.*,com.item.model.*"%>
<%
	ItemVO itemVO = (ItemVO) request.getAttribute("itemVO"); 
	pageContext.setAttribute("itemVO",itemVO);
%>
<!DOCTYPE html>
<html lang="en">
<jsp:useBean id="prodSvc" class="com.prod.model.ProdService"/>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Update_prod_count_score</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath() %>/front-end/css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/front-end/css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath() %>/front-end/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <style type="text/css">
        .item img{
            height: 300px;
            width: 100%;
        }
        th{
       text-align:center;
       font-size:14px;
       
        }
    </style>
</head>

<body>

    
  <%@include file="/front-end/member_interface/headerBar.file" %>
    <!-- Header -->
    <div class="callout" ></div>

   
	
   			<div id="page-wrapper">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <h3 class="page-header">給予產品評價</h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            </div>

 			<div id="page-wrapper col-md-12">
				<div class="col-md-6">
                <ol class="breadcrumb">
                     <li>
                        <a href="<%=request.getContextPath()%>/front-end/indext.jsp">首頁</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/front-end/member_interface/listOneUser_idAllOrd.jsp">消費記錄</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/front-end/member_interface/listOneOrd_idAllItem_formember.jsp">訂單明細</a>
                    </li>
                    
                    <li class="active">給予產品評價</li>
                </ol>
                </div>
                
			</div>

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

<div class="container-fluid col-md-6 col-md-offset-3 col-xs-10">

                <div class="row">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i>產品明細 :</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
												<tr>
													<td>產品編號:</td>
													<td>${itemVO.prod_id }</td>
												</tr>
												<tr>
													<td>產品名稱:</td><td><c:forEach var="prodVO" items="${prodSvc.all}">
									                    <c:if test="${itemVO.prod_id==prodVO.prod_id}">
										                    	【${prodVO.prod_name}】
									                    </c:if>
									                </c:forEach>
												</td>
												</tr>
												
												</table>
		
		
	
												<table>
														<td>
														
														  
														  
														   <c:if test="${itemVO.item_score =='0'}">
														   <div class="click-callback"></div><!-- 用星星取代option給分 -->
														   <div class="starRating"></div>
<%-- 														   <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/item/item.do"> --%>
<%-- 														    <select name="item_score" class="item_score" value="${itemVO.item_score }"> --%>
<!-- 																							  <option value="1">差</option> -->
<!-- 																							  <option value="2">尚可</option> -->
<!-- 																							  <option value="3">普通</option> -->
<!-- 																							  <option value="4">好</option> -->
<!-- 																							  <option value="5">極佳</option> -->
<!-- 															</select> -->
<!-- 															 <input type="submit" value="給予此產品分數。"> -->
															 <input type="hidden" class="ord_id" name="ord_id" value="${itemVO.ord_id }">
															 <input type="hidden" class="prod_id" name="prod_id" value="${itemVO.prod_id }">
															 <input type="hidden" class="item_qty" name="item_qty" value="${itemVO.item_qty }">
															 <input type="hidden" class="item_review" name="item_review" value="${itemVO.item_review }">
															 <input type="hidden" class="item_reviewdate" name="item_reviewdate" value="${itemVO.item_reviewdate }">
															 <input type="hidden" name="action"	value="update_prodCount_Score">
															 <input type="hidden" name="requestURL" class="requestURL" value="<%=request.getParameter("requestURL")%>">
<!-- 															</FORM> -->
															</c:if>
															<c:if test="${itemVO.item_score !='0'}"> 
																<h4>已給過此產品分數。</h4>
											
															</c:if>		
												 		 </td>
														<br>
														
												</table>
												<input onclick="window.close();" value="關閉視窗" type="button">	
</div>
</div>
</div>
</div>
</div>



<%@ include file="/front-end/member_interface/script.file" %>
	<script src="<%=request.getContextPath() %>/front-end/js/stars.min.js"></script>
<script type="text/javascript">
$(function(){
		
		$(".click-callback").stars({ 
		    click: function(i){
		    		$.ajax({
		    			url : '<%=request.getContextPath()%>/front-end/item/item.do',
		    			data : {
		    				item_score : i,
		    				ord_id :$('.ord_id' ).val(),
		    				prod_id :$('.prod_id').val(),
		    				item_qty :$('.item_qty').val(),
		    				item_review :$('.item_review').val(),
		    				item_reviewdate: $('.item_reviewdate').val(),
		    				action:'update_prodCount_Score',
		    				requestURL:$('.requestURL').val()
		    			},
		    			dataType:"text",
		    			type : 'POST',
		    					
		    					success : function(jsonStr) {
		    						console.log(jsonStr);
		    							  $('.starRating').append('評價完成');
		    							  $('.click-callback').remove();
		    							  
		    						},
		    					error : function(xhr) {
		    						alert("error");
		    						alert(xhr.status); 
		    						alert(thrownError); 
		    					}
		    				});	
					}
			
		});	    
	});    


</script>
</body>
</html>
