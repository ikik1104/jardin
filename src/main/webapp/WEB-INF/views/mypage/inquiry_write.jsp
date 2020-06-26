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
<!-- <script type="text/javascript" src="user/js/common.js"></script> -->
<script type="text/javascript" src="user/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="user/js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="user/js/jquery.anchor.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="user/js/html5.js"></script>
<script type="text/javascript" src="user/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
$(document).ready(function() {
	
});
</script>
</head>
<body>



<!--익스레이어팝업-->
<div id="ieUser" style="display:none">
	<div class="iewrap">	
		<p class="img"><img src="user/images/ico/ico_alert.gif" alt="알림" /></p>
		<p class="txt">IE버전이 낮아 홈페이지 이용에 불편함이 있으므로 <strong>IE9이상이나 다른 브라우저</strong>를 이용해 주세요. </p>
		<ul>
			<li><a href="http://windows.microsoft.com/ko-kr/internet-explorer/download-ie" target="_blank"><img src="user/images/ico/ico_ie.gif" alt="IE 최신브라우저 다운" ></a></li>
			<li><a href="https://www.google.com/intl/ko/chrome/browser" target="_blank"><img src="user/images/ico/ico_chrome.gif" alt="IE 최신브라우저 다운" ></a></li>
			<li><a href="http://www.mozilla.org/ko/firefox/new" target="_blank"><img src="user/images/ico/ico_mozila.gif" alt="MOZILA 최신브라우저 다운" ></a></li>
			<li><a href="http://www.apple.com/safari" target="_blank"><img src="user/images/ico/ico_safari.gif" alt="SAFARI 최신브라우저 다운" ></a></li>
			<li><a href="http://www.opera.com/ko/o/ie-simple" target="_blank"><img src="user/images/ico/ico_opera.gif" alt="OPERA 최신브라우저 다운" ></a></li>		
		</ul>
		<p class="btn" onclick="msiehide();"><img src="user/images/ico/ico_close.gif" alt="닫기" /></p>
	</div>
</div>
<!--//익스레이어팝업-->
<!--IE 6,7,8 사용자에게 브라우저 업데이터 설명 Div 관련 스크립트-->
 <script type="text/javascript">

     var settimediv = 200000; //지속시간(1000= 1초)
     var msietimer;

     $(document).ready(function () {
         msiecheck();
         
//          $(".sbtnMini").on("click", function(){
//         	 input_inq.submit();
//          });
         
     });
     
     
     var submit = function () {
    	 input_inq.submit();
     }
     

     var msiecheck = function () {
         var browser = navigator.userAgent.toLowerCase();
         if (browser.indexOf('msie 6') != -1 ||
                browser.indexOf('msie 7') != -1 ||
				 browser.indexOf('msie 8') != -1) {
             msieshow();			 
         }
         else {
             msiehide();
         }
     }

     var msieshow = function () {
        $("#ieUser").show();
        msietimer = setTimeout("msiehide()", settimediv);
     }

     var msiehide = function () {
		$("#ieUser").hide();
        clearTimeout(msietimer);
     }
     
    
     
     
     
     
</script>

<div id="allwrap">
<div id="wrap">

	<jsp:include page="../header.jsp" />

	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="main">HOME</a></li>
				<li><a href="#">MY PAGE</a></li>
				<li class="last">1:1문의</li>
			</ol>
		</div>
		
		<div id="outbox">		
            <jsp:include page="common/sub_navi.jsp" />
            <script type="text/javascript">initSubmenu(7,0);</script>

			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>1:1문의</strong><span>쟈뎅에 궁금하신 사항을 남겨주시면 답변해드립니다.</span></h2>
					
					<jsp:include page="common/shortInfo.jsp" />

                    <!-- 입력폼 -->
                    <form action="inquiry_write_regi" method="post" name="input_inq">
    					<div class="checkDiv">
    						<table summary="분류, 제목, 상세내용, 첨부파일 순으로 궁금하신 점을 문의 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
    							<caption>1:1문의</caption>
    							<colgroup>
    							<col width="19%" class="tw30" />
    							<col width="*" />
    							</colgroup>
    							<tbody>
    								<tr>
    									<th scope="row"><span>분류</span></th>
    									<td>
    										<select name="iu_sort">
    											<option value="">선택해주세요.</option>
    											<option value="상품">상품문의</option>
    											<option value="배송">배송문의</option>
    											<option value="교환/반품">교환/반품</option>
    											<option value="주문확인">주문확인</option>
    											<option value="기타">기타</option>
    										</select>
    									</td>
    								</tr>
    								<tr>
    									<th scope="row"><span>제목</span></th>
    									<td>
    										<input type="text" class="wlong" name="iu_title" />
    									</td>
    								</tr>
    								<tr>
    									<th scope="row"><span>상세 내용</span></th>
    									<td>
    										<textarea class="tta" name="iu_content"></textarea>
    									</td>
    								</tr>
    								<tr>
    									<th scope="row"><span>첨부파일</span></th>
    									<td>
    										<input type="file" class="fileType" name="iu_img"/>
                                            <!-- 회원고유번호 hidden -->
                                            <input type="hidden" name="m_num" value="${ userNum }">
    									</td>
    								</tr>
    							</tbody>
    						</table>
    					</div>
                    </form>
                    <!-- //입력폼 -->

					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bCenter">
							<ul>																
								<li><a href="inquiry" onclick="return confirm('1:1문의 작성을 취소하시겠습니까?');" class="nbtnbig">취소</a></li>
								<li><a href="#" class="sbtnMini" onclick="submit()">확인</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
					
				</div>
			</div>
			<!-- //contents -->


		</div>
	</div>
	<!-- //container -->




	<jsp:include page="../footer.jsp" />



</div>
</div>
</body>
</html>