<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<jsp:useBean id="sysdate" class="java.util.Date"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이벤트 새 글 등록</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="se2/admin/js/HuskyEZCreator.js" charset="utf-8"></script> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <!-- css, 기능 수정 -->
 		<link rel="stylesheet" type="text/css" href="admin/css/admin_view.css">	 
        <script type="text/javascript" src="admin/js/admin_board.js"></script>	 		  
		<link rel="stylesheet" type="text/css" href="admin/css/a_setting.css">
		<!-- 페이지 로딩시 초기화 --> 
		<script>
		$(document).ready(function(){
				nhn.husky.EZCreator.createInIFrame({ 
					oAppRef: editor, 
					elPlaceHolder: 'txtContent', 
					sSkinURI: '/plugin/smarteditor2/SmartEditor2Skin.html', 
					fCreator: 'createSEditor2' 
					}); 
				}); 
		
		function date_chk1(){
			
			
			var start = inputform.str5.value;
			var end = inputform.str6.value;
			
			var date1 = new Date();
			var start_date = new Date(start);
			var end_date = new Date(end);
			if(end_date.getTime()<date1.getTime()){
				alert("종료일은 오늘 날짜 이후 or 시작일 이후의 날짜를 선택해주세요.");
				inputform.str6.value ="";
				return false;
			}
			if(end_date.getTime()<start_date.getTime()){
				alert("시작일 이후의 날짜를 선택해주세요.");
				inputform.str6.value ="";
				return false;
			}
		
		}
		
		function date_chk2(win){
	
			
		
	
			var end = inputform.str5.value;
			
			var end_date = new Date(end);
			var win_date = new Date(win);
			
			if(end == null || end == ""){
				alert("이벤트 시작/종료일을 먼저 선택해 주세요.");
				inputform.str7.value ="";
				return false;
			}
			
			if(win_date.getTime()<end_date.getTime()){
				alert("이벤트 종료일 이후의 날짜를 선택해주세요.");
				inputform.str7.value ="";
				return false;
			}
			
		
		}
		
		window.onload=function(){
			${alerttext}
			
			$('#byte_alert').hide();		
			
			 var str = $('.modify_textarea').val();
			 var len=0;
			 
			 if(str!=undefined && str!=null && str!=''){
			 for (var i = 0; i < str.length; i++) {
			        if (escape(str.charAt(i)).length == 6) {
			            len+=2;
			        }
			        len++;
			    }
			  }
			 
			$('#present_byte').html(len);
			
			$('#byte_alert2').hide();		
			
			 var str2 = $('.modify_textarea2').val();
			 var len2=0;
			 
			 if(str2!=undefined && str2!=null && str2!=''){
			 for (var i = 0; i < str2.length; i++) {
			        if (escape(str2.charAt(i)).length == 6) {
			            len2+=2;
			        }
			        len2++;
			    }
			 }
			$('#present_byte2').html(len2);	
		}
		
		function resize(obj) {
			  
			  var str = $('.modify_textarea').val();
			    var len = 0;
			    for (var i = 0; i < str.length; i++) {
			        if (escape(str.charAt(i)).length == 6) {
			            len+=2;
			        }
			        len++;
			    }
			     if(len>90){
			    	$('#byte_alert').show();
			    	$('#byte_excess').val('on');
			     } else {
			    	 $('#byte_alert').hide();
			    	 $('#byte_excess').val('off');
			     }
			     
			  	$('#present_byte').html(len);
			  
			}
			
		function resize2(obj) {
			  
			  var str = $('.modify_textarea2').val();
			    var len = 0;
			    for (var i = 0; i < str.length; i++) {
			        if (escape(str.charAt(i)).length == 6) {
			            len+=2;
			        }
			        len++;
			    }
			     if(len>4000){
			    	$('#byte_alert2').show();
			    	$('#byte_excess2').val('on');
			     } else {
			    	 $('#byte_alert2').hide();
			    	 $('#byte_excess2').val('off');
			     }
			     
			  	$('#present_byte2').html(len);
			  
			}
		
		</script>
		<style type="text/css">
			#input_form{
			margin: 20px;	
			}
			table {
				 min-width: 1000px;
			}
			table tr td:NTH-OF-TYPE(1) {
				width: 100px;
				height: 30px;
			}
			#btn_div{
			 text-align: center;
			}
			.notice_th{
				width:15%;
			}
			input{
			border:none; background:inherit;
			}
			.modify_textarea{
				overflow:hidden;
			}
			.byte_area, .byte_area2{
				text-align:right; padding-right:10px;
			}
			#byte_alert, #byte_alert2{
				color:red;
			}		
		</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>이벤트 등록</h1>
			<form action="event_insert" name="inputform" method="post"id="event_insert"  enctype="multipart/form-data" >
				<div id="input_form">
					<table border="1" style="margin-top:10px; width:1000px; margin-bottom:10px; font-size:15px;">	
						<tr>
							<th class="notice_th">작성자</th>
							<td>${adminGrade }(${adminId })</td>
						</tr>					
						<tr>
							<th class="notice_th">글 제목</th>
							<td><input  class="modify_textarea" onkeyup="resize(this)" maxlength="90"  type="text" name="str1" style="border:none; background:inherit; height:40; font-size:15px; padding:3px 0; width:800px;">
							<p class="byte_area"><span id="byte_alert">※최대 입력 글자 수를 초과했습니다. </span><span id="present_byte"></span> /90 byte</p>
							<input type="hidden" id="byte_excess" name="byte_excess">
							</td>
						</tr>
						<tr>
							<th class="notice_th">글 내용</th>
							<td><textarea   class="modify_textarea2" onkeyup="resize2(this)" name="str2" id="smartEditor" style="width:100%; height: 412px;"></textarea>
							<p class="byte_area2"><span id="byte_alert2">※최대 입력 글자 수를 초과했습니다. </span><span id="present_byte2"></span> /4000 byte</p>
							<input type="hidden" id="byte_excess2" name="byte_excess2">
							</td>
						</tr>
						<tr>
							<th class="notice_th">이벤트 기간</th>
							<fmt:formatDate var="sys" value="${sysdate}" pattern="yyyy-MM-dd"/>
							<td>시작일 : <input type="date" name="str5"  value="${sys}" onchange="date_chk1()"> ~ 
							종료일 : <input type="date" name="str6" onchange="date_chk1()">
							</td>
						</tr>
						<tr>
							<th class="notice_th">썸네일 이미지</th>
							<td><!--  <input type="file" name="e_thumb_img">-->
								<input type="file" name="thumb_img" style="width:800px; padding:5px 0;">
							</td>
						</tr>
						<tr>
							<th class="notice_th">내용 이미지</th>
							<td><!-- <input type="file" name="e_content_img"> -->
								<input type="file" name="content_img" style="width:800px; padding:5px 0;">												
							</td>
						</tr>
						<tr>
							<th class="notice_th">쿠폰</th>
							<td>
							<select name="str8"> <!-- model에 쿠폰 리스트 같이 보내서 ${coupon.name} , ${coupon.seq}사용 -->
								<option value="">쿠폰없음</option>
								<c:forEach var="AllDtos" items="${AllDtos }">
									<c:if test="${AllDtos.coupondto.co_type=='cart' }">
										<option value="${AllDtos.coupondto.co_num}">[장바구니쿠폰]${AllDtos.coupondto.co_name}</option>
									</c:if>
									<c:if test="${AllDtos.coupondto.co_type=='delivery' }">
										<option value="${AllDtos.coupondto.co_num}">[배송비쿠폰]${AllDtos.coupondto.co_name}</option>
									</c:if>
									<c:if test="${AllDtos.coupondto.co_type=='product' }">
										<option value="${AllDtos.coupondto.co_num}">[제품쿠폰]${AllDtos.coupondto.co_name} / ${AllDtos.productdto.p_name}</option>
									</c:if>
								</c:forEach>
							</select>
							
							</td>
						</tr>
						<tr>
							<th class="notice_th">당첨자 발표일</th>
							<td>
							<input type="date" name="str7" >
							</td>
						</tr>
					</table>
					
					<div class="detail_btn" style="width:1000px;">
						<a onclick="location.href='event_list'">목록</a>				
						<a onclick="event_insert()">등록</a>														
					</div>					
				</div>
				<input type="hidden" value="${adminNum }" name="temp_int">
			</form>
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
