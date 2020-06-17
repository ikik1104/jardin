<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html >
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
	
//비밀번호 체크하고 돌아왔을 때
if(${checkflag==1} && ${checkMode=='update'}){//나의 댓글 수정할 때
	$('#modifyReply').show();
	$('#originalReply').hide();	
	$('#pwReply').hide();	
} else if(${checkflag==1} && ${checkMode=='select'}){//나의 댓글 조회할 때
	$('#modifyReply').hide();
	$('#originalReply').show();	
	$('#pwReply').hide();	
}else {
	$('#modifyReply').hide();
	$('#originalReply').hide();	
}

$('#backbody').click(function(){
	$('#layerWrap').css('display','none');	
	$('#backbody').css('display','none');		
});
});

//댓글 수정창 나타내기
function showModify(){
	$('#modifyReply').show();	
	$('#originalReply').hide();		
}
</script>
<!-- 비밀번호 모달창 스타일 -->
<style>
   /* The Modal (background) */
        #layerWrap {/*.modal*/
        	margin:auto auto;
            display: none; /* Hidden by default */
            position: fixed; 
            z-index: 2; /* Sit on top */
            left: 780px;
            top: 250px;
            width: auto; /* Full width 100%*/
            height: auto; /* Full height 100%*/
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
		#backbody{
			display:none;
			width:100%; height:100%;
			position:fixed;
            z-index: 1; /* Sit on top */		
             background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */           
		}

</style>
<!-- 비밀번호 모달창 스크립트 -->
<script type="text/javascript">
                            
function openPW(m_num, mode){
	$('#layerWrap').css('display','block');
	$('#backbody').css('display','block');	
	document.getElementById('hiddenNum').value=m_num;
	document.getElementById('checkMode').value=mode;	
}
function closePW(){
	$('#layerWrap').css('display','none');	
	$('#backbody').css('display','none');	
}
window.onload=function(){
	${alerttext}
}
//비밀번호 불일치 시 실행
function backpage(ec_pw){
	$('#layerWrap').css('display','block');
	$('#backbody').css('display','block');		
	$( 'input#ec_pw' ).val( ec_pw );
}

</script>
</head>
<body>
<div  id="backbody"></div>


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
 
		//비밀번호 체크
		
		function submitCheck(){
			ec_pw_check.submit();
		
		}     
     
</script>



<div id="allwrap">
<div id="wrap">
<!-- 비밀번호 모달창 -->
<div id="layerWrap">

	<div class="inputWrap">
		<form action="ec_pw_check" name="ec_pw_check" method="post">
		<div class="inputBody">
			<div class="title">비밀번호 확인</div>
			<p class="close" style="cursor:pointer;"><a onclick="closePW()" ><img src="user/images/btn/btn_input_close.gif" alt="닫기" /></a></p>
			<!-- <p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;"><img src="user/images/btn/btn_input_close.gif" alt="닫기" /></a></p> -->
			<p class="popalert">비밀번호를 입력해주세요.</p>
			<input type="hidden" id="hiddenNum" name="m_num">
			<div class="inputBox">					
				<ul>
					<li><label for="">비밀번호</label><input type="password" class="w348" name="ec_pw" id="ec_pw"/></li>
				</ul>
			</div>
			<div class="centerbrn">
				<a href="#" onclick="submitCheck()">확인</a>
			</div>
		</div>
		<input type="hidden" value="${event_info.eventdto.e_num } " name="e_num">
		<input type="hidden" id="checkMode" name="checkMode">
		</form>	
	</div>


</div>	
<!-- 비밀번호 모달창 -->    

	<jsp:include page="../header.jsp" />

	<!-- container -->
	<div id="container">


		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">EVENT</a></li>
				<li class="last">진행중 이벤트</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">EVENT<span>이벤트</span></div>
				<ul>	
					<li><a href="#" id="leftNavi1">진행중 이벤트</a></li>
					<li><a href="#" id="leftNavi2">종료된 이벤트</a></li>
					<li class="last"><a href="#" id="leftNavi3"><span>당첨자 발표</span></a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(1,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>진행중 이벤트</strong><span>쟈뎅샵의 특별한 혜택이 가득한 이벤트에 참여해 보세요.</span></h2>
					
					<div class="viewDivMt">
						<div class="viewHead">
							<div class="subject">
								<ul>
									<li>${event_info.eventdto.e_title }</li>
								</ul>
							</div>
							<div class="day">
								<p class="txt">이벤트 기간<span>${event_info.utildto.str1 } ~ ${event_info.utildto.str2 }</span></p>
							</div>
						</div>

						<div class="viewContents">
							<img src="tempUpload/${event_info.eventdto.e_content_img }" alt="" />
						</div>
					</div>


					<!-- 이전다음글 -->
					<div class="pnDiv web">
						<table summary="이전다음글을 선택하여 보실 수 있습니다." class="preNext" border="1" cellspacing="0">
							<caption>이전다음글</caption>
							<colgroup>
							<col width="100px" />
							<col width="*" />
							<col width="100px" />
							</colgroup>
							<tbody>
								<tr>
									<th class="pre">PREV</th>
									<td><a href="#">상품 재입고는 언제 되나요?</a></td>
									<td>&nbsp;</td>
								</tr>

								<tr>
									<th class="next">NEXT</th>
									<td>다음 글이 없습니다.</td>
									<td>&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //이전다음글 -->


					<!-- 댓글-->
					<form action="ecomment_insert" method="post" name="ecomment_insert" >
					<div class="replyWrite">
						<ul>
							<li class="in">
								<p class="txt">총 <span class="orange">${event_info.utildto.str4 }</span> 개의 댓글이 달려있습니다.</p>
								<p class="password">비밀번호&nbsp;&nbsp;<input type="password" class="replynum" name="ec_pw"/></p>
								<textarea class="replyType" name="ec_content"></textarea>
							</li>
							<li class="btn"><a class="replyBtn" onclick="submitWrite()">등록</a></li>
						</ul>
						<p class="ntic">※ 비밀번호를 입력하시면 댓글이 비밀글로 등록 됩니다.</p>
					</div>
					</form>
					
					<div class="replyBox">
							<c:if test="${ecomment_list.size()==0 }"><!-- 등록된 댓글 없을 경우 -->
									<ul>
										<li class="name">등록된 댓글이 없습니다.</li>
									</ul>									
							</c:if>
							<c:if test="${ecomment_list.size()!=0 }"><!-- 등록된 댓글 있을 경우 -->
								
							
							
								<!-- 사용자 댓글 맨 위에 출력 -->
								<c:forEach var="ecomment_list" items="${ecomment_list }">		
									<c:if test="${ecomment_list.memberdto.m_id==userID }">
									
									
										<ul id="originalReply">
											<li class="name">${ecomment_list.memberdto.m_id }(나의 댓글) <span>[${ecomment_list.utildto.str1 }&nbsp;&nbsp;${ecomment_list.utildto.str2 }]</span></li>
											<li class="txt">${ecomment_list.e_commentdto.ec_content }</li>
											<li class="btn">
												<a class="rebtn" onclick="showModify()">수정</a>
												<a href="#" class="rebtn">삭제</a>
											</li>
										</ul>		
	
										<ul id="pwReply">
											<li class="name">${ecomment_list.memberdto.m_id }(나의 댓글) <span>[${ecomment_list.utildto.str1 }&nbsp;&nbsp;${ecomment_list.utildto.str2 }]</span></li>
											<li class="txt" onclick="openPW(${ecomment_list.e_commentdto.m_num }, select)">※비밀 댓글입니다.</li>
											<li class="btn">
												<a class="rebtn" onclick="openPW(${ecomment_list.e_commentdto.m_num }, update)">수정</a>
												<a href="#" class="rebtn">삭제</a>
											</li>
										</ul>		
										
										<ul id="modifyReply">
											<li class="name">${ecomment_list.memberdto.m_id } <span>[${ecomment_list.utildto.str1 }&nbsp;&nbsp;${ecomment_list.utildto.str2 }]</span></li>
											<li class="txt"><textarea class="replyType">${ecomment_list.e_commentdto.ec_content }</textarea></li>
											<li><p class="password">비밀번호&nbsp;&nbsp;<input type="password" name="ec_pw_modify"/></p></li>
											<li class="btn">
												<a href="#" class="rebtn">수정</a>
												<a href="#" class="rebtn">삭제</a>
											</li>
										</ul>									
									</c:if>
								</c:forEach>
		
								<!-- 사용자 댓글 아닌 거 출력 -->
								<c:forEach var="ecomment_list" items="${ecomment_list }">		
									<c:if test="${ecomment_list.memberdto.m_id!=userID }">
										<ul>
											<li class="name">${ecomment_list.memberdto.m_id } <span>[${ecomment_list.utildto.str1 }&nbsp;&nbsp;${ecomment_list.utildto.str2 }]</span></li>
											<li class="txt">${ecomment_list.e_commentdto.ec_content }</li>
										</ul>									
									</c:if>							
								</c:forEach>		
		
														
							</c:if>
					

																	
					</div>
					<!-- //댓글 -->


					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bRight">
							<ul>
								<li><a href="#" class="sbtnMini mw">목록</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
					
				</div>
			</div>
			<!-- //contents -->
			

			    


<script type="text/javascript" src="user/js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="user/css/jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
$(function(){
	
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 540;
	}else{
		var layerCheck = 320;
	}

	$(".passwordBtn").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : layerCheck,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			});
		}
	});


});
</script>

		</div>
	</div>
	<!-- //container -->




	<jsp:include page="../footer.jsp" />



</div>
</div>
</body>
</html>