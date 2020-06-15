<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title> JARDIN SHOP </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="user/css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="user/css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="user/css/content.css?v=Y" />
<script type="text/javascript" src="user/js/jquery.min.js"></script>
<script type="text/javascript" src="user/js/top_navi.js"></script>
<script type="text/javascript" src="user/js/left_navi.js"></script>
<script type="text/javascript" src="user/js/main.js"></script>
<script type="text/javascript" src="user/js/common.js"></script>
<script type="text/javascript" src="user/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="user/js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="user/js/jquery.anchor.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="user/js/html5.js"></script>
<script type="text/javascript" src="user/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">




$(document).ready(function() {
   	//확인 클릭
	$("#rt_rf_check").click(function(){
		parent.location.href="takeback_state";
  		parent.$.fancybox.close();
	});

	//취소버튼 클릭
	$(".nbtnbig").click(function(){
		parent.location.href="ordercheck";
		parent.$.fancybox.close();
	});
});


</script>
<style type="text/css">
body{
background : white;
}
h1{
font-size : 20px;
line-height: 1.3;
}
</style>
</head>
<body>



<div id="layerWrap">

<div class="inputWrap">
        
    <div class="inputBody">

        <h1>결제 취소가 완료되었습니다.</h1>

        <!-- Btn Area -->
        <div class="btnArea">
            <div class="bCenter">
                <ul>
                    <li><a href="#" class="sbtnMini" id="rt_rf_check">반품/환불 조회</a></li>
                    <li><a href="#" class="nbtnbig">닫기</a></li>
                </ul>
            </div>
        </div>
        <!-- //Btn Area -->

</div>

</div>


</div>









</body>
</html>