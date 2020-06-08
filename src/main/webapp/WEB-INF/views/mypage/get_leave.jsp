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
	


});
</script>
<style>
.error_msg{
    color: red;
    padding-left: 5px;
}
</style>
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
     });

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
     
     function leave_cancel(){
    	 location.reload();
     }
     
     function leave_submit(){
    	 
    	 if($("input[name=m_id]").val()==""){
    		 $('#id_error').text(' 아이디를 입력하세요.');
    		 return;
    	 } else{
    		 $('#id_error').text('');
    	 }
    	 
    	 
    	 if($("input[name=m_pw]").val()==""){
    		 $('#pw_error').text(' 패스워드를 입력하세요.');
    		 return;
    	 } else {
    		 $('#pw_error').text('');
    	 }
    	 
    	 if($("#m_left_reason").val()==""){
    		 $('#reason_error').text(' 탈퇴 사유를 선택해주세요.');
    		 return;
    	 } else{
    		 $('#reason_error').text('');
    	 }
    	 
    	 if (confirm("정말 탈퇴하시겠습니까? 탈퇴시 모든 개인정보가 삭제되며 포인트, 쿠폰 등 멤버십 혜택은 반환되지 않습니다.") == true){    //확인
    		 $.ajax({
                 type : "POST",
                 url : "leave_success",
                 data: {
              	   m_id : $("input[name=m_id]").val(),
              	   m_pw : $("input[name=m_pw]").val(),
              	   m_left_reason : $("#m_left_reason").val()
                 }, 
                 success : function(val){
                    if(val == 1){ //리턴값이 1이면 (=성공)
                       alert("회원탈퇴가 완료되었습니다.");
                    	location.href="logout";
                    }else{ // 0이면 실패
                    	alert("아이디 혹은 비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
                    }
                 },
                 error : function(){
                    alert("서버통신실패");
                 }
    		});
		 } else {   //취소
		    return;
		 }
     }
     
</script>

<div id="allwrap">
<div id="wrap">

	<div id="header">
		
		<div id="snbBox">
			<h1><img src="user/images/txt/logo.gif" alt="JARDIN SHOP" /></h1>
			<div id="quickmenu">
				<div id="mnaviOpen"><img src="user/images/btn/btn_mnavi.gif" width="33" height="31" alt="메뉴열기" /></div>
				<div id="mnaviClose"><img src="user/images/btn/btn_mnavi_close.gif" width="44" height="43" alt="메뉴닫기" /></div>
				<ul>
					<li><a href="#">EVENT</a></li>
					<li><a href="#">CUSTOMER</a></li>
					<li><a href="#">COMMUNITY</a></li>
				</ul>
			</div>
			<div id="snb">
				<ul>
					<li><a href="#">LOGIN</a></li>
					<li><a href="#">JOIN</a></li>
					<li><a href="#">MY PAGE</a></li>
					<li><a href="#">CART</a></li>
				</ul>

				<div id="search">
					<input type="text" class="searchType" />
					<input type="image" src="user/images/btn/btn_main_search.gif" width="23" height="20" alt="검색하기" />
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="../header.jsp" />

	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">MY PAGE</a></li>
				<li class="last">회원 탈퇴</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title">MY PAGE<span>마이페이지</span></div>
				<ul>	
					<li><a href="#" id="leftNavi1">주문/배송 조회</a></li>
					<li><a href="#" id="leftNavi2">반품/배송 현황</a></li>
					<li><a href="#" id="leftNavi3">장바구니</a></li>
					<li><a href="#" id="leftNavi4">위시리스트</a></li>
					<li><a href="#" id="leftNavi5">나의 쿠폰</a></li>
					<li><a href="#" id="leftNavi6">나의 포인트</a></li>
					<li><a href="#" id="leftNavi7">1:1문의</a></li>
					<li><a href="#" id="leftNavi8">회원정보 수정</a></li>
					<li class="last"><a href="#" id="leftNavi9">회원 탈퇴</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(9,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>회원 탈퇴</strong><span>회원 탈퇴 전 다음의 안내 사항을 꼭 숙지하시기 바랍니다.</span></h2>
					
					<div class="myInfo">
						<ul>
							<li class="info"><strong>가나다</strong> 님의 정보를 한눈에 확인하세요.</li>
							<li>보유 쿠폰<br/><span class="num">199</span> <span class="unit">장</span></li>
							<li class="point">내 포인트<br/><span class="num">100,000</span> <span class="unit">P</span></li>
							<li class="last">진행중인 주문<br/><span class="num">199</span> <span class="unit">건</span></li>
						</ul>
					</div>
					

					<div class="alertBox">
						<p class="chk">탈퇴 전 숙지사항</p>
						<ul>
							<li>그동안 쟈뎅샵을 이용해 주신 고객님께 진심으로 감사드립니다.</li>
							<li>회원 탈퇴 시 포인트와 쿠폰은 즉시 삭제 처리되어 환급되지 않으며, 재가입 하셔도 복구되지 않습니다.</li>
							<li>진행중인 거래(판매 또는 구매)내역이 존재하는 경우 회원 탈퇴가 불가능하며, 거래 종료 후 회원탈퇴 하실 수 있습니다.</li>
						</ul>
					</div>


					<h3 class="dep">회원정보 입력</h3>
					<div class="checkDiv">
						<table summary="반품/교환 분류선택, 기간별, 단어검색별로 주문/배송 조회를 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>주문/배송 조회</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>아이디</span></th>
									<td><input type="text" class="w186" name="m_id" /><span id="id_error" class="error_msg"></span></td>
								</tr>
								<tr>
									<th scope="row"><span>비밀번호</span></th>
									<td><input type="password" class="w186" name="m_pw" /><span id="pw_error" class="error_msg"></span></td>
								</tr>
								<tr>
									<th scope="row"><span>탈퇴사유</span></th>
									<td>
										<select name="m_left_reason" id="m_left_reason">
											<option value="">선택해주세요.</option>
											<option value="아이디 변경/재가입">아이디 변경/재가입</option>
											<option value="이용빈도 낮음">이용빈도 낮음</option>
											<option value="서비스 불만족">서비스 불만족</option>
											<option value="기타">기타</option>
										</select>
                                        <span id="reason_error" class="error_msg"></span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

                    <!-- Btn Area -->
                    <div class="btnArea">
                        <div class="bCenter">
                            <ul>
                                <li><a href="#" class="nbtnbig" onclick="leave_cancel()">취소하기</a></li>
                                <li><a href="#" class="sbtnMini" onclick="leave_submit()">탈퇴하기</a></li>
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