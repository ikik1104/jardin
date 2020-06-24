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
			
			/*
			var start = inputform.e_start_day.value;
			var end = inputform.e_end_day.value;
			
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
		*/
		}
		
		function date_chk2(win){
	
			
		/*
	
			var end = inputform.e_end_day.value;
			
			var end_date = new Date(end);
			var win_date = new Date(win);
			
			if(end == null || end == ""){
				alert("이벤트 시작/종료일을 먼저 선택해 주세요.");
				inputform.e_win_day.value ="";
				return false;
			}
			
			if(win_date.getTime()<end_date.getTime()){
				alert("이벤트 종료일 이후의 날짜를 선택해주세요.");
				inputform.e_win_day.value ="";
				return false;
			}
			
		*/
		}
		
		window.onload=function(){
			${alerttext}
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
		</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>이벤트 등록</h1>
			<form action="event_insert" name="inputform" method="post"id="event_insert">
				<div id="input_form">
					<table border="1" style="margin-top:10px; width:1000px; margin-bottom:10px; font-size:15px;">	
						<tr>
							<th class="notice_th">작성자</th>
							<td>${adminGrade }(${adminId })</td>
						</tr>					
						<tr>
							<th class="notice_th">글 제목</th>
							<td><input type="text" name="str1" style="border:none; background:inherit; height:40; font-size:15px; padding:3px 0; width:800px;"></td>
						</tr>
						<tr>
							<th class="notice_th">글 내용</th>
							<td><textarea name="str2" id="smartEditor" style="width:100%; height: 412px;"></textarea></td>
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
								<input type="text" name="str3" value="sample_event.jpg" style="width:800px; padding:5px 0;">
							</td>
						</tr>
						<tr>
							<th class="notice_th">내용 이미지</th>
							<td><!-- <input type="file" name="e_content_img"> -->
								<input type="text" name="str4" value="sample_event_view.jpg" style="width:800px; padding:5px 0;">												
							</td>
						</tr>
						<tr>
							<th class="notice_th">쿠폰</th>
							<td>
							<select name="str8"> <!-- model에 쿠폰 리스트 같이 보내서 ${coupon.name} , ${coupon.seq}사용 -->
								<option value="">쿠폰없음</option>
								<c:forEach var="AllDtos" items="${AllDtos }">
									<option value="${AllDtos.coupondto.co_num}">${AllDtos.coupondto.co_name}</option>
								</c:forEach>
							</select>
							
							</td>
						</tr>
						<tr>
							<th class="notice_th">당첨자 발표일</th>
							<td>
							<input type="date" name="str7" onchange="date_chk2(this.value)" >
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
