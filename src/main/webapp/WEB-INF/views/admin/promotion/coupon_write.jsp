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
		<title>쿠폰 등록</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="admin/se2/js/HuskyEZCreator.js" charset="utf-8"></script> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
			var start = inputform.co_start_day.value;
			var end = inputform.co_end_day.value;
			
			var date1 = new Date();
			var start_date = new Date(start);
			var end_date = new Date(end);
			if(end_date.getTime()<date1.getTime()){
				alert("종료일은 오늘 날짜 이후 or 시작일 이후의 날짜를 선택해주세요.");
				inputform.e_end_day.value ="";
				return false;
			}
			if(end_date.getTime()<start_date.getTime()){
				alert("시작일 이후의 날짜를 선택해주세요.");
				inputform.e_end_day.value ="";
				return false;
			}
		}
		
		function radio(val){
			if(val=="expiry_o"){
				$("#expiry_none").css("display", "none");
				$("#expiry_tr").css("display", "block");
			}else if(val=="expiry_x"){
				$("#expiry_tr").css("display", "none");
				$("#expiry_none").css("display", "block");
			}
		}
		
		</script>
		<style type="text/css">
			#input_form{
			margin: 20px;	
			}
			table {
				margin:0 auto;
				 min-width: 1000px;
			}
			#btn_div{
			 text-align: center;
			}
			#expiry_tr{
				display: none;
			}
		</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>쿠폰 입력</h1>
			<form action="inputform" name="" method="get">
				<div id="input_form">
					<table border="1">
						<tr>
							<td>쿠폰명</td>
							<td><input type="text" name="co_name"></td>
						</tr>
						<tr>
							<td>쿠폰 다운로드 기간</td>
							<fmt:formatDate var="sys" value="${sysdate}" pattern="yyyy-MM-dd"/>
							<td>시작일 : <input type="date" name="co_start_day"  value="${sys}" onchange="date_chk1()"> ~ 
							종료일 : <input type="date" name="co_end_day" onchange="date_chk1()"></td>
						</tr>
						<tr>
							<td>쿠폰 사용기간</td>
							<td>
								<input type="radio" name="co_select" value="expiry_o" onchange="radio(this.value)"> 쿠폰을 다운로드 한 날짜부터의 유효기간을 지정합니다.<br>
								<input type="radio" name="co_select" value="expiry_x" onchange="radio(this.value)" checked> 쿠폰 사용 종요일을 최종 사용일로 지정합니다.(사용 기간 쿠폰종료일 까지)
							</td>
						</tr>
						<tr >
							<td>쿠폰 유효기간</td>
							<td  id="expiry_tr">다운로드 일부터 <input type="text" maxlength="3">일 까지</td>
							<td  id="expiry_none">지정안함</td>
						</tr>
						<tr >
							<td>쿠폰 타입</td>
							<td>
								<select name="co_discount">
									<option value="delivery">배송비</option>
									<option value="product">제품</option>
									<option value="cart">장바구니</option>
								</select>
							</td>
						</tr>
						<tr >
							<td>할인금액</td>
							<td><input type="text" maxlength="5">원 할인</td>
						</tr>
					</table>
					<div id="btn_div">
						<button type="button" onclick="location.href="입력전페이지 이동">취소</button>
						<button type="button" onclick="location.href="유효성 검사">등록</button>
					</div>
				</div>
			</form>
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
