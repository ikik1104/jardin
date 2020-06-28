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
	
	//유효성검사
	
	//포토등록버튼
	$(".photo_btn").click(function(){
		photo_rv_insert.submit();
	});
	//일반등록버튼
	$(".normal_btn").click(function(){
		var orderNum = $(".normal_btn").attr('id');
		console.log(typeof orderNum);
		console.log(orderNum);
		normal_rv_insert.submit();
	});
	
});
</script>
<style>
.tempmargin{ margin-left: 20px !important;}
.viewContents{ margin-bottom: 20px;}
</style>
</head>
<body>


<div id="layerWrap">

<div class="inputWrap">
		
	<div class="inputBody">
		<div class="title">사용 후기</div>
		<p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;"><img src="user/images/btn/btn_input_close.gif" alt="닫기" /></a></p>

		<!-- contents -->
			<div id="contents">
			
			<div class="viewDivTab">
						<div class="viewHead">
							<div class="subject">
								<ul>
									<li>&nbsp;${dto.RU_TITLE}</li>
								</ul>
							</div>
							<div class="day">
								<p class="txt">제품명<span>${dto.P_NAME}</span></p>
							</div>
							<div class="data">
								<ul>
<!-- 									<li>작성자<span></span></li> -->
									<li class="tnone">등록일<span><fmt:formatDate value="${dto.RU_DATE}" pattern="yy-MM-dd"/></span></li>
									<li class="tnone">조회수<span>${dto.RU_HIT}</span></li>
									<li class="last tempmargin">평점
										<span>
										<c:forEach begin="1" end="${dto.RU_SCORE}">
											<img src="user/images/ico/ico_star.gif" alt="별점" />
										</c:forEach>
										<c:forEach begin="1" end="${5-dto.RU_SCORE}">
											<img src="user/images/ico/ico_star_off.gif" alt="별점" />
										</c:forEach>
										</span>
									</li>
								</ul>
							</div>
						</div>

						<div class="viewContents" style="text-align: left;">
							<c:if test="${not empty dto.RU_IMG}">
								<img src="${dto.RU_IMG}">
							</c:if>
							<div style="white-space:pre;"><c:out value="${dto.RU_CONTENT}" /></div>
						</div>
					</div>
			
			
			
			</div>
			<!-- //contents -->
		
        
	</div>

</div>


</div>




</body>
</html>