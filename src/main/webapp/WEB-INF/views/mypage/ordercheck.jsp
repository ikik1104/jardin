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
	
// 	$(".hiddenstatus").each(function(){
// 		var status = $(this).val();
//      	substring = "배송완료";
//      	substring2 = "구매확정";
//  		var index = $(this).next(".heavygray").attr('id');
//      	if(status.indexOf(substring) !== -1){
//      		$("#"+index).text("배송완료");	
//      	} else if(status.indexOf(substring2) !== -1) {
//      		$("#"+index).text("구매확정");	
// 		} else {
//      		$("#"+index).text(status);	
//      	}
// 	});
	
	//status
    var innerHtml = "";
	 $(".heavygray").each(function(){
        if($(this).text() == "입금대기"){
        	var index = $(this).attr('id');
        	var ol_order_num = $('#on'+index).text();
        	innerHtml = '<li><a href="#" class="nbtnMini iw83" onclick="wait_cancel(\''+ol_order_num+'\')">취소</a></li>';
        	$('#state'+index).html(innerHtml);
        } 
        if($(this).text() == "배송완료"){
        	var index = $(this).attr('id');
        	var ol_order_num = $('#on'+index).text();
        	console.log(ol_order_num);
        	innerHtml = '<li class="r5"><a href="#" class="obtnMini iw40" onclick="changebtn()">교환</a></li>'
        				+'<li><a href="takeback_deli?ol_order_num='+ol_order_num+'" class="returnbtn nbtnMini iw40 layerpopup">반품</a></li>'
        				+'<li><a href="my_review_alert?ol_order_num='+ol_order_num+'" class="reviewbtn layerpopup" >리뷰작성</a></li>'
        				+'<li><a href="#" class="decidebtn" onclick="buy_decide(\''+ol_order_num+'\')">구매확정</a></li>';
        	$('#state'+index).html(innerHtml);
        } 
        if($(this).text() == "구매확정"){
        	var index = $(this).attr('id');
        	var ol_order_num = $('#on'+index).text();
        	innerHtml = '<li><a href="my_review_list?ol_order_num='+ol_order_num+'" class="reviewbtn layerpopup">리뷰작성</a></li>';
        	$('#state'+index).html(innerHtml);
        } 
        if($(this).text() == "입금완료"){
        	var index = $(this).attr('id');
        	var ol_order_num = $('#on'+index).text();
        	innerHtml = '<li><a href="list_for_refund?ol_order_num='+ol_order_num+'" class="refund_req nbtnMini iw83 layerpopup">취소</a></li>';
        	$('#state'+index).html(innerHtml);
        } 
    });


});

//교환버튼클릭
function changebtn(){
	alert("교환 불가 상품입니다. 자세한 문의사항은 1:1문의 게시판을 이용해주세요.");
}

//배송완료 상태에서 구매확정 버튼 클릭
function buy_decide(ol_order_num){
	if(confirm("구매를 확정하시겠습니까? 구매 확정 후에는 반품, 교환이 불가합니다.")){
 		location.href="decide_buying?ol_order_num="+ol_order_num+"&page=ordercheck";
	}	
}

//입금대기중 - 취소
function wait_cancel(ol_order_num){
	console.log(ol_order_num);
	 if(confirm("주문을 취소하시겠습니까?")){
   	 $.ajax({
   		 type : "POST",
   		 url : "cancel_order",
   		 data : ol_order_num,
   		 contentType : "application/json",
            dataType : "json",
            success : function(val){
           	 if(val == 1){
           		 alert("주문이 취소되었습니다.");
           		 location.reload();
           	 } else{
           		 alert("주문을 취소할 수 없습니다. 관리자에게 문의하세요.");
           	 }
            },
            error : function(){
           	 alert("서버통신실패. 관리자에게 문의하세요.");
            }
   	 });
	 } else {
		 return;
	 };//if confirm
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
				<li><a href="#">MY PAGE</a></li>
				<li class="last">주문/배송 조회</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<jsp:include page="common/sub_navi.jsp" />
            <script type="text/javascript">initSubmenu(1,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>주문/배송 조회</strong><span>회원님이 구매하신 주문내역 및 배송정보를 확인하실 수 있습니다.</span></h2>
					
					<jsp:include page="common/shortInfo.jsp" />

					<h3>주문/배송 조회</h3>
					<div class="checkDiv">
						<table summary="기간별, 상태별, 단어검색별로 주문/배송 조회를 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>주문/배송 조회</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>기간별 검색</span></th>
									<td>
										<ul class="pta">
											<li><input type="text" class="w84" /></li>
											<li><span class="mvalign">&nbsp;~&nbsp;</span></li>
											<li class="r10"><input type="text" class="w84" /></li>
											<li class="rcl4"><a href="#" class="daybtn">오늘</a></li>
											<li class="rc4"><a href="#" class="daybtn">1주일</a></li>
											<li class="rc4"><a href="#" class="daybtn">1개월</a></li>
											<li class="rc4"><a href="#" class="daybtn">6개월</a></li>
											<li class="rc4"><a href="#" class="daybtn">1년</a></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>상태별 검색</span></th>
									<td>
										<select>
											<option value="">선택해주세요.</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>단어 검색</span></th>
									<td>
										<ul class="pta">
											<li class="or10"><input type="text" class="w186" /></li>
											<li><a href="#" class="nbtnMini iw56">검색</a></li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>


					<div class="orderDiv">
                    
                    <c:if test="${ not empty orderlist }">
						<table summary="주문일자/주문번호, 상품명, 가격, 수량, 주문상태 순으로 조회를 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>주문게시판</caption>
							<colgroup>
							<col width="25%" class="tw28" />
							<col width="*" />
							<col width="15%" class="tnone" />
							<col width="18%" class="tw30" />
							</colgroup>
							<thead>
								<th scope="col">주문일자 <span>/ 주문번호</span></th>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격</th>
								<th scope="col">주문상태</th>
							</thead>
							<tbody>
                            
                                <c:forEach var="ol" items="${ orderlist }" varStatus="status">
    								<tr class="parents">
    									<td>
                                            <fmt:formatDate value="${ ol.ODATE }" pattern="yyyy-MM-dd" var="dateType" />
    										<p class="day">${ dateType }</p>
    										<a href="my_order_statement?ol_order_num=${ ol.ONUM }"><p class="orderNum" id="on${ status.index }">${ ol.ONUM }</p></a>
    									</td>
    									<td class="left">
    										${ ol.P_NAME }
    									</td>
    									<td class="tnone">${ ol.OSUM } 원</td>
    									<td>
                                            <input type="hidden" class="hiddenstatus" id="status${ status.index }" value="${ ol.OSTATUS }"/>
    										<span class="heavygray" id="${ status.index }">${ ol.OSTATUS }</span>
    										<ul class="state" id="state${ status.index }"></ul>										
    									</td>
    								</tr>
								</c:forEach>
                                
                              
                                
							</tbody>
						</table>
                    </c:if>
                    <c:if test="${ empty orderlist }">    
						<div class="noData">
							등록된 상품이 없습니다.
						</div>
                    </c:if>
					</div>
					

					<div class="btnAreaList">
						<!-- 페이징이동1 -->
						<div class="allPageMoving1">
							<a href="ordercheck?page=1" class="n"><img src="user/images/btn/btn_pre2.gif" alt="처음으로"/></a>
							<c:if test="${ paging.getPage()<=1 }">
								<img src="user/images/btn/btn_pre1.gif" alt="앞페이지로"/>
							</c:if>
							<c:if test="${ paging.getPage()>1 }">
								<a href="ordercheck?page=${ paging.getPage() - 1 }" class="pre"><img src="user/images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
							</c:if>
							<c:forEach var="num" begin="${ paging.getStartPage() }" end="${ paging.getEndPage() }" step="1">
								<c:choose>
									<c:when test="${ num == paging.getPage() }">
										<strong>${ num }</strong>
									</c:when>
									<c:when test="${ num != paging.getPage() }">
										<a href="ordercheck?page=${ num }">${ num }</a>
									</c:when>
								</c:choose>
							</c:forEach>
							
							<c:if test="${ paging.getPage()>= paging.getLastPage() }">
								<img src="user/images/btn/btn_next1.gif" alt="뒤페이지로"/>
							</c:if>
							<c:if test="${ paging.getPage() < paging.getLastPage() }">
								<a href="ordercheck?page=${ paging.getPage() + 1 }" class="next"><img src="user/images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
							</c:if>
							<a href="ordercheck?page=${ paging.getLastPage() }" class="n"><img src="user/images/btn/btn_next2.gif" alt="마지막페이지로"/></a>
						</div>
						<!-- //페이징이동1 -->
					</div>




<script type="text/javascript" src="user/js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="user/css/jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
$(function(){

	function distance(){
		var winWidth = $(window).width();
		if(winWidth > 767){
			$(".productList ul li:nth-child(4n+4)").css("padding","0 0 0 0");
		}else{
			$(".productList ul li:nth-child(4n+4)").css("padding","0 10px");
		}
	}
	distance();
	$(window).resize(function(){distance();});

	// layer popup
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 760;
	}else{
		var layerCheck = 320;
	}

// 	$(".iw40").fancybox.center();

	$(".layerpopup").fancybox({
		'centerOnScroll' : true,
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
	$(".layerpopup2").fancybox({
		'centerOnScroll' : true,
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
			<!-- //contents -->


		</div>
	</div>
	<!-- //container -->




	<jsp:include page="../footer.jsp" />



</div>
</div>
</body>
</html>