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
         
         var listcount = $('input:checkbox[name=chk]').length;
         if(listcount==0){
        	 $("#hidden").css("display", "");
         }else {
        	 $("#hidden").css("display", "none");
         }
         
      // 체크박스 
 		$("#checkAll").click(function(){
 		// 전체 선택 체크박스가 체크된 상태일 경우
			if($('#checkAll').prop('checked')){
				// 해당 화면에 있는 모든 checkbox들 체크
				$('input[name=chk]:checkbox').each(function(){
					$(this).prop('checked', true);
				});
			}else {
				// 해당 화면에 있는 모든 checkbox들 체크 해제
				$('input[name=chk]:checkbox').each(function(){
					$(this).prop('checked', false);
				});
			}
 		});
 		
		$(".chk").click(function(){
			var checkboxLength = $('input:checkbox[name="chk"]').length;
			var checkedLength = $('input:checkbox[name="chk"]:checked').length;
			if(checkboxLength == checkedLength){
				$('#checkAll').prop('checked', true);
			}else {
				$('#checkAll').prop('checked', false);
			}
		});
         
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
     
  // 선택 상품 위시리스트에서 삭제
     function del_wl(pNum) {
         if(confirm("해당 상품을 위시리스트에서 삭제하시겠습니까?")){
            var p_num = String(pNum);
         	$.ajax({
                 url : "del_wishlist",
                 type : "POST",
                 data: p_num,
                 contentType: "application/json",
                 success : function(val){
                    if(val == 1){
                       location.reload();
                    }
                 },
                 error : function(){
                    alert("서버통신실패");
                 }
              });
         }
      }
  
  // 체크한 상품 한 번에 삭제
     function del_chk(){
     	var count = $('input:checkbox[name="chk"]:checked').length;
 		if(count>0){
 			if(confirm("선택하신 상품을 위시리스트에서 삭제하시겠습니까?")){
 				$("input[name=chk]:checked").each(function(){
 			  		var p_num =$(this).val();  
 			    	$.ajax({
 			        	type:"POST",
 			        	url : "del_wishlist",
 			        	data: p_num,
 			         	contentType: "application/json",
 			            success : function(data){
 			                        if(data == 1){
 			                           location.reload();
 			                        }
 			                      },
 			            error:function(){
 			                   alert("서버통신실패");
 			            }
 			        });
 				});
 			}
 		}else {
 			alert("선택하신 상품이 없습니다. 삭제하실 상품을 먼저 선택해주시기 바랍니다.");
 		}
 	}
  
  
     // 체크한 상품 장바구니로 이동
     function go_cart(){
     	var count = $('input:checkbox[name="chk"]:checked').length;
 		if(count>0){
 				$("input[name=chk]:checked").each(function(){
 			  		var p_num =$(this).val();  
 			    	$.ajax({
 			        	type:"POST",
 			        	url : "go_cart",
 			        	data: p_num,
 			         	contentType: "application/json",
 			            success : function(data){
 			                        if(data == 1){
 			                        }
 			                      },
 			            error:function(){
 			                   alert("서버통신실패");
 			            }
 			        });
 				});
 				window.location.href="cart";
 		}else {
 			alert("선택하신 상품이 없습니다. 상품을 먼저 선택해주시기 바랍니다.");
 		}
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
				<li><a href="ordercheck">MY PAGE</a></li>
				<li class="last">위시리스트</li>
			</ol>
		</div>
		
		<div id="outbox">		
		 	<jsp:include page="common/sub_navi.jsp" />
			<script type="text/javascript">initSubmenu(4,0);</script>

			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>위시리스트</strong><span>위시리스트에 담긴 상품을 확인해보세요.</span></h2>
					
					<jsp:include page="common/shortInfo.jsp" />

				<!-- 장바구니에 상품이 있을경우 -->
					<!-- 장바구니 상품 -->
					<h3>위시리스트에 담긴 상품</h3>
					<div class="orderDivNm">
						<table summary="위시리스트에 담긴 상품들을 전체선택, 상품명, 가격/포인트, 수량, 합계, 주문 순으로 조회 및 주문을 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>위시리스트 상품목록</caption>
							<colgroup>
							<col width="7%"/>
							<col width="*" />
							<col width="14%" class="tnone" />
							<col width="14%" class="tnone" />
							</colgroup>
							<thead>
								<th scope="col"><input type="checkbox" id="checkAll" name="checkAll"/></th>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격/포인트</th>
								<th scope="col" class="tnone">삭제</th>
							</thead>
							<tbody>
								<tr id="hidden" style="display: none; text-align: center">
									<td colspan="4">등록한 위시리스트가 없습니다.</td>
								</tr>
							<c:forEach var="allWishlist" items="${allWishlist }">
								<tr>
									<td><input type="checkbox" class="chk" name="chk" value="${allWishlist.p_num }"/></td>
									<td class="left">
										<p class="img"><img src="${allWishlist.pDto.p_thumb_img1}" alt="상품" width="66" height="66" /></p>

										<ul class="goods">
											<li>
												<a href="product_detail?p_num=${allWishlist.p_num }">${allWishlist.pDto.p_name}</a>
											</li>
										</ul>
									</td>
									<fmt:formatNumber var="p_price" value="${allWishlist.pDto.p_price }" type="number" />
									<fmt:formatNumber var="p_point" value="${allWishlist.pDto.p_point }" type="number" />
									<td class="tnone">${p_price} 원<br/><span class="pointscore">${p_point } Point</span></td>
									<td class="tnone">
										<ul class="order">	
											<li><a href="#" class="nbtnMini iw70" onclick="del_wl(${allWishlist.p_num })">상품삭제</a></li>
										</ul>
									</td>
								</tr>
							</c:forEach>
								
							</tbody>
						</table>
					</div>

					<div class="btnArea">
						<div class="bRight">
							<ul>
								<li><a href="#" class="selectbtn_1" onclick="go_cart()">선택상품 장바구니로 이동</a></li>
								<li><a href="#" class="selectbtn2" onclick="del_chk()">선택삭제</a></li>
							</ul>
						</div>
					</div>
					<!-- //장바구니 상품 -->
					

					<!-- 총 금액 -->
					<div class="amount" style="border:2px #999 solid;">
						<h4 style="font-size:15px; padding:0px 0px 10px 0px; margin: 15px 15px;">안내</h4>
						<ul>
							<li style="padding-left:15px; margin-bottom: 15px;">
								<span>- 위시리스트에서 장바구니로 이동시킨 상품은 위시리스트에서 삭제됩니다.</span>
							</li>
							<li style="padding-left:15px; margin-bottom: 15px;">
								<span>- 상품의 수량은 장바구니로 이동한 후 변경이 가능합니다.</span>
							</li>
						</ul>
					</div>
					<!-- //총 주문금액 -->

				<!-- //장바구니에 상품이 있을경우 -->


				<!-- 장바구니에 상품이 없을경우
					<div class="noting">
						<div class="point"><span class="orange">장바구니</span>에 담긴 상품이 없습니다.</div>

						<p>장바구니에 담긴 상품은 30일간만 보관됩니다.<br/>더 오래 보관하고 싶은 상품은 <u>위시리스트</u>에 담아주세요.</p>

						<a href="#">쇼핑 계속하기</a>
					</div>
				 //장바구니에 상품이 없을경우 -->

				</div>
			</div>
			<!-- //contents -->


<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<style type="text/css">
.ui-corner-all{border-bottom-right-radius:0 !important; border-bottom-left-radius:0 !important; border-top-left-radius:0 !important; border-top-right-radius:0 !important;}
.ui-widget-content{border:0;}
.ui-spinner-input{width:44px; margin:0; border:1px #ddd solid; padding:2px 0 2px 5px; font-family:'Nanum Gothic' !important; font-size:12px !important;}
</style>

<script type="text/javascript">
$(function() {
	var spinner = $( ".spinner" ).spinner({ min: 1, max: 999 });
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