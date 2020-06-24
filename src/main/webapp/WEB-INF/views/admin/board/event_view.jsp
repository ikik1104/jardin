<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이벤트 조회/수정</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="se2/admin/js/HuskyEZCreator.js" charset="utf-8"></script> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <!-- css, 기능 수정 -->
 		<link rel="stylesheet" type="text/css" href="admin/css/admin_view.css">	 
        <script type="text/javascript" src="admin/js/admin_board.js"></script>
		<link rel="stylesheet" type="text/css" href="admin/css/list_button.css">          			
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

		function date_chk2(){
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
		}
		
		function search() {
			//ajax 구현 해서 바로 검색결과 띄워주기
			
		}
		
		//구현 끝~! ㅋㅋ
		function search_date(val){
			var start = document.getElementById("e_start_day");
			var end = document.getElementById("e_end_day");
			
			var today = new Date();
			var date = new Date();
			
			if(val == "today"){
				start.valueAsDate = today;
				end.valueAsDate = today;
			}else if(val == "all"){
				start.valueAsDate = null;
				end.valueAsDate = null;
			}else if(val == "7day"){
				var weekDate = today.getTime() - (7 * 24 * 60 * 60 * 1000);
				date.setTime(weekDate);				
				start.valueAsDate = date;
				end.valueAsDate = today;
			}else if(val == "15day"){
				var weekDate = today.getTime() - (15 * 24 * 60 * 60 * 1000);
				date.setTime(weekDate);				
				start.valueAsDate = date;
				end.valueAsDate = today;
			}else if(val == "1month"){
				date.setMonth(date.getMonth() - 1);
				start.valueAsDate = date;
				end.valueAsDate = today;
			}else if(val == "3month"){
				date.setMonth(date.getMonth() - 3);
				start.valueAsDate = date;
				end.valueAsDate = today;
			}
			
			
		}

		//이벤트글을 등록/수정하면 다시 이 페이지로 돌아와 alert을 띄움
		window.onload=function(){
			${alerttext};
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
			table th{
				width:15%;
			}
			.bold_tr{
				font-weight:bold;
			}
			.comment_part{
				background:white; border-top:none; padding:10px 0; padding-left:10px;
			}
			#comment_btn_area{
				border-bottom:none; 
			}
		</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section style="padding-bottom:300px;">

		<h1>이벤트 조회/수정 </h1>
		
	<form action="event_modify" name="inputform" method="post">		
		<div  id="input_form">
			<h1>게시글 조회/수정  <span style="font-size:15px; font-weight:normal;"> * 표시 : 수정 가능 항목</h1>
			<table border="1" style="margin-top:10px; width:1000px; margin-bottom:10px; font-size:15px;">
				<tr>
					<th>번호</th>
					<td>${AllDto.eventdto.e_num }</td>
					<th>작성자</th>
					<td>${AllDto.admindto.ad_grade }(${AllDto.admindto.ad_id })</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td colspan="3">${AllDto.utildto.str5 }</td>
				</tr>							
				<tr>
					<th >* 제목</th>
					<td colspan="3"><textarea name="e_title" style="border:none; background:inherit; height:40; font-size:15px; padding:3px 0;">${AllDto.eventdto.e_title }</textarea></td>
				</tr>

				<tr>
					<th>기존 시작일</th>
					<td>${AllDto.utildto.str1 }</td>
					<th>* 시작일 변경</th>
					<td><input type="date" name="e_start_day"></td>				
				</tr>
				<tr>
					<th>기존 종료일</th>
					<td>${AllDto.utildto.str2 }</td>
					<th>* 종료일 변경</th>
					<td><input type="date" name="e_end_day"></td>				
				</tr>				
				<tr>
					<th>기존 당첨자 발표일</th>
					<td>${AllDto.utildto.str3 }</td>
					<th>* 발표일 변경</th>
					<td><input type="date" name="e_win_day"></td>				
				</tr>				
				<tr>
					<th>진행 상태</th>
					<td colspan="3">${AllDto.utildto.str4 }</td>				
				</tr>					
				<tr>
					<th>기존 썸네일</th>
					<td>${AllDto.eventdto.e_thumb_img }</td>
					<th>* 썸네일 변경</th>
					<td>여기 코딩해야 함</td>				
				</tr>				
				
				<tr>
					<th>기존 첨부이미지</th>
					<td style="width:20%;">${AllDto.eventdto.e_content_img }</td>
					<th>* 첨부이미지 변경</th>
					<td>여기도 코딩 해야 함</td>				
				</tr>		
				<c:if test="${AllDto.eventdto.co_num!=0 }"><!-- 기존에 쿠폰이 있을 경우 -->
				<tr>
					<th>쿠폰번호</th>
					<td>${AllDto.eventdto.co_num }</td>
					<th>쿠폰명</th>
					<td>${AllDto.coupondto.co_name }</td>				
				</tr>		
				<tr>
					<th>* 쿠폰 변경</th><!-- 여기 쿠폰 가져오기 -->
					<td colspan="3">
							<select name="co_num"> <!-- model에 쿠폰 리스트 같이 보내서 ${coupon.name} , ${coupon.seq}사용 -->
								<option value="0">쿠폰없음</option>
								<c:forEach var="coupondtos" items="${CouponDtos }">
									<option value="${coupondtos.coupondto.co_num}">${coupondtos.coupondto.co_name}</option>
								</c:forEach>
							</select>		
					</td>			
				</tr>							
				</c:if>			
				<c:if test="${AllDto.eventdto.co_num==0 }"><!-- 기존에 쿠폰이 없을 경우 -->
				<tr>
					<th>쿠폰번호</th>
					<td>-</td>
					<th>쿠폰명</th>
					<td>-</td>				
				</tr>		
				<tr>
					<th>* 쿠폰 등록</th><!-- 여기 쿠폰 가져오기 -->
					<td colspan="3">
							<select name="co_num"> <!-- model에 쿠폰 리스트 같이 보내서 ${coupon.name} , ${coupon.seq}사용 -->
								<option value="0">쿠폰없음</option>
								<c:forEach var="coupondtos" items="${CouponDtos }">
									<option value="${coupondtos.coupondto.co_num}">${coupondtos.coupondto.co_name}</option>
								</c:forEach>
							</select>			
					</td>			
				</tr>							
				</c:if>							
				<tr>
					<td colspan="4">
						<!-- 텍스트에디터로 변경?★★★★★★★★★ -->
						<textarea wrap="hard" name="e_content" id="smartEditor" style="width:100%; height: 412px;">
${AllDto.eventdto.e_content }</textarea>								
					</td>
				</tr>
			</table>
			<input type="hidden" value=${AllDto.eventdto.e_num } name="e_num">
			<div class="detail_btn" style="width:1000px;">
				<a onclick="location.href='event_list'">목록</a>				
				<a onclick="event_modify()">수정</a>				
				<a  onclick="event_view_del_check(${AllDto.eventdto.e_num })">삭제</a>														
			</div>					
		</div>
		
		<!-- 수정하지 않은 항목에 넣어줄 값들 -->
		<input type="hidden" name="start" value=${AllDto.utildto.str1 }>
		<input type="hidden" name="end" value=${AllDto.utildto.str2 }>
		<input type="hidden" name="win" value=${AllDto.utildto.str3 }>		
		<input type="hidden" name="coupon" value=${AllDto.eventdto.co_num }>		
		<input type="hidden" name="title" value=${AllDto.eventdto.e_title }>		
		<input type="hidden" name="content" value=${AllDto.eventdto.e_content }>				
	</form>
		
		<div style="margin-left:20px;">
			<h1>신청자 댓글</h1>	
			<div class="detail_btn" style="width:1000px; text-align:left; margin-bottom:10px;">
				<a onclick="location.href='event_applicants'" >전체 신청자 리스트</a>																	
			</div>		
				<table border="1" style="margin-top:10px; width:1000px; margin-bottom:10px; font-size:15px;" id="comment_table">
						<c:if test="${ECDtos.size() == 0 }">
							<tr>
								<td>신청자 댓글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${ECDtos.size() != 0 }">
							<c:forEach var="ecdtos" items="${ECDtos }">
								<tr class="bold_tr">
									<td style="background:#d6dce7; padding-top:10px;" > ${ecdtos.memberdto.m_id }  [등록일 : ${ ecdtos.utildto.str1} / 비밀번호 : ${ecdtos.e_commentdto.ec_pw }]
									<button style="float:right; margin-right:20px;" type="button" onclick="comment_del_check(${ecdtos.e_commentdto.ec_num})">삭제</button>							
									</td>						
								</tr>			
								<tr >
									<td style="background:white;"  class="comment_part" id="comment_btn_area">${ecdtos.e_commentdto.ec_content }</td>		
								</tr>	
							</c:forEach>
						</c:if>					
				</table>	
		</div>			
			
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
