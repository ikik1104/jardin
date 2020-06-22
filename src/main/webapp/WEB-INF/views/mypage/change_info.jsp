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
<script type="text/javascript" src="user/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="user/js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="user/js/jquery.anchor.js"></script>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->


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
         
         //휴대전화번호 010, 011 ...
         $("#phone1").val("${phone1}").attr("selected","selected");

         //유선전화번호 
         $("#tel1").val("${tel1}").attr("selected","selected");
         
		 //생일 : 년
        $("#birth1").val("${birth1}").attr("selected","selected");
        //생일 : 월 
        $("#birth2").val("${birth2}").attr("selected","selected");
        //생일 : 일 
        $("#birth3").val("${birth3}").attr("selected","selected");

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
     
     //이메일, 연락처, 주소 폼 맞추기
     function info_submit(){
    	 $.ajax({
             type : "POST",
             url : "submit_change_info",
             data: {
          	   m_id : "${ info_view.getM_id() }",
          	   m_email : $("input[name=email_id]").val() + "@" + $("input[name=email_domain]").val(),
          	   m_email_ok : $('input[name="m_email_ok"]:checked').val(),
          	   m_zipcode : $("input[name=m_zipcode]").val(),
          	   m_address1 : $("input[name=m_address1]").val(),
          	   m_address2 : $("input[name=m_address2]").val(),
          	   m_phone : $("#phone1").val()+"-"+$("input[name=phone2]").val()+"-"+$("input[name=phone3]").val(),
          	   m_sms_ok : $('input[name="m_sms_ok"]:checked').val(),
          	   m_tel : $("#tel1").val()+"-"+$("input[name=tel2]").val()+"-"+$("input[name=tel3]").val(),
          	   m_birth : $("#birth1").val()+"/"+$("#birth2").val()+"/"+$("#birth3").val(),
          	   m_birth_sort : $('input[name="m_birth_sort"]:checked').val()
             }, 
             success : function(val){
                if(val == 1){ //리턴값이 1이면 (=성공)
                   alert("회원정보 수정이 완료되었습니다.");
                   location.reload();
                }else{ // 0이면 실패
                   alert("회원정보 수정사항이 반영되지 않았습니다. 다시 확인해주세요.");
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
				<li><a href="#">MY PAGE</a></li>
				<li class="last">회원정보 수정</li>
			</ol>
		</div>
		
		<div id="outbox">		
            <jsp:include page="common/sub_navi.jsp" />
            <script type="text/javascript">initSubmenu(8,0);</script>

			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>회원정보 수정</strong><span>회원님의 개인 정보를 수정하실 수 있습니다.</span></h2>
					
					<jsp:include page="common/shortInfo.jsp" />
						

					<div class="attention">
						<ul>
							<li>* 표시된 항목은 필수 항목이므로 반드시 입력하셔야 합니다.</li>
						</ul>
					</div>

                    <form action="submit_change_info" method="post" name="ch_info">
					<div class="memberbd">
						<table summary="이름, 아이디, 비밀번호, 비밀번호 확인, 이메일, 이메일수신여부, 주소, 휴대폰, 유선전화, 생년월일 순으로 회원가입 정보를 수정할수 있습니다." class="memberWrite" border="1" cellspacing="0">
							<caption>회원가입 수정</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>이름 *</span></th>
									<td>${ info_view.getM_name() }</td>
								</tr>
								<tr>
									<th scope="row"><span>아이디 *</span></th>
									<td>${ info_view.getM_id() }</td>
                                    <input type="hidden" name="m_id" value="${ info_view.getM_id() }">
								</tr>
								<tr>
									<th scope="row"><span>비밀번호 변경 *</span></th>
									<td><a href="password_change?m_id=${ info_view.getM_id() }" data-toggle="modal" data-target="#myModal" class="nbtnMini iw86">비밀번호 변경</a></td>
								</tr>
								<tr>
									<th scope="row"><span>이메일</span></th>
									<td>
										<ul class="pta">
											<li><input type="text" class="w134" name="email_id" value="${ email_id }"/></li>
											<li><span class="valign">&nbsp;@&nbsp;</span></li>
											<li class="r10"><input type="text" class="w134" name="email_domain" value="${ email_domain }"/></li>
											<input type="hidden" name="m_email" value=""/>
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
									<th scope="row"><span>이메일 수신여부 *</span></th>
									<td>
										<p>쟈뎅에서 진행되는 이벤트와 쇼핑에 대한 정보를 이메일로 받아보시겠습니까?</p>
										<ul class="question">
                                            <c:if test="${ info_view.getM_email_ok() eq '예' }">
    											<li>
    												<input type="radio" name="m_email_ok" value="예" id="receive_yes" class="radio_t" checked="checked"/><label for="receive_yes">예</label>
    											</li>
    											<li>
    												<input type="radio" name="m_email_ok" value="아니오" id="receive_no" class="radio_t"/><label for="receive_no">아니오</label>
    											</li>
										    </c:if>
                                            <c:if test="${ info_view.getM_email_ok() eq '아니오' }">
    											<li>
    												<input type="radio" name="m_email_ok" value="예" id="receive_yes" class="radio_t"/><label for="receive_yes">예</label>
    											</li>
    											<li>
    												<input type="radio" name="m_email_ok" value="아니오" id="receive_no" class="radio_t" checked="checked"/><label for="receive_no">아니오</label>
    											</li>
										    </c:if>
                                        </ul>
										<p class="gray">* 거래관련 정보는 고객님의 거래안전을 위하여 이메일 수신거부와 관계없이 발송됩니다.</p>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>주소 *</span></th>
									<td>
										<ul class="pta">
											<li>
												<input type="text" class="w134" name="m_zipcode" id="m_zipcode" value="${ info_view.getM_zipcode() }"/>&nbsp;
											</li>
											<li><a onclick="execDaumPostcode()" class="addressBtn"><span>우편번호 찾기</span></a></li>
											<li class="pt5"><input type="text" class="addressType" id="m_address1" name="m_address1" value="${ info_view.getM_address1() }" /></li>
											<li class="pt5"><input type="text" class="addressType" id="m_address2" name="m_address2" value="${ info_view.getM_address2() }" /></li>
                                            <li>
												<span class="mvalign">※ 상품 배송 시 받으실 주소입니다. 주소를 정확히 적어 주세요.</span>
											</li>
                                            
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>휴대폰 *</span></th>
									<td>
										<ul class="pta">
											<li>
												<select name="phone1" id="phone1">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>    
													<option value="019">019</option>    
												</select>
											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" name="phone2" value="${ phone2 }"/> <span class="valign">-</span>&nbsp;</li>
											<li class="r10"><input type="text" class="w74" maxlength="4" name="phone3" value="${ phone3 }"/></li>
											<li class="cb pt5"><span class="mvalign">※ SMS 서비스를 받아보시겠습니까?</span></li>
											<li class="pt5">
												<ul class="baseQues">
                                                    <c:if test="${ info_view.getM_sms_ok() eq '예' }">
    													<li>
    														<input type="radio" name="m_sms_ok" value="예" id="sms_yes" class="radio_t" checked="checked"/><label for="sms_yes">예</label>
    													</li>
    													<li>
    														<input type="radio" name="m_sms_ok" value="아니오" id="sms_no" class="radio_t"/><label for="sms_no">아니오</label>
    													</li>
                                                    </c:if>
                                                    <c:if test="${ info_view.getM_sms_ok() eq '아니오' }">
    													<li>
    														<input type="radio" name="m_sms_ok" value="예" id="sms_yes" class="radio_t"/><label for="sms_yes">예</label>
    													</li>
    													<li>
    														<input type="radio" name="m_sms_ok" value="아니오" id="sms_no" class="radio_t" checked="checked"/><label for="sms_no">아니오</label>
    													</li>
                                                    </c:if>
												</ul>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>유선전화</span></th>
									<td>
										<ul class="pta">
											<li>
												<select name="tel1" id="tel1">
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
													<option value="010">010</option>
												</select>

											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" value="${tel2 }" name="tel2"/> <span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" value="${tel3 }" name="tel3"/></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>생년월일</span></th>
									<td>
										<ul class="pta">
											<li>
												<select name="birth1" id="birth1">
													<option value=''>선택하세요</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1940; i<=2014; i++){
															document.write("<option value='"+i+"'>" + i + "</option>");	
														};
													//]]>
													</script>
												</select>
											</li>
											<li>&nbsp;<span class="valign">년</span>&nbsp;&nbsp;&nbsp;</li>
											<li>
												<select name="birth2" id="birth2">
													<option value=''>선택하세요</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1; i<=12; i++){
															if(i<10){
																document.write("<option value='0"+i+"'>0" + i +"</option>");
															}else{
																document.write("<option value='"+i+"'>" + i + "</option>");
															};
														};
													//]]>
													</script>
												</select>
											</li>
											<li>&nbsp;<span class="valign">월</span>&nbsp;&nbsp;&nbsp;</li>
											<li>
												<select name="birth3" id="birth3">
													<option value=''>선택하세요</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1; i<=31; i++){
															if(i<10){
																document.write("<option value='0"+i+"'>0" + i +"</option>");
															}else{
																document.write("<option value='"+i+"'>" + i + "</option>");
															};
														};
													//]]>
													</script>
												</select>
											</li>
											<li class="r20">&nbsp;<span class="valign">일</span></li>
                                            
											<li class="pt5">
												<ul class="baseQues">
                                                    <c:if test="${ info_view.getM_birth_sort() eq '양력' }">
    													<li>
    														<input type="radio" name="m_birth_sort" value="양력" id="solar" class="radio_t" checked="checked"/><label for="solar">양력</label>
    													</li>
    													<li>
    														<input type="radio" name="m_birth_sort" value="음력" id="lunar" class="radio_t"/><label for="lunar">음력</label>
    													</li>
											 	    </c:if>
                                                    <c:if test="${ info_view.getM_birth_sort() eq '음력' }">
    													<li>
    														<input type="radio" name="m_birth_sort" value="양력" id="solar" class="radio_t"/><label for="solar">양력</label>
    													</li>
    													<li>
    														<input type="radio" name="m_birth_sort" value="음력" id="lunar" class="radio_t" checked="checked"/><label for="lunar">음력</label>
    													</li>
											 	    </c:if>
                                                </ul>
											</li>
										</ul>
									</td>
								</tr>
							</tbody>
							</table>
						</div>
					</form>	

					</div>
            
					
					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bCenter">
							<ul>
								<li><a href="change_info" class="nbtnbig">취소하기</a></li>
								<li><a href="#" class="sbtnMini" onclick="info_submit()">수정하기</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->


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

	$(".nbtnMini").fancybox({
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
<!-- <script type="text/javascript" src="user/js/common.js"></script> -->




			</div>
			<!-- //contents -->


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