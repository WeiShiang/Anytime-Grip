<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  response.setHeader("Cache-Control","no-store"); //HTTP 1.1
  response.setHeader("Pragma","no-cache");        //HTTP 1.0
  response.setDateHeader ("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store.model.*"%>
<%
StoreVO storeVO = (StoreVO) request.getAttribute("storeVO");
%>

<%@include file="includeHeadForStore.jsp" %>

        <div id="page-wrapper">

                <ol class="breadcrumb">
                    <li>
                        <a href="#">首頁</a>
                    </li>
                    <li>
                        <a href="#">商家會員管理</a>
                    </li>
                    <li>
                        ${storeVO.store_id} ${storeVO.store_name}
                    </li>
                    <li class="active">詳細資料及更新</li>
                </ol>


            <FORM METHOD="post" ACTION="<%= request.getContextPath() %>/back-end/store/store.do" name="form1" enctype="multipart/form-data">

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">

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
							<jsp:useBean id="userSvc" scope="page" class="com.user.model.UserService" />
							
                            <div class="input-group">
                                <label class="input-group-addon">商店名稱</label>
                                <input type="text" name="store_name" value="<%= (storeVO==null)? "" : storeVO.getStore_name()%>" class="form-control">
                            </div><br>
                            <div class="input-group">
                                <label class="input-group-addon">商店營業時間</label>
                                <input type="text" name="store_time" value="<%= (storeVO==null)? "" : storeVO.getStore_time()%>" class="form-control">
                            </div><br>
                            <div class="input-group">
                                <label class="input-group-addon">商店電話</label>
                                <input type="text" name="store_phone" value="<%= (storeVO==null)? "" : storeVO.getStore_phone()%>" class="form-control">
                            </div><br>                                                        
                            <div class="form-group">
                                <label class="input-group-addon">店家描述</label>
                                <textarea name="store_describe" class="form-control" rows="7"> <%= (storeVO==null)? "" : storeVO.getStore_describe()%> </textarea>
                            </div><br>
		                    <div class="col-lg-6">
		                    	狀態:&nbsp;&nbsp;                                     
        		               	<input type="radio" id="radio1" name="user_status" value="1" <c:if test="${userSvc.getOneUser(storeVO.user_id).user_status == '1'}" var="condition" scope="page" >checked</c:if> > 核准 &nbsp;&nbsp; 
                   		        <input type="radio" name="user_status" value="2" <c:if test="${userSvc.getOneUser(storeVO.user_id).user_status == '2'}" var="condition" scope="page" >checked</c:if> > 待審核&nbsp;&nbsp;
               		          	<input type="radio" name="user_status" value="0" <c:if test="${userSvc.getOneUser(storeVO.user_id).user_status == '0'}" var="condition" scope="page" >checked</c:if> > 停權 &nbsp;&nbsp;
                    		</div>
                    </div>        

                    <div class="col-lg-6">

                            <div class="col-xs-12 col-sm-4">
                                <div class="form-group">
                                    <label for="name">所在航廈</label>
                                    <select class="form-control" name="store_ter">
                                    <option <c:if test="${storeVO.store_ter == '1'}" var="condition" scope="page">selected</c:if> value="1">T1</option>
                                    <option <c:if test="${storeVO.store_ter == '2'}" var="condition" scope="page">selected</c:if> value="2">T2</option>
                                    </select>
                                </div>                                
                            </div>
                            <div class="col-xs-12 col-sm-4">
                                <div class="form-group">
                                    <label for="name">所在樓層</label>
                                    <select class="form-control" name="store_floor">
                                    <option value="B2" <c:if test="${storeVO.store_floor == 'B2'}" var="condition" scope="page">selected</c:if> >B2</option>
                                    <option value="B1" <c:if test="${storeVO.store_floor == 'B1'}" var="condition" scope="page">selected</c:if> >B1</option>
                                    <option value="1" <c:if test="${storeVO.store_floor == '1'}" var="condition" scope="page">selected</c:if> >1</option>
                                    <option value="2" <c:if test="${storeVO.store_floor == '2'}" var="condition" scope="page">selected</c:if> >2</option>
                                    <option value="3" <c:if test="${storeVO.store_floor == '3'}" var="condition" scope="page">selected</c:if> >3</option>
                                    <option value="4" <c:if test="${storeVO.store_floor == '4'}" var="condition" scope="page">selected</c:if> >4</option>
                                    </select>
                                </div>                               
                            </div>

                            <div class="col-xs-12 col-sm-4">
                                <div class="form-group">
	                            	<label for="name">出入境位置</label>
    	                        	<select class="form-control" name="store_inout">
  									<option value="1" <c:if test="${storeVO.store_inout == '1'}" var="condition" scope="page">selected</c:if> >出境區</option>
  									<option value="2" <c:if test="${storeVO.store_inout == '2'}" var="condition" scope="page">selected</c:if> >入境區</option>
									</select>                            
                    	    	</div>
                    	    </div><br>

                            <div class="col-xs-12 col-sm-6">
                                <div class="input-group">
                                    <label class="input-group-addon" >圖資位置x</label>
                                    <input type="text" name="store_lon" id="store_lon" value="<%= (storeVO==null)? "" : storeVO.getStore_lon()%>" class="form-control">
                                </div>                                
                            </div>                            
                            <div class="col-xs-12 col-sm-6">
                                <div class="input-group">
                                    <label class="input-group-addon" >圖資位置y</label>
                                    <input type="text" name="store_lat" id="store_lat" value="<%= (storeVO==null)? "" : storeVO.getStore_lat()%>" class="form-control">
                                </div><br>                                
                            </div>

                    <div class="col-xs-12">
                                                               更新圖片<br>
                        <input type="file" name="upfile1" id="file-input1" class="file" onchange="previewImages()">
                        </label>
                        <div id="preview"></div>                        
                    </div><br>
                            
                            <div class="col-xs-12 col-sm-6">
								<img src="<%= request.getContextPath() %>/front-end/stpi/DBGifReader?store_id=<%=storeVO.getStore_id()%>" height="300">
                            </div>
                            
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->
            

            
                        
            <br>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-1">
						<input type="hidden" name="store_id" value="<%=storeVO.getStore_id()%>">
						<input type="hidden" name="user_id" value="<%=storeVO.getUser_id()%>">
						<input type="hidden" name="store_count" value="<%=storeVO.getStore_count()%>">
						<input type="hidden" name="store_score" value="<%=storeVO.getStore_score()%>">
						<input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
						<input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>">  <!--用於:istAllEmp.jsp 與 複合查詢 listEmps_ByCompositeQuery.jsp-->
                        <button class="btn btn-primary" name="action" value="update">送出修改</button>
                    </div>
                    <div class="col-xs-12 col-sm-1">
                    	<button onclick="window.history.back();" class="btn btn-primary">回上一頁</button>
                    </div>
                    
                    <button type="button" id="speedInput"></button>
                    
                </div>
            </div>
            
            

            </form>

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="<%= request.getContextPath() %>/back-end/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%= request.getContextPath() %>/back-end/js/bootstrap.min.js"></script>

</body>

</html>

<script>

function init(){    
	var speedInput=document.getElementById("speedInput");
    speedInput.onclick=InputText;
}

function InputText(){
    document.getElementById("store_lon").value="948";
    document.getElementById("store_lat").value="741";
    document.getElementById("radio1").checked = true;
}

window.onload = init;

</script>
<script>

function previewImages() {
    
    var preview = document.getElementById('preview'); 
    
    if (this.files) {
      [].forEach.call(this.files, readAndPreview);
    }

    function readAndPreview(file) {
      
      var reader = new FileReader();
      
      reader.addEventListener("load", function() {
        var image = new Image();
        image.height = 150;
        image.title  = file.name;
        image.src    = this.result;
        preview.appendChild(image);
      }, false);
      
      reader.readAsDataURL(file);
      
    }

}

  document.getElementById('file-input1').addEventListener("change", previewImages, false);

</script>