<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sysu.model.*"%>
<%
SysuVO sysuVO = (SysuVO) request.getAttribute("sysuVO");
%>

<%@include file="includeHeadForSysu.jsp" %>

        <div id="page-wrapper">

                <ol class="breadcrumb">
                    <li>
                        <a href="#">首頁</a>
                    </li>
                    <li>
                        <a href="#">平台員工管理</a>
                    </li>
                    <li class="active">新增員工</li>
                </ol>


            <FORM METHOD="post" ACTION="<%= request.getContextPath() %>/back-end/sysu/sysu.do" name="form1">

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

      <div class="form-group">
        <label class="col-md-2 control-label">帳號 <span class="asteriskField">*</span> </label>
        <div class="col-md-10  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input  name="sysu_account" id="sysu_account" placeholder="輸入想用的登入帳號" class="form-control"  type="text" value="<%= (sysuVO==null)? "" : sysuVO.getSysu_account()%>">
          </div>
        </div>
      </div><br><br>
      
      <div class="form-group">
        <label class="col-md-2 control-label">E-Mail <span class="asteriskField">*</span> </label>
        <div class="col-md-10  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
            <input name="sysu_email" id="sysu_email" placeholder="輸入E-mail" class="form-control"  type="email" value="<%= (sysuVO==null)? "" : sysuVO.getSysu_email()%>">
          </div>
        </div>
      </div><br><br>

      <div class="form-group">
        <label class="col-md-2 control-label">姓 <span class="asteriskField">*</span> </label>
        <div class="col-md-10  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input  name="sysu_lastname" id="sysu_lastname" placeholder="輸入姓" class="form-control"  type="text" value="<%= (sysuVO==null)? "" : sysuVO.getSysu_lastname()%>">
          </div>
        </div>
      </div><br><br>
      
      <div class="form-group">
        <label class="col-md-2 control-label" >名 <span class="asteriskField">*</span> </label>
        <div class="col-md-10  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input name="sysu_firstname" id="sysu_firstname" placeholder="輸入名" class="form-control"  type="text" value="<%= (sysuVO==null)? "" : sysuVO.getSysu_firstname()%>">
          </div>
        </div>
      </div><br><br>

                    </div>
                    <div class="col-lg-6">                                     
		                <div>
		                                                        職務:
        		             <input type="radio" name="sysu_type" value="1" id="radio1" <c:if test="${sysuVO.sysu_type == '1'}" var="condition" scope="page" >checked</c:if> > 系統管理 &nbsp;&nbsp; 
                		     <input type="radio" name="sysu_type" value="2" id="radio2" <c:if test="${sysuVO.sysu_type == '2'}" var="condition" scope="page" >checked</c:if> > 客服 &nbsp;&nbsp;
                		     <input type="radio" name="sysu_type" value="3" id="radio3" <c:if test="${sysuVO.sysu_type == '3'}" var="condition" scope="page" >checked</c:if> > 營運 &nbsp;&nbsp;
                    	</div><br>
                    		
                    	<div>

                        	<jsp:useBean id="funcSvc" scope="page" class="com.func.model.FuncService" />
                    		員工可用的管理功能: 
                    		<fieldset>
                    		    <% int count=0; %>
	                    		<c:forEach var="funcVO" items="${funcSvc.all}" >
	                    			<%count=count+1; %>
	                    			<input type="checkbox" name="sysu_func" value="${funcVO.func_id}" id="func<%=count%>"> ${funcVO.func_name}<br>
	                    		</c:forEach>
	                    	</fieldset>
	                    		
                    	</div><br>
                    </div>
                                                        
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->
            
            <br>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-1">
                        <input class="btn btn-primary" type="submit" value="送出">
                    </div>
                    <div class="col-xs-12 col-sm-1">
                        <input class="btn btn-primary" type="reset" value="重設">
                    </div>
                    
                    <button type="button" id="speedInput"></button>
                    
                </div>
            </div>

            <input type="hidden" name="action" value="insert">
            <input type="hidden" name="sysu_type" value="1">
            <input type="hidden" name="sysu_status" value="1">

            </form>

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="<%= request.getContextPath() %>/back-end/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%= request.getContextPath() %>/back-end/js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->

<!-- 表單驗證用 --> 
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>

<!-- 表單驗證用 -->
<script type="text/javascript">
 
   $(document).ready(function() {
    $('#reg_form').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            sysu_account: {
                validators: {
                        stringLength: {
                        min: 5,
                        message: '無效的帳號'
                    },
                        notEmpty: {
                        message: '請輸入想用的帳號'
                    }
                }
            },

            sysu_firstname: {
                validators: {
                        stringLength: {
                        min: 1,
                    },
                        notEmpty: {
                        message: '請輸入名'
                    }
                }
            },
            
             sysu_lastname: {
                validators: {
                     stringLength: {
                        min: 1,
                    },
                    notEmpty: {
                        message: '請輸入姓'
                    }
                }
            },           
            
            sysu_email: {
                validators: {
                    notEmpty: {
                        message: '請輸入您的Email'
                    },
                    emailAddress: {
                        message: '請輸入有效的E-mail'
                    }
                }
            },
          
                  
            }
        })
      
        .on('success.form.bv', function(e) {
            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                $('#reg_form').data('bootstrapValidator').resetForm();
 
            // Prevent form submission
            e.preventDefault();
 
            // Get the form instance
            var $form = $(e.target);
 
            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');
 
            // Use Ajax to submit form data
            $.post($form.attr('action'), $form.serialize(), function(result) {
                console.log(result);
            }, 'json');
        });
});
 
 </script>

</body>
</html>


<script>

function init(){    
	var speedInput=document.getElementById("speedInput");
    speedInput.onclick=InputText;
}

function InputText(){
    document.getElementById("sysu_account").value="start";
    document.getElementById("sysu_lastname").value="派";
    document.getElementById("sysu_firstname").value="大星";
    document.getElementById("sysu_email").value="ba102g3iii@gmail.com";
    document.getElementById("radio3").checked = true;
    document.getElementById("func2").checked = true;
    document.getElementById("func3").checked = true;
    document.getElementById("func4").checked = true;
}

window.onload = init;

</script>