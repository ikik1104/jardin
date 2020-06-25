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
		<title>이벤트 신청자 리스트</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<script type="text/javascript" src="admin/js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="admin/js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="admin/js/prefixfree.dynamic-dom.min.js"></script>
        <!-- 기능, css 수정  -->
        <script type="text/javascript" src="admin/js/admin_board.js"></script>    
		<link rel="stylesheet" type="text/css" href="admin/css/list_button.css">     
		<link rel="stylesheet" type="text/css" href="admin/css/a_setting.css">	      
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
			.user_title{
				width:20%; overflow:hidden; text-overflow:ellipsis;
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
		<h1>이벤트 신청자 관리</h1>
		<div id="main_list">
			<div id="main_user_list">
				<h2>신청자 검색</h2>
				<div class="list_count">총 신청자 수 : ${apply_list.size() }</div>
				<div id="search_form">
					<form name="inputform" method="get" onsubmit="return false;">
					<table border="1">
						<tr id="search_date">
							<td>신청일</td>
							<td colspan="3">
							<fmt:formatDate var="sys" value="${sysdate}" pattern="yyyy-MM-dd"/>
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
							<td>이벤트 상태</td>
							<td><select name="keysort">
								<option>전체</option>							
								<option>진행중</option>
								<option>시작전</option>
								<option>종료</option>
							</select>
							<input type="text" name="keyword">
							</td>
							<td>이벤트명</td>
							<td>
								<select name="keysort">
									<option>전체</option>
									<!-- 이벤트 명 넣어주기 -->
								</select>
								<input type="text" name="keyword">
							</td>							
						</tr>
						
						<tr>
							<td>신청자</td>
							<td colspan="3"><select name="status">
								<option>선택안함</option>
								<option>아이디</option>
								<option>이름</option>
							</select>
							</td>
						</tr>
						<tr>
							<td colspan="4"><button onclick="search()">검색</button></td>
						</tr>
					</table>
				</form>
					
				</div>
				
				<div class="detail_btn" style="text-align:left; cursor:pointer; margin-bottom:10px;">
					<button onclick="location.href='event_list'">이벤트 리스트</button>											
				</div>					
				
				<div>
					<!-- 등록된 신청자 없을 경우 -->
					<c:if test="${apply_list.size()==0 }">
						※등록된 신청자가 없습니다.
					</c:if>
					<!-- 등록된 1:1문의 있을 경우 -->
					<c:if test="${apply_list.size()!=0 }">
					<table border="1" id="event_list" >
						<tr>
							<th><input type="checkbox"  id="check_all" ></th>
							<th>번호</th>
							<th>아이디</th>
							<th>신청일</th>
							<th>이벤트명</th>
							<th>이벤트 상태</th>
							<th>당첨 상태</th>							
							<th>당첨/삭제</th>
							
						</tr>
						<c:forEach var="apply_list" items="${apply_list }">
						<tr>
							<td><input type="checkbox" name="chk_ids"  value="${apply_list.e_commentdto.ec_num}"></td>
							<td>
								${apply_list.eventdto.rownum }
							</td>
							<td>${apply_list.memberdto.m_id }</td>
							<td>${apply_list.utildto.str1 }</td>
							<td class="user_title">
								<a class="user_title" href="event_view?e_num=${apply_list.eventdto.e_num }">
									${apply_list.eventdto.e_title }
								</a>
							</td>
							<td>${apply_list.eventdto.e_status }</td>
							<td>${apply_list.e_commentdto.ec_status }</td>							
							<td>
								<c:if test="${ apply_list.e_commentdto.ec_status=='당첨'}">
									<button type="button" onclick="back_check(${apply_list.e_commentdto.ec_num})">당첨취소</button>
								</c:if>
								<c:if test="${ apply_list.e_commentdto.ec_status=='미당첨'}">
									<button type="button" onclick="win_check(${apply_list.e_commentdto.ec_num})">당첨</button>
								</c:if>									
								<button type="button" onclick="del_check(${apply_list.e_commentdto.ec_num})">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="detail_btn" style="text-align:left; cursor:pointer;">
					<input type="hidden" id="win_lose_sign">
					<a onclick="applicantSomeWin()">선택 당첨/당첨취소</a>					
					<a onclick="applicantSomeDelete()">선택 삭제</a>
					<!-- 선택된 체크박스 값 체크용 -->
					<input type="hidden" name="hiddenValue" id="hiddenValue" value=""/>						
				</div>				
				</c:if>
				</div>
			</div>
				</div>
	</section>
	</body>
</html>