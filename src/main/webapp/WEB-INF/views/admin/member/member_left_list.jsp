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
		<title>탈퇴 회원 관리</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<script type="text/javascript" src="admin/js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="admin/js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="admin/js/prefixfree.dynamic-dom.min.js"></script>
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
/*
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
*/
		//회원 영구삭제 체크 
		function del_check(m_num){
			if(confirm("해당 회원을 영구삭제 하시겠습니까? \n(영구삭제한 데이터는 복구할 수 없습니다.)")){
	            $.ajax({
	                  url : "member_forever_delete",
	                  method : "POST",
	                  data: JSON.stringify(m_num),
	                  dataType : "json",
	                  contentType: "application/json",
	                  success : function(val){
	                     if(val == 1){ //리턴값이 1이면 (=성공)
	                        alert("영구삭제 완료되었습니다.");
	                        location.reload(); //페이지 새로고침
	                     }else{ // 0이면 실패
	                        alert("영구삭제 실패.");
	                     }
	                  },
	                  error : function(){
	                     alert("서버통신실패");
	                  }
	               });
	         }
		}
</script>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>탈퇴 회원 관리</h1>
		<div id="main_list">
			<div id="main_user_list">
				<h2>탈퇴 회원 검색</h2>
				<div class="list_count">임시로 놔두기(총 게시물 수 등등 표시?)</div>
				<div id="search_form">
					<form name="inputform" method="get" onsubmit="return false;">
					<table border="1">
						<tr id="search_date">
							<td>탈퇴일</td>
							<td>
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
							<td>탈퇴 사유</td>
							<td>
								<select>
									<option>전체</option>
									<!-- 여기 코딩 -->
								</select>
								<input type="text" name="keyword">
							</td>
						</tr>						
						<tr>
							<td>아이디 검색</td>
							<td>
								<input type="text" name="keyword">
							</td>
						</tr>
						<tr>
							<td colspan="2"><button onclick="search()">검색</button></td>
						</tr>
					</table>
				</form>
			</div>
			
				<div>
					<table border="1" id="event_list">
						<tr>
							<th><input type="checkbox" ></th>
							<th>번호</th>
							<th>아이디</th>
							<th>가입일</th>
							<th>최종 로그인</th>						
							<th>탈퇴일</th>
							<th>탈퇴 사유</th>
							<th>영구삭제</th>
						</tr>
						<c:forEach var="member_list" items="${member_list }">
						<tr>
							<td><input type="checkbox"></td>
							<td>${member_list.memberdto.rownum }</td>
							<td>
								<a href="member_left_view?m_num=${member_list.memberdto.m_num }">
								${member_list.memberdto.m_id }
								</a>
							</td>
							<td>${member_list.memberdto.m_join_date }</td>
							<td>${member_list.memberdto.m_last_login }</td>
							<td>${member_list.memberdto.m_left_date }</td>
							<td>${member_list.memberdto.m_left_reason }</td>		
							<td>
								<button type="button" onclick="del_check(${member_list.memberdto.m_num})">영구삭제</button>
							</td>
						</tr>
						</c:forEach>
						
						
					</table>
					
					<div>				
						<button>선택 영구삭제</button>
					</div>


				</div>
			</div>
				</div>
	</section>
	</body>
</html>