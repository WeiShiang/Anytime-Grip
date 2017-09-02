<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  response.setHeader("Cache-Control","no-rest"); //HTTP 1.1
  response.setHeader("Pragma","no-cache");        //HTTP 1.0
  response.setDateHeader ("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.rest.model.*"%>
<%
RestVO restVO = (RestVO) request.getAttribute("restVO");
%>

<%@include file="includeHeadForRest.jsp" %>

        <div id="page-wrapper">

                <ol class="breadcrumb">
                    <li>
                        <a href="#">首頁</a>
                    </li>
                    <li>
                        <a href="#">餐廳會員管理</a>
                    </li>
                    <li>
                        ${restVO.rest_id} ${restVO.rest_name}
                    </li>
                    <li class="active">詳細資料及更新</li>
                </ol>


            <FORM METHOD="post" ACTION="<%= request.getContextPath() %>/back-end/rest/rest.do" name="form1" enctype="multipart/form-data">

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
                                <label class="input-group-addon">餐廳名稱</label>
                                <input type="text" name="rest_name" value="<%= (restVO==null)? "" : restVO.getRest_name()%>" class="form-control">
                            </div><br>
                            <div class="input-group">
                                <label class="input-group-addon">餐廳營業時間</label>
                                <input type="text" name="rest_hours" value="<%= (restVO==null)? "" : restVO.getRest_hours()%>" class="form-control">
                            </div><br>
                            <div class="input-group">
                                <label class="input-group-addon">餐廳電話</label>
                                <input type="text" name="rest_phone" value="<%= (restVO==null)? "" : restVO.getRest_phone()%>" class="form-control">
                            </div><br>                                                        
                            <div class="form-group">
                                <label class="input-group-addon">餐廳簡介</label>
                                <textarea name="rest_detail" class="form-control" rows="7"> <%= (restVO==null)? "" : restVO.getRest_detail()%> </textarea>
                            </div><br>
                            <div>
                                <div class="form-group">
                                    <label class="input-group-addon" for="name">餐廳種類</label>
                                    <select class="form-control" name="rest_type">
                                    <option value="1" <c:if test="${restVO.rest_type == '1'}" var="condition" scope="page">selected</c:if> >台式</option>
                                    <option value="2" <c:if test="${restVO.rest_type == '2'}" var="condition" scope="page">selected</c:if> >中式</option>
                                    <option value="3" <c:if test="${restVO.rest_type == '3'}" var="condition" scope="page">selected</c:if> >西式</option>
                                    <option value="4" <c:if test="${restVO.rest_type == '4'}" var="condition" scope="page">selected</c:if> >日式</option>
                                    <option value="5" <c:if test="${restVO.rest_type == '5'}" var="condition" scope="page">selected</c:if> >穆斯林</option>
                                    <option value="6" <c:if test="${restVO.rest_type == '6'}" var="condition" scope="page">selected</c:if> >印度</option>
                                    <option value="7" <c:if test="${restVO.rest_type == '7'}" var="condition" scope="page">selected</c:if> >泰國</option>
                                    <option value="8" <c:if test="${restVO.rest_type == '8'}" var="condition" scope="page">selected</c:if> >越南</option>
                                    </select>
                                </div>                               
                            </div>
		                    <div class="col-lg-12">
		                    	狀態:&nbsp;&nbsp;                                     
        		               	<input type="radio" id="radio1" name="user_status" value="1" <c:if test="${userSvc.getOneUser(restVO.user_id).user_status == '1'}" var="condition" scope="page" >checked</c:if> > 核準 &nbsp;&nbsp; 
                   		        <input type="radio" name="user_status" value="2" <c:if test="${userSvc.getOneUser(restVO.user_id).user_status == '2'}" var="condition" scope="page" >checked</c:if> > 待審核&nbsp;&nbsp;
               		          	<input type="radio" name="user_status" value="0" <c:if test="${userSvc.getOneUser(restVO.user_id).user_status == '0'}" var="condition" scope="page" >checked</c:if> > 停權 &nbsp;&nbsp;
                    		</div>
                    </div>        

                    <div class="col-lg-6">

                            <div class="col-xs-12 col-sm-4">
                                <div class="form-group">
                                    <label for="name">所在航廈</label>
                                    <select class="form-control" name="rest_ter">
                                    <option <c:if test="${restVO.rest_ter == '1'}" var="condition" scope="page">selected</c:if> value="1">T1</option>
                                    <option <c:if test="${restVO.rest_ter == '2'}" var="condition" scope="page">selected</c:if> value="2">T2</option>
                                    </select>
                                </div>                                
                            </div>
                            <div class="col-xs-12 col-sm-4">
                                <div class="form-group">
                                    <label for="name">所在樓層</label>
                                    <select class="form-control" name="rest_floor">
                                    <option value="-2" <c:if test="${restVO.rest_floor == '-2'}" var="condition" scope="page">selected</c:if> >B2</option>
                                    <option value="-1" <c:if test="${restVO.rest_floor == '-1'}" var="condition" scope="page">selected</c:if> >B1</option>
                                    <option value="1" <c:if test="${restVO.rest_floor == '1'}" var="condition" scope="page">selected</c:if> >1</option>
                                    <option value="2" <c:if test="${restVO.rest_floor == '2'}" var="condition" scope="page">selected</c:if> >2</option>
                                    <option value="3" <c:if test="${restVO.rest_floor == '3'}" var="condition" scope="page">selected</c:if> >3</option>
                                    <option value="4" <c:if test="${restVO.rest_floor == '4'}" var="condition" scope="page">selected</c:if> >4</option>
                                    </select>
                                </div>                               
                            </div>

                            <div class="col-xs-12 col-sm-4">
                                <div class="form-group">
	                            	<label for="name">出入境位置</label>
    	                        	<select class="form-control" name="rest_inout">
  									<option value="1" <c:if test="${restVO.rest_inout == '1'}" var="condition" scope="page">selected</c:if> >出境區</option>
  									<option value="2" <c:if test="${restVO.rest_inout == '2'}" var="condition" scope="page">selected</c:if> >入境區</option>
									</select>                            
                    	    	</div>
                    	    </div><br>

<!--                             <div class="col-xs-12 col-sm-6"> -->
<!--                                 <div class="input-group"> -->
<!--                                     <label class="input-group-addon" >圖資位置x</label> -->
<%--                                     <input type="text" name="rest_lon" id="rest_lon" value="<%= (restVO==null)? "" : restVO.getRest_lon()%>" class="form-control"> --%>
<!--                                 </div>                                 -->
<!--                             </div> -->
<!--                             <div class="col-xs-12 col-sm-6"> -->
<!--                                 <div class="input-group"> -->
<!--                                     <label class="input-group-addon" >圖資位置y</label> -->
<%--                                     <input type="text" name="rest_lat" id="rest_lat" value="<%= (restVO==null)? "" : restVO.getRest_lat()%>" class="form-control"> --%>
<!--                                 </div><br>                                 -->
<!--                             </div> -->

                            <div class="col-xs-12 col-sm-6">
                            	<!-- Trigger the modal with a button -->
								<button type="button" class="btn btn-warning btn-s" data-toggle="modal" data-target="#myModal">平面圖位置</button>
                            </div>   
                            
                    <div class="col-xs-12">
                                                               更新圖片<br>
                        <input type="file" name="upfile1" id="file-input1" class="file" onchange="previewImages()">
                        </label>
                        <div id="preview"></div>                        
                    </div>                            
                            
                            <div class="col-xs-12 col-sm-6">
								<img src="<%= request.getContextPath() %>/back-end/repi/RepiDBGifReader.do?rest_id=<%=restVO.getRest_id()%>" height="300">
                            </div>                            
                            
                            <div class="col-xs-12 col-sm-12">

<!-- 							
							<img src="https://maps.googleapis.com/maps/api/staticmap?center=${restVO.rest_lat},${restVO.rest_lon}&zoom=14&size=400x400&key=AIzaSyBT6zUMx6Q_XFzfy_1JbwmpT6F9Mi2ATOs" width="640" height="400" alt="Google Map">
 -->
           
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
						<input type="hidden" name="rest_id" value="<%=restVO.getRest_id()%>">
						<input type="hidden" name="user_id" value="<%=restVO.getUser_id()%>">
						<input type="hidden" name="rest_trans" value="<%=restVO.getRest_trans()%>">
						<input type="hidden" name="rest_address" value="<%=restVO.getRest_address()%>">
						<input type="hidden" name="rest_lon" value="<%=restVO.getRest_lon()%>">
						<input type="hidden" name="rest_lat" value="<%=restVO.getRest_lat()%>">
						<input type="hidden" name="rest_count" value="<%=restVO.getRest_count()%>">
						<input type="hidden" name="rest_score" value="<%=restVO.getRest_score()%>">
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

<!-- Pick up location on Map -->
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">餐廳位置</h4>
      </div>
      <div class="modal-body">

  <p align="center">
      x=<input type="text" name="rest_lon" id="rest_lon" size="20" value="<%= (restVO==null)? "" : restVO.getRest_lon()%>">
      y=<input type="text" name="rest_lat" id="rest_lat" size="20" value="<%= (restVO==null)? "" : restVO.getRest_lat()%>">
      <button type="button" class="btn btn-primary" data-dismiss="modal">確定</button>
      <button type="reset" value="reset" id="clear" class="btn btn-primary">重設</button><br>

  </p>
  <p align="center">
      <canvas id="myCanvas" width="853" height="911"></canvas>
      <div style="display:none;">
         <img id="source" src="<%= request.getContextPath() %>/front-end/image/T2_3F_template_25per.png">
      </div>
  </p>

<script>

      var canvas = document.getElementById('myCanvas');
      var context = canvas.getContext('2d');
      
      var image = new Image();
      image.src = "<%= request.getContextPath() %>/front-end/image/T2_3F_template_25per.png";
      image.onload = function() {
          context.drawImage(image, 0, 0, 853, 911, 0, 0, 853, 911);

    <% if (restVO.getRest_lon()>0 && restVO.getRest_lat()>0) { %>  
          x=<%=restVO.getRest_lon()%>;
          y=<%=restVO.getRest_lat()%>;
          
          x=x*0.25;
          y=y*0.25;
          
          context.beginPath();
          context.arc(x, y, 20, 0, 2 * Math.PI, false);
          context.lineWidth = 2;
          context.strokeStyle = '#FF0000';
          context.stroke();

          context.beginPath();
          context.moveTo(x,y-30);
          context.lineTo(x,y+30);
          context.lineWidth = 2;
          context.strokeStyle = '#FF0000';
          context.stroke();

          context.moveTo(x-30,y);
          context.lineTo(x+30,y);
          context.stroke();
    <% } %>
      };

      function getMousePos(canvas, evt) {
        var rect = canvas.getBoundingClientRect();
        return {
          x: evt.clientX - rect.left,
          y: evt.clientY - rect.top
        };
      }

//       canvas.addEventListener('mousemove', function(evt) {
//           var mousePos = getMousePos(canvas, evt);
//           var message = 'Mouse position: ' + mousePos.x + ',' + mousePos.y;
//       });          

      canvas.addEventListener('click', function(evt) {

          var mousePos = getMousePos(canvas, evt);
          var context = canvas.getContext('2d');

          document.getElementById("rest_lon").value=4*mousePos.x;
          document.getElementById("rest_lat").value=4*mousePos.y;

          x=mousePos.x;
          y=mousePos.y;

          context.beginPath();
          context.arc(x, y, 20, 0, 2 * Math.PI, false);
          context.lineWidth = 2;
          context.strokeStyle = '#FF0000';
          context.stroke();

          context.beginPath();
          context.moveTo(x,y-30);
          context.lineTo(x,y+30);
          context.lineWidth = 2;
          context.strokeStyle = '#FF0000';
          context.stroke();

          context.moveTo(x-30,y);
          context.lineTo(x+30,y);
          context.stroke();
      });
      
      document.getElementById('clear').addEventListener('click', function() {

          context.drawImage(document.getElementById('source'),
                        0, 0, 853, 911, 0, 0, 853, 911);
          document.getElementById("rest_lon").value=0;
          document.getElementById("rest_lat").value=0;
      }, false);  

</script>




      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">關閉</button>
      </div>
    </div>

  </div>
</div>

<!-- End Pick up location on Map -->






</body>

</html>

<script>
function init(){    
	var speedInput=document.getElementById("speedInput");
    speedInput.onclick=InputText;
}

function InputText(){
    document.getElementById("rest_lon").value="2222";
    document.getElementById("rest_lat").value="520";
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
