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
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<script type="text/javascript" src="admin/js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="admin/js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="admin/js/prefixfree.dynamic-dom.min.js"></script>  
        <!-- 기능, css 수정  -->
        <script type="text/javascript" src="admin/js/admin_board.js"></script>    
		<link rel="stylesheet" type="text/css" href="admin/css/list_button.css">              
		<style type="text/css">
			
			#search_form table{
				text-align: left;
				margin-bottom: 50px;
			}
			
			#search_form table tr:NTH-LAST-CHILD(1){
				text-align: center;
			}
			
			#event_list img{
				width: 400px;
				height: 250px;
			}
			#search_date td button{
				border: 1px solid black;
				padding: 4px;
			}
		</style>
		<script type="text/javascript">

		
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
		
		
</script>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>상품 리스트</h1>
		<div id="main_list">
			<div id="main_user_list">
				<h2>임시로 놔두기</h2>
				<div class="list_count">임시로 놔두기(총 게시물 수 등등 표시?)</div>
				<div id="search_form">
					<form name="inputform" method="get" onsubmit="return false;">
					<table border="1">
						<tr>
							<td>검색어</td>
							<td><select name="">
								<option>아이디</option>
								<option>글제목</option>
								<option>글내용</option>
							</select>
							<input type="text" name="검색키워드">
							</td>
						</tr>
						<tr id="search_date">
							<td>기간검색</td>
							<td>
						<!--  <fmt:formatDate var="sys" value="${sysdate}" pattern="yyyy-MM-dd"/>-->	
							<select name="****미정****" >
								<option>등록일</option>
								<option>수정일</option>
							</select>
							<input type="date" name="e_start_day" id="e_start_day" onchange="date_chk2()"> ~ 
							<input type="date" name="e_end_day" id="e_end_day" value="${sys}" onchange="date_chk2()">
							<button type="button" onclick="search_date('today')">오늘</button>
							<button type="button" onclick="search_date('7day')">7일</button>
							<button type="button" onclick="search_date('15day')">15일</button>
							<button type="button" onclick="search_date('1month')">1개월</button>
							<button type="button" onclick="search_date('3month')">3개월</button>
							<button type="button" onclick="search_date('all')">전체</button>
							</td>
						</tr>
						<tr>
							<td colspan="2"><button onclick="search()">검색</button></td>
							<td></td>
						</tr>
					</table>
					</form>
					
				</div>
				<div>
					<button type="button" onclick="location.href='event_applicants'" class="new_insert_btn">
						신청자 리스트
					</button>
					<button type="button" onclick="location.href='event_write'" class="new_insert_btn">
						새 글 등록
					</button>					
				</div>				
				<div>
					<table border="1" id="event_list">
						<tr>
							<th><input type="checkbox"  id="check_all"  ></th>						
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>시작일</th>
							<th>종료일</th>
							<th>쿠폰</th>
							<th>당첨자 발표일</th>
							<th>이벤트 상태</th>
							<th>수정/삭제</th>							
						</tr>
						<c:forEach var="AllDtos" items="${AllDtos }">
						<tr>
							<td><input type="checkbox" name="chk_ids"  value="${AllDtos.eventdto.e_num}"></td>
							<td>${AllDtos.eventdto.rownum }</td>
							<td>
								<a href="event_view?e_num=${AllDtos.eventdto.e_num}"> 
									${AllDtos.eventdto.e_title }
								</a>
							</td>
							<td>${AllDtos.admindto.ad_grade }(${AllDtos.admindto.ad_id })</td>
							<td>${AllDtos.eventdto.e_sysdate }</td>
							<td>${AllDtos.eventdto.e_start_day }</td>
							<td>${AllDtos.eventdto.e_end_day }</td>		
							<c:if test="${AllDtos.eventdto.co_num!=null }">
								<td>있음</td>
							</c:if>			
							<c:if test="${AllDtos.eventdto.co_num==null }">
								<td>없음</td>
							</c:if>								
							<td>${AllDtos.eventdto.e_win_day }</td>
							<td>${ AllDtos.eventdto.e_status}</td>
							<td>
								<button type="button" onclick="location.href='event_view?e_num=${AllDtos.eventdto.e_num}'">
									수정
								</button>
								<button type="button" onclick="del_check(${AllDtos.eventdto.e_num})">삭제</button>
							</td>
						</tr>
						</c:forEach>						
					</table>
					<div class="detail_btn" style="text-align:left; cursor:pointer;">
						<a onclick="eventSomeDelete()">선택 삭제</a>
						<!-- 선택된 체크박스 값 체크용 -->
						<input type="hidden" name="hiddenValue" id="hiddenValue" value=""/>						
					</div>
				</div>
			</div>
				</div>
	</section>
	</body>
</html>