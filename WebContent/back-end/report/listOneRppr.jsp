<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.rppr.model.*"%>

<%
	RpprVO rpprVO=(RpprVO)request.getAttribute("RpprVO");
%>
<jsp:useBean id="userSvc" scope="page" class="com.user.model.UserService"/>
<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService"/>
<%@include file="includeHeadForReport.jsp" %>


<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
</head>
<body>

<div id="page-wrapper">

<jsp:useBean id="prodSvc" scope="page" class="com.prod.model.ProdService" />
	<div class="container-fluid">
		<div class="row">
			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-money fa-fw"></i><b>檢舉編號:${rpprVO.rppr_id}</b>
							</h3>
						</div>
						<div class="panel-body">
							<p>
								檢舉日期:<b> ${rpprVO.rppr_date}</b>
							</p>
							<p>
								檢舉人帳號:<b> ${userSvc.getOneUser(rpprVO.user_id).user_account}</b>
							</p>
							<p>
								被檢舉商品:<b><a href="<%=request.getContextPath()%>/front-end/prod/prod.do?prod_id=${rpprVO.prod_id}&action=getOne_For_Display"> ${prodSvc.getOneProd(rpprVO.prod_id).prod_name}</a></b>
							</p>
							<p>
								被檢舉商家:<b> ${storeSvc.getOneStore(prodSvc.getOneProd(rpprVO.prod_id).store_id).store_name}</b>
							</p>
							<p>
								檢舉標題:<b>${rpprVO.rppr_tittle}</b>
							</p>	
							<p>
								檢舉內文:<br>
								<b>${rpprVO.rppr_content}</b>
							</p>	
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<c:if test="${rpprVO.rppr_status==0}">
						<div class="col-xs-12 col-md-1 col-md-push-4">
							<form method="POST" action="<%=request.getContextPath()%>/back-end/report/rppr.do" name="form1">
								<input type="hidden" name="rppr_status" value="1">
								<input type="hidden" name="rppr_id" value="${rpprVO.rppr_id}">
								<input type="hidden" name="action" value="update">
								<input type="submit" class="btn btn-sm btn-danger" value="移除產品">
							</form>
						</div>	
						<div class="col-xs-12 col-md-1 col-md-push-5">
							<form method="POST" action="<%=request.getContextPath()%>/back-end/report/rppr.do" name="form2">
								<input type="hidden" name="rppr_status" value="2">
								<input type="hidden" name="rppr_id" value="${rpprVO.rppr_id}">
								<input type="hidden" name="action" value="update">
								<input type="submit" class="btn btn-sm btn-danger" value="保留產品">
							</form>
						</div>
					</c:if>		
				</div>
			</div>
		</div><!-- /.row -->
	</div>
	
</div>

</body>
</html>