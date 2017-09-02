<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%	
	pageContext.removeAttribute("list");
	ProdService prodSvc = new ProdService();
	List<ProdVO> list = prodSvc.getAll();
    pageContext.setAttribute("list",list);
    
    
    
%>



<!DOCTYPE html>
<html lang="en" class="easy-sidebar-active">

<head>

     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>商品</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/front-end/css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/front-end/css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath()%>/front-end/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .item img{
            height: 250px;
            width:100%;
            
        }
       
        .content: {
          position: relative;
        }
        .box{
          width: 110px;
          height: 50px;
          
          position: fixed;
          top: 52px;
          left: 5px;
          margin: auto;
        }
    </style>
</head>

<body>
 
    <%@include file="headerBar.file" %>

        

<div class="container">
    <div class="row">
        <div class="callout"></div>
        <div class="col-md-11 col-xs-12" >
            <h3>商品瀏覽</h3>
        </div>         
    </div>
</div>
    </div>
    <header id="myCarousel top" class="carousel slide">
       <div class="container">
                <div class="row carousel-holder">
    
                    <div class="col-md-12">
                    <div class="row">
                         <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                         <!--    <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol> -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="<%=request.getContextPath()%>/front-end/img/slidebg09.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="<%=request.getContextPath()%>/front-end/img/slidebg08.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="<%=request.getContextPath()%>/front-end/img/slidebg07.jpg" alt="">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div> 
                    </div>
                </div>
    </div>
    </header>
   
   <div class="hero-text">
            <h1 >Anytime login, anytime Grip</h1>
            <p>Enjoy your life with our service </p>
            <button class="btn btn-lg btn-dark">Check Out Now!</button>
    </div>

    <!-- Callout間隔區 -->
    <div class="callout"></div>

     
    <!-- Portfolio -->
<!-- Portfolio Grid Section -->
<div class="container content">
        
        <div class="row">
        <header  class="header">
        <div class="text-vertical-center">
            <h1>Anytime Grip</h1>
            <h3>SHOP OUR COLLECTIONS &amp; SHOP WITH RUNWAY</h3>
            <br>
            <a href="#about" class="btn btn-dark btn-lg">Grip Now!!</a>
        </div>
       </header> 
</div>
</div>
        
 <div class="container">	
	<div class="row ">         
            
       
        
          <ol class="breadcrumb">
               <li>
                   <a href="../index.html">首頁</a>
               </li>
               <li class="active">所有商品</a>
               </li>
               
           </ol>
        
        <ul class="nav nav-tabs">
<!--                             <div class="dropdown"> -->
<!--                               <a href="#" class="dropdown-toggle" data-toggle="dropdown">商品種類 <b class="caret"></b></a> -->
<!--                               <ul class="dropdown-menu"> -->
<!--                                 <li><a href="#">零食、點心</a></li> -->
<!--                                 <li><a href="#">免稅菸酒</a></li> -->
<!--                                 <li><a href="#">國際精品</a></li> -->
<!--                               </ul> -->
<!--                             </div> -->
                             <li><a href="<%=request.getContextPath()%>/front-end/prod/prod.do?store_ter=1&action=getOneStoreTer_For_Display"><i class="fa fa-arrow-circle-o-up"></i>第一航廈</a></li>
                             <li><a href="<%=request.getContextPath()%>/front-end/prod/prod.do?store_ter=2&action=getOneStoreTer_For_Display"><i class="fa fa-arrow-circle-o-up"></i>第二航廈</a></li>
                            <li><a href="<%=request.getContextPath()%>/front-end/prod/prod.do?prod_sort=伴手禮&action=getOneSort_For_Display"><i class="fa fa-arrow-circle-o-up"></i>伴手禮</a></li>
                            <li><a href="<%=request.getContextPath()%>/front-end/prod/prod.do?prod_sort=酒類&action=getOneSort_For_Display"><i class="fa fa-arrow-circle-o-up"></i>酒類</a></li>
							<li><a href="<%=request.getContextPath()%>/front-end/prod/prod.do?prod_sort=文具用品&action=getOneSort_For_Display"><i class="fa fa-arrow-circle-o-up"></i>文具用品</a></li>   
                            <li><a href="<%=request.getContextPath()%>/front-end/prod/prod.do?prod_sort=生活用品&action=getOneSort_For_Display"><i class="fa fa-arrow-circle-o-up"></i>生活用品</a></li>
                             <li><a href="<%=request.getContextPath()%>/front-end/prod/prod.do?prod_sort=化妝品&action=getOneSort_For_Display"><i class="fa fa-arrow-circle-o-up"></i>化妝品</a></li>
                              <li><a href="<%=request.getContextPath()%>/front-end/prod/prod.do?prod_sort=精品&action=getOneSort_For_Display"><i class="fa fa-arrow-circle-o-up"></i>精品</a></li>
                            

                           
         </ul>


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


		<%@ include file="page1.file"%>
	



	
	<c:forEach var="prodVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<div class="col-xs-12 col-md-4">
              
                <div class="item">
                <td><img src="<%=request.getContextPath()%>/front-end/prod/DBGifReader?prod_id=${prodVO.prod_id}" width="300" height="250"></td>
				<h4><td><a href="#">${prodVO.prod_name}</td></a></h4>
				<h4><td>$${prodVO.prod_price}</td></h4>
				<h4><td>${prodVO.prod_sort}</td></h4>
				
				 <div><a href="<%=request.getContextPath()%>/front-end/prod/prod.do?prod_id=${prodVO.prod_id}&action=getOne_For_Display">瀏覽詳情</a>
                   </div>         
<!-- 				 <div> -->
<%-- 				     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/prod/prod.do" > --%>
<!-- 				       <input type="submit" value="瀏覽詳情"> -->
<%-- 				       <input type="hidden" name="prod_id" value="${prodVO.prod_id}"> --%>
<!-- 				       <input type="hidden" name="action" value="getOne_For_Display"> -->
<!-- 				     </FORM> -->
<!--  				</div> -->
			
		</div>
        </div>
	</c:forEach>
	</div>
</div>
	<div class="col-xs-12 col-md-8 col-md-offset-4">
		<%@ include file="page2.file" %>
	</div>
	
<!-- 登入模組 開始-->
	<div class="modal fade" id="modal-login">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">會員登入</h4>
				</div>
				<div class="modal-body">
					<div class="container">
						<div class="row">
							<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
							
								<form action="<%=request.getContextPath()%>/front-end/UserLoginHandler" method="POST" id="loginForm">
									<div class="form-group">
										<label for="name">帳號</label> <input type="text"
											class="form-control" name="account" id="name"
											placeholder="請輸入您的帳號">
									</div>
									<div class="form-group">
										<label for="pw">密碼</label> <input type="password"
											class="form-control" name="password" id="pw" placeholder="請輸入您的密碼">
									</div>
									
									<input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑-->

								</form>
								
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button id="login" type="button" class="btn btn-primary">登入</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modal-sign-in">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">新生註冊</h4>
				</div>
				<div class="modal-body">註冊表單</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary">註冊</button>
				</div>
			</div>
		</div>
	</div>
<!-- 登入模組 結束-->
	
 <a id="to-top" href="#top" class="btn btn-dark btn-lg"><i class="fa fa-chevron-up fa-fw fa-1x"></i></a>
 
    <!-- jQuery -->
<script src="<%=request.getContextPath()%>/front-end/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
<script src="<%=request.getContextPath()%>/front-end/js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
   
<script src="<%=request.getContextPath()%>/front-end/js/jquery-1.11.0.min.js"></script> 

<script>
//easy-sidebar-toggle-right
$('.easy-sidebar-toggle').click(function(e) {
e.preventDefault();
//$('body').toggleClass('toggled-right');
$('body').toggleClass('toggled');
//$('.navbar.easy-sidebar-right').removeClass('toggled-right');
$('.navbar.easy-sidebar').removeClass('toggled');
});
</script>
     <!-- Menu Toggle Script -->
   <script>
    // Closes the sidebar menu
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
    // Opens the sidebar menu
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
    // Scrolls to the selected menu item on the page
    $(function() {
        $('a[href*=#]:not([href=#],[data-toggle],[data-target],[data-slide])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
    //#to-top button appears after scrolling
    var fixed = false;
    $(document).scroll(function() {
        if ($(this).scrollTop() > 250) {
            if (!fixed) {
                fixed = true;
                // $('#to-top').css({position:'fixed', display:'block'});
                $('#to-top').show("slow", function() {
                    $('#to-top').css({
                        position: 'fixed',
                        display: 'block'
                    });
                });
            }
        } else {
            if (fixed) {
                fixed = false;
                $('#to-top').hide("slow", function() {
                    $('#to-top').css({
                        display: 'none'
                    });
                });
            }
        }
    });
    // Disable Google Maps scrolling
    // See http://stackoverflow.com/a/25904582/1607849
    // Disable scroll zooming and bind back the click event
    var onMapMouseleaveHandler = function(event) {
        var that = $(this);
        that.on('click', onMapClickHandler);
        that.off('mouseleave', onMapMouseleaveHandler);
        that.find('iframe').css("pointer-events", "none");
    }
    var onMapClickHandler = function(event) {
            var that = $(this);
            // Disable the click handler until the user leaves the map area
            that.off('click', onMapClickHandler);
            // Enable scrolling zoom
            that.find('iframe').css("pointer-events", "auto");
            // Handle the mouse leave event
            that.on('mouseleave', onMapMouseleaveHandler);
        }
        // Enable map zooming with mouse scroll when the user clicks the map
    $('.map').on('click', onMapClickHandler);
    </script>
    <!--購物_數量選擇 -->
<script type="text/javascript">
  $(document).on('click', '.number-spinner button', function () {    
  var btn = $(this),
    oldValue = btn.closest('.number-spinner').find('input').val().trim(),
    newVal = 0;
  
  if (btn.attr('data-dir') == 'up') {
    newVal = parseInt(oldValue) + 1;
  } else {
    if (oldValue > 1) {
      newVal = parseInt(oldValue) - 1;
    } else {
      newVal = 1;
    }
  }
  btn.closest('.number-spinner').find('input').val(newVal);
});
</script>

<script>
//登入模組        
	var $userName = $("#account");
	var $password = $("#password");
	$("#login").click(function() {
		$.ajax({
			url : '<%=request.getContextPath()%>/front-end/UserLoginHandler',
			data : {
				name : $userName.val(),
				password : $password.val()
			},
			type : 'POST',
			error : function(xhr) {
				alert('Ajax request 發生錯誤');
			},
			success : function(result) {
				if (result == '帳號不存在') {
					console.log("帳號或密碼有錯");
				} else {
					console.log("123456");
					$("#loginForm").submit();
				}
			}
		});
	});

    </script>	
</body>
</html>
