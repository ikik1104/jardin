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

		function delflag_update(status,num) {
			var change;
			
			if(status == "숨김"){
				change = "노출";
			}else{
				change = "숨김";
			}
			
			if(confirm("해당 게시글의 노출 여부를 '"+change+"' 상태로 변경하시겠습니까?")){
				$.ajax({
				      url : "updateStatus",
				      method : "POST",
				      data: JSON.stringify(ru_num),
				      dataType : "json",
				      contentType: "application/json",
				      success : function(val){
				    	  if(val == 1){ //리턴값이 1이면 (=성공)
					         alert(change+"처리로 변경 되었습니다.");
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
		
		function faq_delete(val) {
			
			if(confirm("해당 faq를 삭제하시겠습니까?")){
				$.ajax({
				      url : "faq_delete",
				      method : "POST",
				      data: JSON.stringify(val),
				      dataType : "json",
				      contentType: "application/json",
				      success : function(val){
				    	  if(val == 1){ //리턴값이 1이면 (=성공)
					         alert("faq가 삭제되었습니다.");
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
		
		function date_chk2(){
			var start = inputform.e_start_day.value;
			var end = inputform.e_end_day.value;
			
			var start_date = new Date(start);
			var end_date = new Date(end);

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
		
		
		//페이지 로딩시
		$(document).ready(function(){
			var id;
			if(${not empty map}){
				//step2
				$(".type option").each(function(){
				    if($(this).val()=="${map.type}"){
				      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
				    }
				});
				
				$(".f_step option").each(function(){
				    if($(this).val()=="${map.f_step}"){
				      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
				    }
				});
				      
				$("#keyword").attr("value", "${map.keyword}");      
				$("#e_start_day").attr("value", "${map.e_start_day}"); 
				$("#e_end_day").attr("value", "${map.e_end_day}"); 
			}//if
		});
		
</script>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>FAQ 리스트</h1>
		<div id="main_list">
			<div id="main_user_list">
				<h2>임시로 놔두기</h2>
				<div class="list_count">임시로 놔두기(총 게시물 수 등등 표시?)</div>
				<div id="search_form">
					<form name="inputform" method="post" action="getSearchFaq">
					<table border="1">
						<tr>
							<td>검색어</td>
							<td><select name="type" class="type">
								<option value="f_title">글제목</option>
								<option value="f_content">글내용</option>
							</select>
							<input type="text" name="keyword" id="keyword">
							</td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td><select name="f_step" class="f_step">
								<option value="회원">회원</option>
								<option value="주문">주문</option>
								<option value="배송">배송</option>
							</select>
							</td>
						</tr>
						<tr id="search_date">
							<td>기간검색</td>
							<td>
							<fmt:formatDate var="sys" value="${sysdate}" pattern="yyyy-MM-dd"/>
							<select name="dateType" >
								<option value="p_sysdate">등록일</option>
							</select>
							<input type="date" name="e_start_day" value="${sys}" id="e_start_day" onchange="date_chk2()"> ~ 
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
							<td colspan="2"><button type="submit">검색</button></td>
							<td></td>
						</tr>
					</table>
					</form>
					
				</div>
				<div>
					<table border="1" id="event_list">
						<tr>
							<th>번호</th>
							<th>리뷰 고유번호</th>
							<th>제품명</th>
							<th>제목</th>
							<th>내용</th>
							<th>평점</th>
							<th>등록일</th>
							<th>조회수</th>
							<th>답변상태</th>
							<th>노출여부</th>
						</tr>
						<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.rownum}</td>
							<td>${list.ru_num}</td>
							<td>${list.p_name}</td>
							<td>${list.ru_title}</td>
							<td>${list.ru_content}</td>
							<td>${list.ru_score}</td>
							<td>${list.ru_date}</td>
							<td>${list.ru_hit}</td>
							<td>${list.ru_status}</td>
							<td>${list.ru_visility}</td>
							<td><button type="button" onclick="location.href='list_updateForm?f_num=${list.ru_num}'">수정</button></td>
							<td><button type="button" onclick="delflag_update('${list.ru_visility}','${list.ru_num}')">노출상태 변경</button></td>
						</tr>
						</c:forEach>
					</table>
					<div class="detail_btn">
						<a href="faq_insertForm">faq작성하기</a>
					</div>
				</div>
			</div>
				</div>
	</section>
	</body>
</html>