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
		<style type="text/css">
			
			#search_form table{
				text-align: left;
				margin-bottom: 40px;
			}
			
			#search_form table tr:NTH-LAST-CHILD(1){
				text-align: center;
			}
			
			#event_list img{
				width: 400px;
				height: 250px;
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
		
		function aa(val) {
			var step2= document.getElementsByClassName("step2");
			
			$(".step2").css("display", "none");
			$("#"+val).css("display", "inline-block");
		}
</script>
	<style type="text/css">
		.step2{
 				display : none;
			}
		#list_div{
			height: 500px;
			overflow: scroll;
		}
		.top_cnt{
			color: red;
		}
		#search2 select {
			float: right;
		}
		#search2 p{
			font-size : 13px;
			display: inline-block;
		}
	</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>아이콘 검색</h1>
		<div id="main_list">
			<div id="main_user_list">
				<h2>임시로 놔두기</h2>
				<div class="list_count">임시로 놔두기(총 게시물 수 등등 표시?)</div>
				<div id="search_form">
					<form name="inputform" method="get" onsubmit="return false;">
					<table border="1">
						<tr>
							<td>아이콘 이름</td>
							<td>
							<input type="text" name="icon_name">
							</td>
						</tr>
						<tr id="search_date">
							<td>기간검색</td>
							<td>
							<fmt:formatDate var="sys" value="${sysdate}" pattern="yyyy-MM-dd"/>
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
							<td>아이콘 이름</td>
							<td>
							<input type="radio" name="icon_state" value="all">전체&nbsp;&nbsp;&nbsp;
							<input type="radio" name="icon_state" value="Y">사용함&nbsp;&nbsp;&nbsp;
							<input type="radio" name="icon_state" value="N">사용안함&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2"><button onclick="search()">검색</button></td>
						</tr>
					</table>
					</form>
				</div>
				<div id="search2">
					<p>검색 <span class="top_cnt">22</span>개 / 전체<span class="top_cnt">22</span>개</p>
					<select name="sort" onchange="에이작스스크립트()">
								<option value="">등록일 ↑</option>
								<option value="">등록일 ↓</option>	
								<option value="">아이콘이름 ↑</option>
								<option value="">아이콘이름 ↓</option>	
							</select>
				</div>
				<div id="list_div">
					<table border="1" id="list_table">
						<tr>
							<th><input type="checkbox"></th>
							<th>번호</th>
							<th>아이콘 이름</th>
							<th>아이콘 이미지</th>
							<th>사용상태</th>
							<th>등록일</th>
							<th>수정일</th>
							<th>수정</th>
						</tr>
						
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td>HOT</td>
							<td><img alt="아이콘 이미지" src="admin/images/event_list_2.jpg" height="40px"></td>
							<td>사용중</td>
							<td>1996.11.04</td>
							<td>1996.11.04</td>
							<td><button type="button" onclick="스크립트()">수정</button></td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td>HOT</td>
							<td><img alt="아이콘 이미지" src="admin/images/event_list_2.jpg" height="40px"></td>
							<td>사용중</td>
							<td>1996.11.04</td>
							<td>1996.11.04</td>
							<td><button type="button" onclick="스크립트()">수정</button></td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td>HOT</td>
							<td><img alt="아이콘 이미지" src="admin/images/event_list_2.jpg" height="40px"></td>
							<td>사용중</td>
							<td>1996.11.04</td>
							<td>1996.11.04</td>
							<td><button type="button" onclick="스크립트()">수정</button></td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td>HOT</td>
							<td><img alt="아이콘 이미지" src="admin/images/event_list_2.jpg" height="40px"></td>
							<td>사용중</td>
							<td>1996.11.04</td>
							<td>1996.11.04</td>
							<td><button type="button" onclick="스크립트()">수정</button></td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td>HOT</td>
							<td><img alt="아이콘 이미지" src="admin/images/event_list_2.jpg" height="40px"></td>
							<td>사용중</td>
							<td>1996.11.04</td>
							<td>1996.11.04</td>
							<td><button type="button" onclick="스크립트()">수정</button></td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td>HOT</td>
							<td><img alt="아이콘 이미지" src="admin/images/event_list_2.jpg" height="40px"></td>
							<td>사용중</td>
							<td>1996.11.04</td>
							<td>1996.11.04</td>
							<td><button type="button" onclick="스크립트()">수정</button></td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td>HOT</td>
							<td><img alt="아이콘 이미지" src="admin/images/event_list_2.jpg" height="40px"></td>
							<td>사용중</td>
							<td>1996.11.04</td>
							<td>1996.11.04</td>
							<td><button type="button" onclick="스크립트()">수정</button></td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td>HOT</td>
							<td><img alt="아이콘 이미지" src="admin/images/event_list_2.jpg" height="40px"></td>
							<td>사용중</td>
							<td>1996.11.04</td>
							<td>1996.11.04</td>
							<td><button type="button" onclick="스크립트()">수정</button></td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td>HOT</td>
							<td><img alt="아이콘 이미지" src="admin/images/event_list_2.jpg" height="40px"></td>
							<td>사용중</td>
							<td>1996.11.04</td>
							<td>1996.11.04</td>
							<td><button type="button" onclick="스크립트()">수정</button></td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td>HOT</td>
							<td><img alt="아이콘 이미지" src="admin/images/event_list_2.jpg" height="40px"></td>
							<td>사용중</td>
							<td>1996.11.04</td>
							<td>1996.11.04</td>
							<td><button type="button" onclick="스크립트()">수정</button></td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td>HOT</td>
							<td><img alt="아이콘 이미지" src="admin/images/event_list_2.jpg" height="40px"></td>
							<td>사용중</td>
							<td>1996.11.04</td>
							<td>1996.11.04</td>
							<td><button type="button" onclick="스크립트()">수정</button></td>
						</tr>
						
					</table>
					<div class="detail_btn">
						<a href="#">임시버튼</a>
					</div>
				</div>
			</div>
				</div>
			</div>
		</div>
	</section>
	</body>
</html>