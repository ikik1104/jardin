
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
		<title>당첨자 발표 게시글 관리</title>
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
	
		//당첨자 게시글 삭제 체크 
		function del_check(wb_num){
			if(confirm("해당 게시글을 삭제하시겠습니까? (삭제한 데이터는 복구할 수 없습니다.)")){
	            $.ajax({
	                  url : "win_board_delete",
	                  method : "POST",
	                  data: JSON.stringify(wb_num),
	                  dataType : "json",
	                  contentType: "application/json",
	                  success : function(val){
	                     if(val == 1){ //리턴값이 1이면 (=성공)
	                        alert("삭제처리 완료되었습니다.");
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
		<h1>당첨자 게시글 관리</h1>
		<div id="main_list">
			<div id="main_user_list">
				<!-- <h2>게시글 검색</h2> -->
				<div class="list_count">총 게시글 수 : ${win_board_list.size() }</div>
				<!--  <div id="search_form">
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
							<td>이벤트명</td>
							<td><select name="keysort">
							<!-- 이벤트명 들어가게 코딩 ㄱㄱ -->
							<!-- </select>
							<input type="text" name="keyword">
							</td>
						</tr>						
						<tr>
							<td>검색어</td>
							<td><select name="keysort">
								<option>작성자</option>
								<option>제목</option>
								<option>내용</option>
							</select>
							<input type="text" name="keyword">
							</td>
						</tr>
						<tr>
							<td colspan="2"><button onclick="search()">검색</button></td>
						</tr>
					</table>
					</form>
					
				</div>-->
				<div>
					<button type="button" onclick="location.href='win_board_write'">
						새 글 등록
					</button>
				</div>
				<div>
					<table border="1" id="event_list" style="margin-top:10px;">
						<tr>
							<th><input type="checkbox"   id="check_all"   ></th>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>이벤트명</th>							
							<th>조회수</th>
							<th>수정/삭제</th>
						</tr>
						<c:forEach var="win_board_list" items="${win_board_list }">
						<tr>
							<td><input type="checkbox"  name="chk_ids"  value="${win_board_list.winboarddto.wb_num }"></td>
							<td>${win_board_list.winboarddto.rownum }</td>
							<td>
								<a href="win_board_view?wb_num=${win_board_list.winboarddto.wb_num }"> 
									${win_board_list.winboarddto.wb_title }
								</a>
							</td>
							<td>${win_board_list.admindto.ad_grade }(${win_board_list.admindto.ad_id })</td>
							<td>${win_board_list.utildto.str1 }</td>
							<td>${win_board_list.eventdto.e_title }</td>							
							<td>${win_board_list.winboarddto.wb_hit }</td>
							<td>
								<button type="button" onclick="location.href='win_board_view?wb_num=${win_board_list.winboarddto.wb_num}'">
									수정
								</button>
								<button type="button" onclick="del_check(${win_board_list.winboarddto.wb_num})">삭제</button>
							</td>
						</tr>
						</c:forEach>
						
						
					</table>
					<div class="detail_btn" style="text-align:left; cursor:pointer;">
						<a onclick="winBoardSomeDelete()">선택 삭제</a>
						<!-- 선택된 체크박스 값 체크용 -->
						<input type="hidden" name="hiddenValue" id="hiddenValue" value=""/>						
					</div>
				</div>
			</div>
				</div>
	</section>
	</body>
</html>