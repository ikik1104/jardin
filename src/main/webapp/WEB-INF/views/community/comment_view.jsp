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
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="user/js/html5.js"></script>
<script type="text/javascript" src="user/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
$(document).ready(function() {
	


});

function delReview(ru_num) {
	if(confirm("해당 상품평을 삭제하시겠습니까?")){
		 $.ajax({
             url : "delReview",
             method : "POST",
             data: JSON.stringify(ru_num),
             dataType : "json",
             contentType: "application/json",
             success : function(val){
                if(val == 1){ //리턴값이 1이면 (=성공)
                   alert("삭제되었습니다.");
                   location.href="review_list?page=${page}&ru_type=${dto.RU_TYPE}";
                }else{ // 0이면 실패
                   alert("삭제 실패");
                }
             },
             error : function(){
                alert("서버통신실패");
             }
          });
	}
}

function updateReview(ru_num) {
	var url = "updateReviewForm?ru_num="+ru_num;
    var name = "updateReview";
    var option = "width = 500, height = 500, top = 100, left = 200, location = no";
    window.open(url, name, option);
	
}
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
         
         
         if(${dto.RU_TYPE eq '포토'}){
        	 $("#photo").attr("class", "on");
         }else{
        	 $("#basic").attr("class", "on");
         }
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
</script>

<div id="allwrap">
<div id="wrap">

	<jsp:include page="../header.jsp" />

	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">COMMUNITY</a></li>
				<li class="last">사용 후기</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">COMMUNITY<span>커뮤니티</span></div>
				<ul>	
					<li><a href="#" id="leftNavi1">체험단</a></li>
					<li><a href="#" id="leftNavi2">사용 후기</a></li>
					<li class="last"><a href="#" id="leftNavi3">ENJOY COFFEE</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(2,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>사용 후기</strong><span>쟈뎅 제품을 구매하신 회원님들의 소중한 후기입니다.</span></h2>
					
					<div class="productTab normaltab">
						<ul>
							<li><a href="review_list?ru_type='포토'" id="photo">포토 구매후기</a></li>
							<li class="last"><a href="review_list?ru_type='일반'" id="basic">상품평</a></li>
						</ul>						
					</div>

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
									<li>작성자<span>${dto.M_ID}</span></li>
									<li class="tnone">등록일<span><fmt:formatDate value="${dto.RU_DATE}" pattern="yy-MM-dd"/></span></li>
									<li class="tnone">조회수<span>${dto.RU_HIT}</span></li>
									<li class="last">평점
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

						<div class="viewContents">
							${dto.RU_CONTENT}
						</div>
					</div>


					<c:if test="${not empty dto.RA_NUM}">
						<!-- 답변 -->
						<div class="answer">
							<div class="inbox">
								<div class="aname">
									<p>담당자 <span>[ <fmt:formatDate value="${dto.RA_DATE}" pattern="yy-MM-dd"/> ]</span></p>
								</div>
	
								<div class="atxt">
									${dto.RA_CONTENT}
								</div>
							</div>
						</div>
					</c:if>
					<!-- //답변 -->


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
                                    
                                    <c:if test="${ empty next_title }">
                                        <td>이전 글이 없습니다.</td>
                                        <td>&nbsp;</td>
                                    </c:if>
                                    <c:if test="${ not empty next_title }">
                                        <td><a href="review_detail?ru_type=${ next_title.ru_type }&ru_num=${ next_title.ru_num }&rownum=${ rownum+1 }">${ next_title.ru_title }</a></td>
                                        <td>
                                        </td>
                                    </c:if>
								</tr>

								<tr>
									<th class="next">NEXT</th>
                                    <c:if test="${ empty pre_title }">
                                        <td>다음 글이 없습니다.</td>
                                    </c:if>
                                    <c:if test="${ not empty pre_title }">
                                        <td><a href="review_detail?ru_type=${ pre_title.ru_type }&ru_num=${ pre_title.ru_num }&rownum=${ rownum-1 }">${ pre_title.ru_title }</a></td>
                                        <td>
                                        </td>
                                    </c:if>
								</tr>
                                
							</tbody>
						</table>
					</div>
					<!-- //이전다음글 -->


					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bRight">
							<ul>
							<c:if test="${dto.M_NUM == userNum}">
								<li><a href="updateReview('${dto.RU_NUM}')" class="nbtnbig mw">수정</a></li>
								<li><a onclick="delReview('${dto.RU_NUM}')" class="nbtnbig mw">삭제</a></li>
							</c:if>
								<li><a href="review_list?page=${page}&ru_type=${dto.RU_TYPE}" class="sbtnMini mw">목록</a></li>
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