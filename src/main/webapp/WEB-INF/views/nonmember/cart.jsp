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

     $(document).ready(function(){
         msiecheck();
         
         var listcount = $("input:checkbox[name=chk]").length;
         if(listcount==0){
        	 $("#hidden").css("display", "");
         }else {
        	 $("#hidden").css("display", "none");
         }
         
         // 체크박스 선택에 따른 주문금액 변동
  		$("#checkAll").click(function(){
  		// 전체 선택 체크박스가 체크된 상태일 경우
 			if($('#checkAll').prop('checked')){
 				// 해당 화면에 있는 모든 checkbox들 체크
 				var sum = 0;
 				$('input[name=chk]:checkbox').each(function(){
 					$(this).prop('checked', true);
 					var chk_value =$(this).attr('id');  //id = ${p_num}_${p_price}
 		    		var sp = chk_value.split("_");
 					var p_price = sp[1];
 					var p_amt = $("#ipt_"+sp[0]).val();
 					
 					sum += Number(p_price)*Number(p_amt);
 				});
 				$('#sum1').text(commas(sum));
 				
 		 		if(sum>=30000){ 
 		 			$('#del_price').text("0");
 		 			$('#sum2').text(commas(sum));
 		 		}else{
 		 			$('#del_price').text("3,000");
 		 			$('#sum2').text(commas(sum+3000));
 		 		}
 				
 			}else {
 				// 해당 화면에 있는 모든 checkbox들 체크 해제
 				$('input[name=chk]:checkbox').each(function(){
 					$(this).prop('checked', false);
 				});
 				$('#sum1').text("0");
 				$('#del_price').text("0");
 				$('#sum2').text("0");
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
     
  	// 천단위마다  콤마(,) 추가
  	function commas(x) {
  	       return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  	}
  	
  	function itemSum(){
  		var sum=0;
		$('input:checkbox[name=chk]:checked').each(function(){
			var chk_value =$(this).attr('id');
			var sp = chk_value.split("_");
			var p_price = sp[1];
			var p_amt = $("#ipt_"+sp[0]).val();
			sum += Number(p_price)*Number(p_amt);
		});
		$('#sum1').text(commas(sum));
		
		if(sum>=30000 || sum==0){ 
 	 		$('#del_price').text("0");
 	 		$('#sum2').text(commas(sum));
 	 	}else if(0<sum<3000) {
 	 		$('#del_price').text("3,000");
 	 		$('#sum2').text(commas(sum+3000));
 	 	}
  	}
  	
 // 수량 변경에 따른 해당 제품 총합계 변경
	function ch1(price, num){
		var id = document.getElementById("ipt_"+num);
		$('#td1_'+num).text(commas(price * id.value)+"원");
		
		itemSum();
	}	

 // 전체 선택 버튼 클릭 시, 
 	function selectAll(){
		$('#checkAll').prop('checked', true);
		$('input:checkbox[name="chk"]').each(function(){
			$(this).prop('checked', true);
		});
		itemSum();
 	}
 
 // 바로구매 
 	function buyNow(p_num, p_amt){
 		var arrData = [p_num, p_amt];

 		if(confirm("구매하기 페이지로 이동하시겠습니까?")){
 			$.ajax({
 		        	type:"POST",
 		        	url : "cartUpdate",
 		        	data: JSON.stringify(arrData),
 		         	contentType: "application/json",
 		            success : function(data){
 		                        if(data == 1){
 		                        	alert("데이터 성공");
 		                        	location.href="payment";
 			    	       	}
 			        	  },
 				error:function(){
 						alert("서버통신실패");
 					  }
 			});
 			
 		}else {
 			return false;
 		}
 	}
 
 	 // 전체상품 주문하기
    function orderAll(){
    	// 전체상품 주문하기 버튼 클릭 시, 모든 상품의 체크박스 checked
    	$('#checkAll').prop('checked', true);
		$('input[name=chk]:checkbox').each(function(){
			$(this).prop('checked', true);
		});
	
    	$('input:checkbox[name=chk]:checked').each(function(){
    		var chk_value =$(this).attr('id');  //id = ${p_num}_${p_amt}
    		var sp = chk_value.split("_");
    		var p_num = sp[0];
			var p_amt = $("#ipt_"+sp[0]).val();
			var arrData = [p_num, p_amt];
			
		$.ajax({
	        	type:"POST",
	        	url : "cartUpdate",
	        	data: JSON.stringify(arrData),
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
    	location.href="payment";
    }

    
 // 선택상품 주문하기
    function orderSel(){
	 
    	var count = $('input:checkbox[name="chk"]:checked').length;
		if(count>0){

	    	$('input:checkbox[name=chk]:checked').each(function(){
	    		var chk_value =$(this).attr('id');  //id = ${p_num}_${p_amt}
	    		var sp = chk_value.split("_");
	    		var p_num = sp[0];
				var p_amt = $("#ipt_"+sp[0]).val();
				var arrData = [p_num, p_amt];
				
				$.ajax({
			        	type:"POST",
			        	url : "cartUpdate",
			        	data: JSON.stringify(arrData),
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
	    	window.location.href="payment";
		}else {
			alert("선택하신 상품이 없습니다. 주문하실 상품을 먼저 선택해주시기 바랍니다.");
		}
	}
 
 // 선택한 제품 장바구니에서 삭제
    function cart_del(pNum) {
	 	var p_num = String(pNum);

	 	if(confirm("선택하신 상품을 장바구니에서 삭제하시겠습니까?")){
        	$.ajax({
                type : "POST",
                url : "cart_del",
                data: p_num,
                dataType : "json",
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
 
 // 선택 상품 모두 삭제 
	function chk_del(){
		var count = $('input:checkbox[name="chk"]:checked').length;
		if(count>0){
			if(confirm("선택하신 상품을 장바구니에서 삭제하시겠습니까?")){
				$("input[name=chk]:checked").each(function(){
					var chk_value =$(this).attr('id');  //id = ${p_num}_${p_amt}
		    		var sp = chk_value.split("_");
		    		var p_num = sp[0];
			    	$.ajax({
			        	type:"POST",
			        	url : "cart_del",
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
			    location.reload();
			}
		}else {
			alert("선택하신 상품이 없습니다. 삭제하실 상품을 먼저 선택해주시기 바랍니다.");
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
				<li><a href="#">HOME</a></li>
				<li class="last">장바구니</li>
			</ol>
		</div>
		
		<div id="outbox">		
			
			<!-- maxcontents -->
			<div id="maxcontents">
				<div id="mypage">
					<h2><strong>장바구니</strong></h2>
					
				<!-- 장바구니에 상품이 있을경우 -->
					<!-- 장바구니 상품 -->
					<h3 class="dep">장바구니에 담긴 상품</h3>
					<div class="orderDivNm">
						<table summary="장바구니에 담긴 상품들을 전체선택, 상품명, 가격, 수량, 합계, 주문 순으로 조회 및 주문을 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>장바구니 상품목록</caption>
							<colgroup>
							<col width="7%"/>
							<col width="*" />
							<col width="14%" class="tnone" />
							<col width="10%" class="tw14"/>
							<col width="14%" class="tw28"/>
							<col width="14%" class="tnone" />
							</colgroup>
							<thead>
								<th scope="col"><input type="checkbox" id="checkAll" checked/></th>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격</th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
								<th scope="col" class="tnone">주문</th>
							</thead>
							<tbody>
							<tr id="hidden" style="display: none; text-align: center">
								<td colspan="4">장바구니에 등록한 상품이 없습니다.</td>
							</tr>
							<c:forEach var="cartlist" items="${cartlist }" >
									<tr>
										<td><input type="checkbox" class="chk" name="chk" id="${cartlist.pDto.p_num }_${cartlist.pDto.p_price}" onclick="itemSum()" checked/></td>
										<td class="left">
											<p class="img"><img src="${cartlist.pDto.p_thumb_img1 }" alt="상품" width="66" height="66" /></p>
	
											<ul class="goods">
												<li>
													<a href="product_detail?p_num=${cartlist.pDto.p_num }">${cartlist.pDto.p_name }</a>
												</li>
											</ul>
										</td>
										<td class="tnone">
											<fmt:formatNumber var="productPrice" value="${cartlist.pDto.p_price }" type="number"/>
											${productPrice } 원
	
											<!-- 회원일 시 -->
											<br/><span class="pointscore">${cartlist.pDto.p_point } Point</span>
											<!-- //회원일 시 -->
										</td>
										<td><input id="ipt_${cartlist.pDto.p_num}" class="spinner" onblur="ch1(${cartlist.pDto.p_price }, ${cartlist.pDto.p_num})" value="${cartlist.p_amt }" maxlength="3" /></td>
										<fmt:formatNumber var="productPriceSum" value="${cartlist.pDto.p_price * cartlist.p_amt }" type="number"/>
										<td id="td1_${cartlist.pDto.p_num}">${productPriceSum }원</td>
										<td class="tnone">
										<ul class="order">	
											<li><a onclick="buyNow(${cartlist.pDto.p_num }, ${cartlist.p_amt })" class="obtnMini iw70" style="cursor: default;">바로구매</a></li>
											<li><a onclick="cart_del(${cartlist.pDto.p_num })" class="nbtnMini iw70" style="cursor: default;">상품삭제</a></li>
										</ul>
									</td>
									</tr>
									<c:set var="sum" value="${sum + cartlist.pDto.p_price * cartlist.p_amt }"/>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<div class="btnArea">
						<div class="bRight">
							<ul>
								<li><a class="selectbtn" onclick="selectAll()">전체선택</a></li>
								<li><a id="selectbtn2" class="selectbtn2" onclick="chk_del()">선택삭제</a></li>
							</ul>
						</div>
					</div>
					<!-- //장바구니 상품 -->
					

					<!-- 총 주문금액 -->
					<div class="amount">
						<h4>총 주문금액</h4>
						<ul class="info">
							<li>
								<span class="title">상품 합계금액</span>
								<fmt:formatNumber var="sum1" value="${sum }" type="number"/>
								<span class="won"><strong id="sum1">${sum1 }</strong> 원</span>
							</li>
							<li>
								<span class="title">배송비</span>
								<span class="won"><strong  id="del_price">
									<c:if test="${sum < 30000 }">
										<c:out value="3,000"/>
									</c:if>
									<c:if test="${sum >= 30000 }">
										<c:out value="0"/>
									</c:if>
								</strong> 원</span>
							</li>
						</ul>
						<ul class="total">
							<li class="txt"><strong>결제 예정 금액</strong></li>
							<fmt:formatNumber var="finalP" value="${sum+del_price }" type="number"/>
							<li class="money"><span id="sum2">${finalP }</span> 원</li>
						</ul>
					</div>
					<!-- //총 주문금액 -->

					<div class="cartarea">
						<ul>
							<li><a class="ty1" onclick="orderSel()">선택상품 <span>주문하기</span></a></li>
							<li><a class="ty2" onclick="orderAll()">전체상품 <span>주문하기</span></a></li>
							<li class="last"><a href="/ex/" class="ty3">쇼핑 <span>계속하기</span></a></li>
						</ul>
					</div>

				<!-- //장바구니에 상품이 있을경우 -->


				<!-- 장바구니에 상품이 없을경우
					<div class="noting">
						<div class="point"><span class="orange">장바구니</span>에 담긴 상품이 없습니다.</div>

						<a href="#">쇼핑 계속하기</a>
					</div>
				 //장바구니에 상품이 없을경우 -->


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
			<!-- //maxcontents -->


		</div>
	</div>
	<!-- //container -->




	<jsp:include page="../footer.jsp" />



</div>
</div>
</body>
</html>