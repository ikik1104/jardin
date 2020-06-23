<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<jsp:useBean id="sysdate" class="java.util.Date"/>
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
		// 처음 페이지 로딩 시, 새로고침 적용
// 		if (self.name != 'reload') {
// 	         self.name = 'reload';
// 	         self.location.reload(true);
// 	     }
// 	     else self.name = '';
		 
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
 		
        // 주문자 정보와 수취자 정보 동일하게 
 		$("input[name=infosame]:checkbox").click(function(){
 			if($(this).is(":checked")== true){
 				$("input[name=re_name]").val($("input[name=m_name]").val());
 				$("input[name=re_name]").prop("readonly", true);
 				$("input[name=re_zipcode]").val(Number($("input[name=m_zipcode]").val()));
 				$("input[name=re_zipcode]").prop("readonly", true);
 				$("input[name=re_address1]").val($("input[name=m_address1]").val());
 				$("input[name=re_address1]").prop("readonly", true);
 				$("input[name=re_address2]").val($("input[name=m_address2]").val());
 				$("input[name=re_address2]").prop("readonly", true);
 				$("#re_phone1").val($("#phone1").val());
 				$("input[name=re_phone2]").val($("input[name=phone2]").val());
 				$("input[name=re_phone2]").prop("readonly", true);
 				$("input[name=re_phone3]").val($("input[name=phone3]").val());
 				$("input[name=re_phone3]").prop("readonly", true);
 				$("#re_tel1").val($("#tel1").val());
 				$("input[name=re_tel2]").val($("input[name=tel2]").val());
 				$("input[name=re_tel2]").prop("readonly", true);
 				$("input[name=re_tel3]").val($("input[name=tel3]").val());
 				$("input[name=re_tel3]").prop("readonly", true);
 			}else {
 				$("input[name=re_name]").val('');
 				$("input[name=re_name]").prop("readonly", false);
 				$("input[name=re_zipcode]").val('');
 				$("input[name=re_address1]").val('');
 				$("input[name=re_address1]").prop("readonly", false);
 				$("input[name=re_address2]").val('');
 				$("input[name=re_address2]").prop("readonly", false);
 				$("#re_phone1").val('');
 				$("input[name=re_phone2]").val('');
 				$("input[name=re_phone2]").prop("readonly", false);
 				$("input[name=re_phone3]").val('');
 				$("input[name=re_phone3]").prop("readonly", false);
 				$("#re_tel1").val('');
 				$("input[name=re_tel2]").val('');
 				$("input[name=re_tel2]").prop("readonly", false);
 				$("input[name=re_tel3]").val('');
 				$("input[name=re_tel3]").prop("readonly", false);
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
 	
 	// 유효성 검사
 	function validate(){
 		var or_name = document.getElementById("m_name");
 		var or_zipcode = document.getElementById("m_zipcode");
 		var or_address1= document.getElementById("m_address1");
 		var or_address2= document.getElementById("m_address2");
 		var or_phone2= document.getElementById("phone2");
 		var or_phone3= document.getElementById("phone3");
 		var re_name = document.getElementById("re_name");
 		var re_zipcode = document.getElementById("re_zipcode");
 		var re_address1= document.getElementById("re_address1");
 		var re_address2= document.getElementById("re_address1e");
 		var re_phone2= document.getElementById("re_phone2");
 		var re_phone3= document.getElementById("re_phone3");
 		
 		 //이름 정규화 공식
        var regul3 = /^[가-힝a-zA-Z]{2,}$/;
 		
 	   //이름에 특수 문자가 들어간 경우
        if (!check(regul3,objName,"이름이 잘못 되었습니다.")) {
            return false;
        }

 		return document.orderform.submit();
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
				<li class="last">주문/결제</li>
			</ol>
		</div>
		
		<div id="outbox">		
			
			<!-- maxcontents -->
			<div id="maxcontents">
				<div id="mypage">
					<h2><strong>주문/결제</strong></h2>
					<!-- 주문 상품 -->
					<form action="submit_order" method="post" id="orderform" name="orderform">
					<h3 class="dep">주문 제품 확인</h3>
					<div class="orderDivNm">
						<table summary="주문 제품 확인 게시판으로 상품명, 가격, 수량, 합계순으로 조회 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>주문 제품 확인</caption>
							<colgroup>
							<col width="*" />
							<col width="16%" class="tnone" />
							<col width="14%" />
							<col width="16%" class="tw28"/>
							</colgroup>
							<thead>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격/포인트</th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
							</thead>
							<tbody>
								<c:if test="${cCount==0 }">
								<tr><td colspan="5">장바구니에 담긴 상품이 없습니다.</td></tr>
								</c:if>
							
								<c:forEach var="cartlist" items="${cartlist }" >
									<tr>
										<td class="left">
											<p class="img"><img src="user/images/img/sample_product.jpg" alt="상품" width="66" height="66" /></p>
	
											<ul class="goods">
												<li>
													<a href="detail?p_num=${cartlist.pDto.p_num }">${cartlist.pDto.p_name }</a>
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
										<td>${cartlist.p_amt }</td>
										<fmt:formatNumber var="productPriceSum" value="${cartlist.pDto.p_price * cartlist.p_amt }" type="number"/>
										<td>${productPriceSum }원</td>
									</tr>
									<c:set var="sum" value="${sum + cartlist.pDto.p_price * cartlist.p_amt }"/>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="poroductTotal">
						<ul>	
							<fmt:formatNumber var="sum1" value="${sum }" type="number"/>
							<li>상품 합계금액 <strong>${sum1 }</strong> 원</li>
							<li>+ 배송비 <strong>
								
								<c:if test="${sum < 30000 }"><c:set var="del_price" value ="3000" />
								<fmt:formatNumber var="del_price1" value="${del_price }" type="number"/>${del_price1 }</c:if>
								<c:if test="${sum >= 30000 }"><c:set var="del_price" value ="0" />
								<fmt:formatNumber var="del_price1" value="${del_price }" type="number"/>${del_price1 }</c:if>
							</strong> 원</li>
							<fmt:formatNumber var="finalP" value="${sum+del_price	 }" type="number"/>
							<li>= 총 합계 <strong>${finalP }</strong> 원</li>
						</ul>
					</div>
					<!-- //주문 상품 -->
					

			<!-- 주문자 주소 입력 -->
					<h3 class="diviLeft">주문자 주소 입력</h3>
<!--				<div class="diviRight">
						<ul>
							<li>수정 내용을 회원정보에도 반영합니다.&nbsp;&nbsp;</li>
							<li><a href="#" onclick="change_info()">회원정보반영</a></li>
						</ul>
					</div>
-->
					<div class="checkDiv">
						<table summary="주문자 주소를 입력할 수 있는 란으로 이름, 주소, 이메일, 휴대폰 번호, 전화번호 순으로 입력 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>주문자 주소 입력</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>*이름</span></th>
									<td><input type="text" class="w134" id="m_name" name="m_name" required/></td>
								</tr>

								<tr>
									<th scope="row"><span>*주소</span></th>
									<td>
										<ul class="pta">
											<li>
												<input type="text" class="w134" id="m_zipcode" name="m_zipcode" readonly required/>&nbsp;
											</li>
											<li><a onclick="execDaumPostcode()" class="addressBtn"><span>우편번호 찾기</span></a></li>
											<li class="pt5"><input type="text" class="addressType2" id="m_address1" name="m_address1" required/></li>
											<li class="pt5"><input type="text" class="addressType2" id="m_address2" name="m_address2" required/></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>*이메일</span></th>
									<td>
										<ul class="pta">
											<li><input type="text" class="w134" id="email_id" name="email_id" required/></li>
											<li><span class="valign">&nbsp;@&nbsp;</span></li>
											<li class="r10"><input type="text" class="w134" id="email_domain" name="email_domain" required/></li>
											<li>
												<select id="emailList">
													<option value="#" selected="selected">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="nate.com">nate.com</option>    
													<option value="yahoo.co.kr">yahoo.co.kr</option>    
													<option value="paran.com">paran.com</option>    
													<option value="empal.com">empal.com</option>    
													<option value="hotmail.com">hotmail.com</option>    
													<option value="korea.com">korea.com</option>    
													<option value="lycos.co.kr">lycos.co.kr</option>    
													<option value="dreamwiz.com">dreamwiz.com</option>    
													<option value="hanafos.com">hanafos.com</option>    
													<option value="chol.com">chol.com</option>    
													<option value="gmail.com">gmail.com</option>    
													<option value="empas.com">empas.com</option>
												</select>&nbsp;&nbsp;&nbsp;
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>*휴대폰 번호</span></th>
									<td>
										<ul class="pta">
											<li>
												<select id="phone1" name="phone1">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>    
													<option value="019">019</option>    
												</select>
											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" id="phone2" name="phone2" required/> <span class="valign">-</span>&nbsp;</li>
											<li class="r10"><input type="text" class="w74" maxlength="4" id="phone3" name="phone3" required/></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>전화번호</span></th>
									<td>
										<ul class="pta">
											<li>
												<select id="tel1" name="tel1">
													<option value="02">02</option>
													<option value="031">031</option>
													<option value="032">032</option>
													<option value="033">033</option>
													<option value="041">041</option>
													<option value="042">042</option>
													<option value="043">043</option>
													<option value="051">051</option>
													<option value="052">052</option>
													<option value="053">053</option>
													<option value="054">054</option>
													<option value="055">055</option>
													<option value="061">061</option>
													<option value="062">062</option>
													<option value="063">063</option>
													<option value="064">064</option>
													<option value="070">070</option>
												</select>
											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" id="tel2" name="tel2" /> <span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" id="tel3" name="tel3" /></li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
			<!-- //주문자 주소 입력 -->


			<!-- 수취자 주소 입력 -->
					<h3 class="dep">
						수취자 주소 입력
						
						<input type="checkbox" id="infosame" name="infosame"/>
						<label for="infosame">주문자 정보와 동일</label>
					</h3>
					<div class="checkDiv">
						<table summary="수취자 주소를 입력할 수 있는 란으로 이름, 주소, 이메일, 휴대폰 번호, 전화번호 순으로 입력 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>수취자 주소 입력</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>*이름</span></th>
									<td><input type="text" class="w134" id="re_name" name="re_name" required/></td>
								</tr>

								<tr>
									<th scope="row"><span>*주소</span></th>
									<td>
										<ul class="pta">
											<li>
												<input type="text" class="w134" name="re_zipcode" id="re_zipcode" readonly required/>&nbsp;
											</li>
											<li><a onclick="execDaumPostcode2()" class="addressBtn"><span>우편번호 찾기</span></a></li>
											<li class="pt5"><input type="text" class="addressType2" id="re_address1" name="re_address1" required/></li>
											<li class="pt5"><input type="text" class="addressType2" id="re_address2" name="re_address2" required/></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>*휴대폰 번호</span></th>
									<td>
										<ul class="pta">
											<li>
												<select id="re_phone1" name="re_phone1">
													<option value="010" selected="selected">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>    
													<option value="019">019</option>    
												</select>
											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" id="re_phone2" name="re_phone2" required/> <span class="valign">-</span>&nbsp;</li>
											<li class="r10"><input type="text" class="w74" maxlength="4" id="re_phone3" name="re_phone3" required/></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>전화번호</span></th>
									<td>
										<ul class="pta">
											<li>
												<select id="re_tel1" name="re_tel1">
													<option value="02" selected="selected">02</option>
													<option value="031">031</option>
													<option value="032">032</option>
													<option value="033">033</option>
													<option value="041">041</option>
													<option value="042">042</option>
													<option value="043">043</option>
													<option value="051">051</option>
													<option value="052">052</option>
													<option value="053">053</option>
													<option value="054">054</option>
													<option value="055">055</option>
													<option value="061">061</option>
													<option value="062">062</option>
													<option value="063">063</option>
													<option value="064">064</option>
													<option value="070">070</option>
												</select>
											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" id="re_tel2" name="re_tel2"/> <span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" id="re_tel3" name="re_tel3"/></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>배송시 <u>요구사항</u></span></th>
									<td><textarea class="demandtta" name="m_msg"></textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
			<!-- //수취자 주소 입력 -->


			<!-- 쿠폰 및 포인트 사용 -->
					<h3 class="dep">쿠폰 및 포인트 사용</h3> <span>*회원만 사용 가능한 서비스입니다.</span>
					<div class="checkDiv" style="display: none;"></div>
			<!-- //쿠폰 및 포인트 사용 -->
			

			<!-- 총 주문금액 -->
					<div class="amount">

						<!-- 회원 일때 -->
						<h4 class="member">총 주문금액</h4>
						<!-- 회원 일때 -->
						<!-- 비회원 일때  <h4>총 주문금액</h4> //비회원 일때 -->

						<ul class="info">
							<li>
								<span class="title">상품 합계금액</span>
								<span class="won"><strong>${sum1 }</strong> 원</span>
							</li>
							<li>
								<span class="title">배송비</span>
								<span class="won"><strong>${del_price1 }</strong> 원</span>
							</li>

							<!-- 회원 일때만 
							<li>
								<span class="title">포인트 할인</span>
								<span class="won"><strong id="pointDisc">0</strong> P</span>
							</li>
							<li>
								<span class="title">쿠폰 할인(제품쿠폰+장바구니쿠폰)</span>
								<span class="won"><strong id="coupDisc">0</strong> 원</span>
							</li>
							<li>
								<span class="title">배송비 할인</span>
								<span class="won"><strong id="delDisc">0</strong> 원</span>
							</li>
							-->
						</ul>

						<ul class="total">
							<!-- 회원 일때만 -->
							<fmt:formatNumber var="point" value="${sum*0.01 }" type="number"/>
							<li class="mileage">(적립 포인트 <strong>${point }</strong> Point) </li>
							<!-- //회원 일때만 -->

							<li class="txt"><strong>결제 예정 금액</strong></li>
							<li class="money"><span id="finalPrice1">${finalP }</span> 원</li>
						</ul>
					</div>
			<!-- //총 주문금액 -->
			
			<!-- 결제수단 선택 -->
					<h3 class="dep">결제수단 선택</h3>
					<div class="checkDiv">
						<table summary="신용카드 결제, 실시간 계좌이체, 가상계좌, 가상계좌(에스크로), 무통장 입금 순으로 결제수단을 선택하실 수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>결제수단 선택</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>결제수단</span></th>
									<td>
										<ul class="pta">
											<li>
												<input type="radio" id="method01" name="ol_payment" checked="checked" value="신용카드 결제"/><label for="method01">신용카드 결제</label>
											</li>
											<li>
												<input type="radio" id="method05" name="ol_payment" value="무통장 입금" /><label for="method05">무통장 입금</label>
											</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				<!-- //결제수단 선택 -->

					<div class="disnone method01"><!-- 신용카드 -->
						<p class="orderalert"><strong>[신용카드]</strong> 온라인상에서 소유하신 신용카드를 통해, 전자결제를 진행합니다.</p>
					</div>
					<div class="disnone method02"><!-- 실시간 계좌이체 -->
						<p class="orderalert"><strong>[실시간 계좌이체]</strong> 주민번호, 계좌 정보, 공인인증서를 통해 실시간 계좌이체를 진행합니다.</p>
					</div>
					<div class="disnone method03"><!-- 가상계좌 -->
						<p class="orderalert"><strong>[가상계좌]</strong> 원하시는 은행으로 가상계좌를 발급해 드리며, 발급된 계좌로 구매대금을 직접 송금합니다.</p>
					</div>
					<div class="disnone method04"><!-- 가상계좌 에스크로 -->
						<p class="orderalert"><strong>[가상계좌 에스크로]</strong> 원하시는 은행으로 가상계좌를 발급해 드리며, 발급된 계좌로 구매대금을 직접 송금합니다.(에스크로 안전결제)</p>
					</div>

					<div class="disnone method05"><!-- 무통장 입금 -->
						<p class="orderalert"><strong>[무통장 입금]</strong> 쇼핑몰의 대표 계좌로 구매대금을 직접 송금합니다.</p>

						<div class="checkDiv">
							<table summary="신용카드 결제, 실시간 계좌이체, 가상계좌, 가상계좌(에스크로), 무통장 입금 순으로 결제수단을 선택하실 수 있습니다." class="checkTable" border="1" cellspacing="0">
								<caption>결제수단 선택</caption>
								<colgroup>
								<col width="22%" class="tw30" />
								<col width="*" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><span>입금은행</span></th>
										<td>
											<select name="bank">
												<option value="국민은행" >국민은행</option>
												<option value="신한은행" >신한은행</option>
												<option value="우리은행" >우리은행</option>
												<option value="농협은행" >농협은행</option>
												<option value="기업은행" >기업은행</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><span>입금자 명</span></th>
										<td><input type="text" class="w134" name="dep_name"/></td>
									</tr>
									<tr>
										<th scope="row"><span>영수증 신청</span></th>
										<td>
											<select name="receiptChk">
												<option value="none">신청안함</option>
												<option value="individual">개인소득공제</option>
												<option value="corporate">사업자 지출증빙</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<!-- 개인소득공제 -->
						<div class="receipt individual">
							<dl>
								<dt>발급방식</dt>
								<dd>
									<ul>
										<li><input type="radio" name="individual" id="phone" checked="checked" /><label for="phone">휴대폰</label></li>
										<li><input type="radio" name="individual" id="securitynumber" /><label for="securitynumber">주민등록번호</label></li>
										<li><input type="radio" name="individual" id="cashreceipts" /><label class="fn" for="cashreceipts">현금영수증카드</label></li>
									</ul>
								</dd>
							</dl>
							
							<ul class="inform phone"><!-- 휴대폰 -->
								<li class="title">이름</li>
								<li class="interval"><input type="text" class="w134" /></li>
								<li class="title cb">휴대폰</li>
								<li><input type="text" class="w134" /></li>
							</ul>

							<ul class="inform securitynumber"><!-- 주민등록번호 -->
								<li class="title">이름</li>
								<li class="interval"><input type="text" class="w134" /></li>
								<li class="title cb">주민등록번호</li>
								<li><input type="text" class="w134" /></li>
							</ul>

							<ul class="inform cashreceipts"><!-- 현금영수증카드 -->
								<li class="title">이름</li>
								<li class="interval"><input type="text" class="w134" /></li>
								<li class="title2 cb">현금영수증카드 번호</li>
								<li><input type="text" class="w134" /></li>
							</ul>

							<p class="txt">* 번호 입력시 하이픈(-)을 제외한 숫자만 입력하세요.</p>
						</div>
						<!-- //개인소득공제 -->

						<!-- 사업자 지출증빙 -->
						<div class="receipt corporate">
							<dl>
								<dt>발급방식</dt>
								<dd>
									<ul>
										<li><input type="radio" name="corporate" id="corporatenumber" checked="checked" /><label for="corporatenumber">사업자번호</label></li>
										<li><input type="radio" name="corporate" id="corporate_cash" /><label class="fn" for="corporate_cash">현금영수증카드</label></li>
									</ul>
								</dd>
							</dl>

							<ul class="inform corporatenumber"><!-- 사업자번호 -->
								<li class="title">이름</li>
								<li class="interval"><input type="text" class="w134" /></li>
								<li class="title2 cb">사업자등록 번호</li>
								<li><input type="text" class="w134" /></li>
							</ul>

							<ul class="inform corporate_cash"><!-- 현금영수증카드 -->
								<li class="title">이름</li>
								<li class="interval"><input type="text" class="w134" /></li>
								<li class="title2 cb">현금영수증카드 번호</li>
								<li><input type="text" class="w134" /></li>
							</ul>

							<p class="txt">* 번호 입력시 하이픈(-)을 제외한 숫자만 입력하세요.</p>
						</div>
						<!-- //사업자 지출증빙 -->

					</div>

					<!-- 주문리스트에 필요한 정보 -->
					<c:forEach var="cartlist" items="${cartlist }" varStatus="status">
						<input type="hidden" name="productNum" value="${cartlist.pDto.p_num }"/>
						<input type="hidden" name="productPrice" value="${cartlist.pDto.p_price }"/>
						<input type="hidden" name="productAmt" value="${cartlist.p_amt }"/>
					</c:forEach>
					<!-- 주문리스트에 필요한 정보 -->

					<!-- Btn Area -->
					<div class="btnArea">
						<div class="orderCenter">
							<ul>
								<li><a href="main" class="nbtnbig iw0140">취소</a></li>
								<li><input type="submit" onclick="validate()" class="sbtnMini iw0140" value="주문 / 결제" style="border-style: none;"></li>								
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
				</form>


				</div>
			</div>
			<!-- //maxcontents -->


<script type="text/javascript" src="user/js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="user/css/jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
$(function(){
	// select, radio - display check

	// 1 Step Radio
	var firstchk = $("input:radio[name=ol_payment]:checked").attr("id");
	$("div." + firstchk).css("display","block");
	$("input:radio[name=ol_payment]").click(function(){
		var divchk = $(this).attr("id");		
		$(".disnone").css("display","none");
		$("div." + divchk).css("display","block");
	});
	
	// 2 Step 영수증 Select
	var firstselect = $("select[name=receiptChk] option:selected").attr("value");
	$("div." + firstselect).css("display","block");
	$("select[name=bank]").css("width","125px");
	$("select[name=receiptChk]").css("width","112px");
	$("select[name=receiptChk]").change(function() {
        $(".receipt").css("display","none");
        if($(this).val() == "none"){ $(".receipt").css("display","none"); }
        else if($(this).val() == "individual"){ $(".individual").css("display","block"); }
		else{ $(".corporate").css("display","block"); }

		var firstindi = $("input:radio[name=individual]:checked").attr("id");
		var firstcorp = $("input:radio[name=corporate]:checked").attr("id");
		$("ul." + firstindi).css("display","block");		
		$("ul." + firstcorp).css("display","block");
    });
	
	// 3-1 Step 발급방식 - 개인
	var firstindi = $("input:radio[name=individual]:checked").attr("id");
	$("ul." + firstindi).css("display","block");
	$("input:radio[name=individual]").click(function(){
		var divchk = $(this).attr("id");
		$(".inform").css("display","none");
		$("ul." + divchk).css("display","block");
	});

	// 3-2 Step 발급방식 - 사업자
	var firstcorp = $("input:radio[name=corporate]:checked").attr("id");
	$("ul." + firstcorp).css("display","block");
	$("input:radio[name=corporate]").click(function(){
		var divchk = $(this).attr("id");
		$(".inform").css("display","none");
		$("ul." + divchk).css("display","block");
	});





	// layer popup
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 540;
		var couponCheck = 760;
	}else{
		var layerCheck = 320;
		var couponCheck = 320;
	}

	$(".nbtn").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : couponCheck,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			$('#fancybox-wrap').css('top','400px');
			$('html,body').animate({ scrollTop: 400 }, 500);
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

<!-- 다음 주소검색 api -->
    <div id="layer"
        style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
        <img src="//t1.daumcdn.net/postcode/resource/images/close.png"
            id="btnCloseLayer"
            style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
            onclick="closeDaumPostcode()" alt="닫기 버튼">
    </div>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="user/js/address.js"></script>
</body>
</html>