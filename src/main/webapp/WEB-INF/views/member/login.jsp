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
     
    
     //회원 로그인 폼 제출
		function submitMember(){
			
				var backpath=document.getElementById('backpath').value;//로그인 뒤 돌아갈 경로
				
				 $.ajax({
			       url: "member_login",
			       type: "POST",
			       data:  $("#m_login").serialize(),
			       success : function(val){
			           if(val ==1 ){//1이면 성공   	    
			           location.href='main';
			           }else if(val==-1){ // -1이면 비밀번호 불일치
			              alert("비밀번호가 일치하지 않습니다. 다시 시도해 주세요.");
			           } else if(val==-2){//-2이면 로그인 뒤 지정 경로로 이동
			           location.href=backpath;
			           }
			        },
			        error : function(){
			           alert("서버통신실패");
			        }
				  });		
		}
     
	 //비회원 로그인 폼 제출     
		function submitNonMember(){
// 		 alert("함수는 들어오긴함");
// 		 var m_name_yet = nm_login.ol_orderer_id.value;
// 		 var ol_order_num_yet = nm_login.ol_order_num.value;
// 		 //공백제거
// 		 var m_name=m_name_yet.replace(' ', '');
// 		 var ol_order_num = ol_order_num_yet.replace(' ', '');
// 		 //공백제거한 값 form에 주입
// 		 nm_login.m_name.value=m_name;
// 		 nm_login.ol_order_num.value=ol_order_num;
			
			 $.ajax({
			       url: "nonmember_login",
			       type: "POST",
			       data:  $("#nm_login").serialize(),
			       success : function(map){
			    	   var val = map.success;
			           if(val == 1){//성공
			        	   location.href='nonmember_ordercheck?orderNum='+map.orderNum;
			           } else {//주문번호 불일치
			        	   alert('주문이 존재하지 않습니다. 이름 또는 주문번호를 다시 확인하세요.'); 
			           }
			        },
			        error : function(){
			           alert("서버통신실패");
			        }
				  });				 
		 
		}    
</script>

<div id="allwrap">
<div id="wrap">


	<jsp:include page="../header.jsp" />

	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">MEMBERSHIP</a></li>
				<li class="last">로그인</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">MEMBERSHIP<span>멤버쉽</span></div>
				<ul>	
					<li><a href="#" id="leftNavi1">로그인</a></li>
					<li><a href="step01" id="leftNavi2">회원가입</a></li>
					<li><a href="#" id="leftNavi3">아이디/<span>비밀번호 찾기</span></a></li>
					<li><a href="#" id="leftNavi4">회원약관</a></li>
					<li><a href="#" id="leftNavi5">개인정보<span>취급방침</span></a></li>
					<li class="last"><a href="#" id="leftNavi6">이메일무단<span>수집거부</span></a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(1,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="member">
					<h2><strong>로그인</strong><span>로그인 후 주문하시면 다양한 혜택을 받으실 수 있습니다.</span></h2>
					<h3>회원 로그인</h3>
					<!-- 회원 로그인 -->
					<form action="member_login" name="m_login" method="post" id="m_login">
						<!-- 같이 보내줄 데이터 -->
						<input type="hidden" id="backpath"  name="backpath" value="${backpath }"><!-- 로그인 후 돌아갈 경로(없을 수도 있음) -->

						<div class="informbox">
							<div class="inform">
								<ul>
									<li><input type="text" name="m_id" class="loginType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='loginType'}else {this.className='mfocusnot'}" style="ime-mode:inactive;" /></li>
									<li><input type="password" name="m_pw" class="passType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='passType'}else {this.className='mfocusnot'}" style="ime-mode:inactive;" /></li>
								</ul>
								
								<div class="btn" style="cursor:pointer" onclick="submitMember()"><a class="sbtn" >로그인</a></div>
								<div class="chk"><input type="checkbox" id="idsave"/><label for="idsave">아이디 저장</label></div>							
	
								<div class="point">
									<p>아이디와 비밀번호를 잊으셨나요?</p>
									<a href="#" class="nbtn">아이디/비밀번호 찾기</a>
								</div>
							</div>
						</div>
					</form>

					<!-- 비회원 주문조회 로그인 -->
					<form action="nonmember_login" name="nm_login" method="post"  id="nm_login" >
					<h3>비회원 주문 조회</h3>
					<div class="informbox">
						<div class="inform">
							<ul>
								<li><input type="text" name="ol_orderer_id" class="ordererType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='ordererType'}else {this.className='mfocusnot'}" /></li>
								<li><input type="text" name="ol_order_num" class="ordernumType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='ordernumType'}else {this.className='mfocusnot'}" /></li>
							</ul>

							<div class="btn" style="cursor:pointer" onclick="submitNonMember()"><a class="gbtn">조회하기</a></div>
							<div class="point">
								<p>아직 JARDIN 회원이 아니신가요? <span>회원가입하시고 다양한 혜택을 받으세요.</span></p>
								<a href="step01" class="nbtn">회원가입</a>
							</div>
						</div>
					</div>
					</form>
					
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