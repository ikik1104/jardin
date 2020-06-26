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
.inputBody .title{width: 100%;
    height: 35px;
    border-bottom: 1px #7e6326 solid;
    font-size: 26px;
    font-weight: 600;
    color: #3a362f;}
#member h3{margin-top:0}
.checkTable th {text-align: center;}
.checkTable th span{padding: 0px;}
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
				<li class="last">주문/배송 조회</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<jsp:include page="common/sub_navi.jsp" />


			<!-- contents -->
			<div id="contents">
                <div id="mypage">
                <h2><strong>주문/배송 조회</strong><span>회원님이 구매하신 주문내역 및 배송정보를 확인하실 수 있습니다.</span></h2>
                    
                <jsp:include page="common/shortInfo.jsp" />


                <div class="inputBody">
                    <div class="title">주문 상세내역</div>
            
                    <div id="member">
                        <h3 class="dep subt">주문 상품 정보</h3>
                        <div class="orderDivNm">
                            <c:if test="${ not empty plist }">  
                            <table summary="주문 상품 정보 게시판으로 주문하신 상품명, 수량, 판매가, 배송순으로 조회 하시고 쿠폰을 적용하실 수 있습니다." class="orderTable" border="1" cellspacing="0">
                                <caption>주문 상품 정보</caption>
                                <colgroup>
                                <col width="*" />
                                <col width="8%" class="pnone" />
                                <col width="13%" class="pnone" />
                                <col width="13%" class="pnone" />
                                <col width="13%" class="pnone" />
                                </colgroup>
                                <thead>
                                    <th scope="col">상품명</th>
                                    <th scope="col" class="pnone">수량</th>
                                    <th scope="col" class="pnone">판매가</th>
                                    <th scope="col" class="pnone">할인가</th>
                                    <th scope="col" class="pnone">상태</th>
                                </thead>
                                <tbody>
                                    <c:forEach var="plist" items="${ plist }">
                                        <tr>
                                            <td class="left">
                                            <a href="product_detail?p_num=${ plist.P_NUM }">
                                                ${ plist.P_NAME }
                                            </a>
                                            </td>
                                            <td class="pnone">${ plist.OL_AMT } 개</td>
                                            <td class="pnone">${ plist.P_PRICE } 원</td>
                                            <td class="pnone">${ plist.OL_FINAL_PRICE } 원</td>
                                            <td class="pnone">${ plist.OL_STATUS }</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            </c:if>
                            <c:if test="${ empty plist }">    
                                <div class="noData">
                                                                            등록된 상품이 없습니다.
                                </div>
                            </c:if>
                        </div>
                        
                        <h3 class="dep">취소 상품 정보</h3>
                        <div class="orderDivNm">
                            <c:if test="${ not empty clist }">  
                            <table summary="주문 상품 정보 게시판으로 주문하신 상품명, 수량, 판매가, 배송순으로 조회 하시고 쿠폰을 적용하실 수 있습니다." class="orderTable" border="1" cellspacing="0">
                                <caption> 취소 상품 정보</caption>
                                <colgroup>
                                <col width="*" />
                                <col width="12%" class="pnone" />
                                <col width="18%"/>
                                </colgroup>
                                <thead>
                                    <th scope="col">상품명</th>
                                    <th scope="col" class="pnone">판매가</th>
                                    <th scope="col">상태</th>
                                </thead>
                                <tbody>
                                    <c:forEach var="clist" items="${ clist }">
                                        <tr>
                                            <td class="left">
                                                ${ clist.P_NAME }
                                            </td>
                                            <td class="pnone">${ clist.RF_PRICE } 원</td>
                                            <td>${ clist.RF_STATUS }</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            </c:if>
                            <c:if test="${ empty clist }">    
                                <div class="noData">
                                                                            등록된 상품이 없습니다.
                                </div>
                            </c:if>
                        </div>

                        <h3 class="dep">반품/환불 상품 정보</h3>
                        <div class="orderDivNm">
                            <c:if test="${ not empty tflist }">  
                            <table summary="주문 상품 정보 게시판으로 주문하신 상품명, 수량, 판매가, 배송순으로 조회 하시고 쿠폰을 적용하실 수 있습니다." class="orderTable" border="1" cellspacing="0">
                                <caption>반품 및 환불 상품 정보</caption>
                                <colgroup>
                                <col width="*" />
                                <col width="12%" class="pnone" />
                                <col width="12%" class="pnone" />
                                <col width="12%" class="ptw30"/>
                                </colgroup>
                                <thead>
                                    <th scope="col">상품명</th>
                                    <th scope="col" class="pnone">수량</th>
                                    <th scope="col" class="pnone">판매가</th>
                                    <th scope="col">상태</th>
                                </thead>
                                <tbody>
                                    <c:forEach var="tflist" items="${ tflist }">
                                        <tr>
                                            <td class="left">
                                               	${tflist.P_NAME }
                                            </td>
                                            <td class="pnone">${ tflist.RT_AMOUNT } 개</td>
                                            <td class="pnone">${ tflist.RT_PRICE } 원</td>
                                            <td>${ tflist.RT_STATUS }</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            </c:if>
                            <c:if test="${ empty tflist }">    
                                <div class="noData">
                                                                            등록된 상품이 없습니다.
                                </div>
                            </c:if>
                        </div>
            
            
                        <!-- 결제 정보 확인 -->
                        <h3 class="dep">결제 정보</h3>
                        <div class="checkDiv">
                            <table summary="결제 정보를 주문일, 결제 총액, 결제수단, 입금자 명 순으로 확인 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
                                <caption>결제 정보</caption>
                                <colgroup>
                                <col width="17%" class="tw30" />
                                <col width="*" />
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row" class="align_center"><span>주문일</span></th>
                                        <td>${ ilist.OL_DATE }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="align_center"><span>결제총액</span></th>
                                        <td>${ ilist.OC_FINAL_SUM }원</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="align_center"><span>결제수단</span></th>
                                        <td>${ ilist.OL_PAYMENT }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="align_center"><span>입금자 명</span></th>
                                        <td>-</td>
                                    </tr>
            
                                </tbody>
                            </table>
                        </div>
                        <!-- //결제 정보 확인 -->
            
            
                        <!-- 배송지 정보 확인 -->
                        <h3 class="dep">배송지 정보</h3>
                        <div class="checkDiv">
                            <table summary="배송지 정보를 구매자명, 수취인명, 배송지주소, 휴대전화, 전화번호 배송시 요구사항 순으로 확인 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
                                <caption>배송지 정보</caption>
                                <colgroup>
                                <col width="17%" class="tw30" />
                                <col width="*" />
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row" class="align_center"><span>구매자 명</span></th>
                                        <td>${ ilist.M_NAME }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="align_center"><span>수취인 명</span></th>
                                        <td>${ ilist.RE_NAME }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="align_center"><span>배송지 주소</span></th>
                                        <td>[${ ilist.RE_ZIPCODE }] ${ ilist.RE_ADDRESS1 } ${ ilist.RE_ADDRESS2 }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="align_center"><span>휴대전화</span></th>
                                        <td>${ ilist.RE_PHONE }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="align_center"><span>전화번호</span></th>
                                        <td>${ ilist.RE_TEL }</td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="align_center"><span>배송<u>요구사항</u></span></th>
                                        <td>${ ilist.M_MSG }</td>
                                    </tr>
            
                                </tbody>
                            </table>
                        </div>
                        <!-- //배송지 정보 확인 -->
            
                        
            
                    </div>
            
                </div>


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