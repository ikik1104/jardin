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
	
		//1:1문의 삭제 체크 
		function del_check(iu_num){
			if(confirm("해당 게시글을 삭제하시겠습니까? (삭제한 데이터는 복구할 수 없습니다.)")){
	            $.ajax({
	                  url : "mtm_delete",
	                  method : "POST",
	                  data: JSON.stringify(iu_num),
	                  dataType : "json",
	                  contentType: "application/json",
	                  success : function(val){
	                     if(val == 1){ //리턴값이 1이면 (=성공)
	                        alert("삭제처리 완료되었습니다.");
	                     //location.href="product_list";
	                        location.reload(); //페이지 새로고침
	                     }else{ // 0이면 실패
	                        alert("삭제처리 실패.");
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
		<h1>1:1문의 관리</h1>
		<div id="main_list">
			<div id="main_user_list">
				<h2>게시글 검색</h2>
				<div class="list_count">임시로 놔두기(총 게시물 수 등등 표시?)</div>
				<div id="search_form">
					<form name="inputform" method="get" onsubmit="return false;">
					<table border="1">
						<tr id="search_date">
							<td>등록일</td>
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
							<td>검색어</td>
							<td><select name="keysort">
								<option>아이디</option>
								<option>글제목</option>
								<option>글내용</option>
							</select>
							<input type="text" name="keyword">
							</td>
						</tr>
						
						<tr>
							<td>답변상태</td>
							<td><select name="status">
								<option>전체</option>
								<option>답변대기</option>
								<option>답변완료</option>
							</select>
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
							<th>제목</th>
							<th>분류</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>답변상태</th>
							
							<th>답변/삭제</th>
						</tr>
						<c:forEach var="mtm_list" items="${mtm_list }">
						<tr>
							<td><input type="checkbox"></td>
							<td>${mtm_list.mtmuserdto.rownum }</td>
							<td>
								<a href="mtm_view?m_id=${mtm_list.memberdto.m_id }&rownum=${mtm_list.mtmuserdto.rownum }&iu_num=${mtm_list.mtmuserdto.iu_num}
								&iu_title=${mtm_list.mtmuserdto.iu_title}&iu_content=${mtm_list.mtmuserdto.iu_content}&iu_sort=${mtm_list.mtmuserdto.iu_sort}&iu_date=${mtm_list.mtmuserdto.iu_date}
								&iu_status=${mtm_list.mtmuserdto.iu_status}&iu_img=${mtm_list.mtmuserdto.iu_img}"> 
									${mtm_list.mtmuserdto.iu_title }
								</a>
							</td>
							<td>${mtm_list.mtmuserdto.iu_sort }</td>
							<td>${mtm_list.memberdto.m_id }</td>
							<td>${mtm_list.mtmuserdto.iu_date }</td>
							<td>${mtm_list.mtmuserdto.iu_status }</td>
							<td>
								<button type="button" onclick="location.href='mtm_view?m_id=${mtm_list.memberdto.m_id }&rownum=${mtm_list.mtmuserdto.rownum }&iu_num=${mtm_list.mtmuserdto.iu_num}
									&iu_title=${mtm_list.mtmuserdto.iu_title}&iu_content=${mtm_list.mtmuserdto.iu_content}&iu_sort=${mtm_list.mtmuserdto.iu_sort}&iu_date=${mtm_list.mtmuserdto.iu_date}
									&iu_status=${mtm_list.mtmuserdto.iu_status}&iu_img=${mtm_list.mtmuserdto.iu_img}'">
									답변
								</button>
								<button type="button" onclick="del_check(${mtm_list.mtmuserdto.iu_num})">삭제</button>
							</td>
						</tr>
						</c:forEach>
						
						
					</table>
					<div class="detail_btn">
						<a href="#">임시버튼</a>
					</div>
				</div>
			</div>
				</div>
	</section>
	</body>
</html>