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
		<title>회원 등급 변경</title>
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

	//회원등급 변경 시 뜨는 메시지
	window.onload=function(){
		${alerttext}
	}
	//체크박스 전체 선택/해제
	$(document).ready(function(){
		$("#check_all").click(function(){
			
			if($("input:checkbox[id='check_all']").is(":checked")==true){
				$("input:checkbox[name='chk_ids']").prop("checked", true);
			}else{
				$("input:checkbox[name='chk_ids']").prop("checked", false);
			}
			
		});
		
	});



</script>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>회원 등급 변경</h1>
		<div id="main_list">
			<div id="main_user_list">
				<h2>회원 등급 검색</h2>
				<div class="list_count">총 회원 수 : ${ member_list.size()}</div>
				<div id="search_form">
					<form name="inputform" method="get" onsubmit="return false;">
					<table border="1">
						<tr id="search_date">
							<td>가입일</td>
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
							<td>등급</td>
							<td>
								<select>
									<option>전체</option>
									<option>일반</option>
									<option>우수</option>	
								</select>
								<input type="text" name="keyword">
							</td>
						</tr>						
						<tr>
							<td>검색어</td>
							<td>
								<select>
									<option>전체</option>
									<option>아이디</option>
									<option>이름</option>	
								</select>
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
					<form action="member_level_change" method="post" name="checkform">
					<table border="1" id="event_list">
						<tr>
							<th><input type="checkbox" id="check_all" ></th>
							<th>번호</th>
							<th>아이디</th>
							<th>등급</th>
							<th>주문금액</th><!-- orderlistdto -->						
							<th>포인트</th>
							<th>가입일</th>
							<th>최종로그인</th>	
						</tr>
						<c:forEach var="member_list" items="${member_list }">
						<tr>
							<td><input type="checkbox"  name="chk_ids" value="${member_list.memberdto.m_id  }"></td>
							<td>${member_list.memberdto.rownum }</td>
							<td>
								${member_list.memberdto.m_id }
							</td>
							<td>${member_list.memberdto.m_level }</td>
							<td>${member_list.utildto.temp_int }</td>
							<td>${member_list.memberdto.m_point }</td>
							<td>${member_list.memberdto.m_join_date }</td>		
							<td>${member_list.memberdto.m_last_login }</td>	
						</tr>
						</c:forEach>
					</table>
					
					<div>				
						<button type="submit">선택 등급변경</button>
						<select name="select_level">
							<option value="일반">일반</option>
							<option value="우수">우수</option>
						</select>
					</div>
					</form>
				</div>
			</div>
				</div>
	</section>
	</body>
</html>