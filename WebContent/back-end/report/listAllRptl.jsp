<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.rppr.model.*"%>
<%@ page import="com.rptl.model.*"%>
<%@ page import="java.util.*"%>

<%
	RptlService rptlSvc = new RptlService();
	List<RptlVO> list = rptlSvc.getAll();
	pageContext.setAttribute("list", list);
%>
 <jsp:useBean id="userSvc" scope="page" class="com.user.model.UserService"/> 
<%@include file="includeHeadForReport.jsp" %>

        <div id="page-wrapper">
        
                <ol class="breadcrumb">
                    <li>
                        <a href="#">首頁</a>
                    </li>
                    <li>
                        <a href="#">檢舉管理</a>
                    </li>
                    <li class="active">未處理</li>
                </ol>
        
            <div class="container-fluid">



			<ul class="nav nav-tabs">
				<li><a href="<%= request.getContextPath() %>/back-end/report/listAllRppr.jsp"><h4>產品檢舉</h4></a></li>
				<li class="active"><a href="<%= request.getContextPath() %>/back-end/report/listAllRptl.jsp"><h4 style="color:red;">遊記檢舉</h4></a></li>
			</ul>
			
			<div class="row">
				<div class="col-lg-10">
					
					<table class="table table-bordered table-hover table-striped">
						<thead>
							<tr>
								<th>項次</th>
								<th>檢舉編號</th>
								<th>檢舉時間</th>
								<th>檢舉帳號</th>
								<th>詳情</th>
								<th>處理狀況</th>
							</tr>
						</thead>
						<tbody style="background-color: lightblue;">
							<%@ include file="page1.file"%>
							<c:forEach var="rptlVO" items="${list}" varStatus="s" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
								<tr>
									<td>${s.count}</td>
									<td>${rptlVO.rptl_id}</td>
									<td>${rptlVO.rptl_date}</td>
									<td>${userSvc.getOneUser(rptlVO.user_id).user_account}</td>
									<td>
										<form action="<%=request.getContextPath()%>/back-end/report/rptl.do" method="post" name="form2">
											<input type="hidden" name="rptl_id" value="${rptlVO.rptl_id}"> 
											<input type="hidden" name="trvl_id" value="${rptlVO.trvl_id}"> 
											<input type="hidden" name="action" value="getOne_For_Display">
											<input type="submit" class="btn btn-lg btn-primary" value="詳情">
										</form>
									</td>
									<td>
										<c:if test="${rptlVO.rptl_status==0}">
											<label class="label label-danger">待審檢舉</label>
										</c:if>		
										<c:if test="${rptlVO.rptl_status==1}">
											 <label class="label label-warning">檢舉審核通過,已下架產品</label>
										</c:if>	
										<c:if test="${rptlVO.rptl_status==2}">
											 <label class="label label-success">檢舉審核未通過,保留產品</label>
										</c:if>	
											
									</td>
								</tr>
							</c:forEach>
							<%@ include file="page2.file"%>
						<tbody>
					</table>
				</div>
			</div><!-- row -->
		</div><!-- /.container-fluid -->
	</div><!-- /#page-wrapper -->
              
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="<%= request.getContextPath() %>/back-end/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%= request.getContextPath() %>/back-end/js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="<%= request.getContextPath() %>/back-end/js/plugins/morris/raphael.min.js"></script>
    <script src="<%= request.getContextPath() %>/back-end/js/plugins/morris/morris.min.js"></script>
    <script src="<%= request.getContextPath() %>/back-end/js/plugins/morris/morris-data.js"></script>

</body>

</html>
