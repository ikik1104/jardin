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

		function visility_update(status,num) {
			var change;
			
			if(status == "숨김"){
				change = "노출";
			}else{
				change = "숨김";
			}
			
			if(confirm("해당 리뷰의 노출 여부를 '"+change+"' 상태로 변경하시겠습니까?")){
				$.ajax({
				      url : "updateStatus",
				      method : "POST",
				      data: JSON.stringify(num),
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
				$("#keyword").attr("value", "${map.keyword}");      
				$("#e_start_day").attr("value", "${map.e_start_day}"); 
				$("#e_end_day").attr("value", "${map.e_end_day}"); 
			}//if
		});
		function insertAnswer(num) { //답변달기
			var url = "insertReviewAnswerForm?ru_num="+num;
            var name = "insertAnswer";
            var option = "width = 1200, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
			
		}
		
		function UpdateAnswer(num) { //답변 수정하기
			var url = "updateReviewAnswerForm?ru_num="+num;
            var name = "updateAnswer";
            var option = "width = 1200, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
		}
		
		function delAnswer(num) { //답변삭제하기
			if(confirm("해당 답변을 삭제하시겠습니다? (상태는 '답변대기'상태로 변경됩니다.)")){
				$.ajax({
				      type : "POST",
				      url : "review_answer_delete",
				      dataType : "json",
				      data: JSON.stringify(num),
				      contentType: "application/json",
				      success : function(val){
				    	  if(val == 1){ //리턴값이 1이면 (=성공)
					         alert("답변 삭제가 완료되었습니다.");
					         location.reload();
				    	  }else{ // 0이면 실패
				    		  alert("답변삭제 실패.");
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
		<h1>FAQ 리스트</h1>
		<div id="main_list">
			<div id="main_user_list">
				<h2>임시로 놔두기</h2>
				<div class="list_count">임시로 놔두기(총 게시물 수 등등 표시?)</div>
				<div id="search_form">
					<form name="inputform" method="post" action="getSearchReview">
					<table border="1">
						<tr>
							<td>검색어</td>
							<td><select name="type" class="type">
								<option value="ru.ru_title">글제목</option>
								<option value="ru.ru_content">글내용</option>
								<option value="p.p_name">제품명</option>
							</select>
							<input type="text" name="keyword" id="keyword" >
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
							<th colspan="3">답변수정/삭제/추가</th>
							<th></th>
							<th></th>
						</tr>
						<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.ROWNUM}</td>
							<td>${list.RU_NUM}</td>
							<td>${list.P_NAME}</td>
							<td style="cursor: pointer;" onclick="location.href='getReviewDetail?ru_num=${list.RU_NUM}'">${list.RU_TITLE}</td>
							<td>${list.RU_CONTENT}</td>
							<td>${list.RU_SCORE}</td>
							<td>${list.RU_DATE}</td>
							<td>${list.RU_HIT}</td>
							<c:if test="${list.RU_STATUS eq '답변완료'}">
								<td>${list.RU_STATUS}</td>
								<td>${list.RU_VISILITY}</td>
								<td><button type="button" onclick="UpdateAnswer('${list.RU_NUM}')">답변수정</button></td>
								<td><button type="button" onclick="delAnswer('${list.RU_NUM}')">답변삭제</button></td>
							</c:if>
							<c:if test="${list.RU_STATUS eq '답변대기'}">
								<td  style="color: red;">${list.RU_STATUS}</td>
								<td>${list.RU_VISILITY}</td>
								<td colspan="2"><button type="button" onclick="insertAnswer('${list.RU_NUM}')">답변달기</button></td>
							</c:if>
							<td><button type="button" onclick="visility_update('${list.RU_VISILITY}','${list.RU_NUM}')">노출상태 변경</button></td>
							<td><button type="button" onclick="location.href='list_updateForm?f_num=${list.RU_NUM}'">삭제</button></td>
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