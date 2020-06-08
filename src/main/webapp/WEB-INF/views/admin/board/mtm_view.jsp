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
		function user_del_check(iu_num){
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
	                        location.href="mtm_list?rownum=getElementById('rownum')"; //페이지 새로고침
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
		
		function answer_del_check(ia_num, rownum, iu_num){
			var arrNum = [ ia_num, rownum, iu_num];
			if(confirm("해당 답변을 삭제하시겠습니까? (삭제한 데이터는 복구할 수 없습니다.)")){
	            $.ajax({
	                  url : "mtm_answer_delete",
	                  method : "POST",
	                  data: JSON.stringify(arrNum),
	                  dataType : "json",
	                  contentType: "application/json",
	                  success : function(val){
	                     if(val == 1){ //리턴값이 1이면 (=성공)
	                        alert("삭제처리 완료되었습니다.");
	                       location.href='mtm_list?rownum='+rownum;
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
		
		//답변을 등록/수정하면 다시 이 페이지로 돌아와 alert을 띄움
		window.onload=function(){
			${alerttext}
		}
			
</script>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>1:1문의 조회/답변</h1>
		
		<div>
			<h1>게시글 정보</h1>
			<table border="1">
				<tr>
					<th>번호</th>
					<td>${MtmUserDto.iu_num }</td>
					<th>작성자</th>
					<td>${m_id }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3">${MtmUserDto.iu_title }</td>
				</tr>
				<tr>
					<th>답변상태</th>
					<td colspan="3">${MtmUserDto.iu_status }</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${MtmUserDto.iu_date}</td>
					<th>분류</th>
					<td>${MtmUserDto.iu_sort}</td>
				</tr>										
			</table>
		</div>
		
		<div>
			<h1>게시글 내용</h1>	
				<pre style="white-space:pre-warp">
				<!-- 이미지 첨부 
				<c:if test="${MtmUserDto.iu_img!='없음' }">
					<img src="../upload/${MtmUserDto.iu_img}" width="100%" alt="${ MtmUserDto.iu_img}">
				</c:if>
				-->
				${MtmUserDto.iu_content }
				</pre>
				<button type="button" onclick="user_del_check(${MtmUserDto.iu_num})">게시글 삭제</button>
		</div>
		
		<div>
			<h1>답변 조회/작성/수정</h1>	
					<!-- 답변이 있을 경우 -->
					<c:if test="${ MtmAnswerDto.admindto.ad_num!=null}">
						<form action="mtm_answer_modify" method="post" name="modify_form">
							<table border="1">
							<tr>
								<th>작성자</th>
								<td>
									${MtmAnswerDto.admindto.ad_grade }(${MtmAnswerDto.admindto.ad_id })
								</td>
							</tr>
							<tr>
								<th>등록일</th>
								<td>
									${MtmAnswerDto.mtmanswerdto.ia_date }
								</td>
							</tr>			
							<tr>
								<th>내용</th>
								<td>
									<!-- 에디터로 수정해야 함★★★★★★★ -->
									<textarea cols="20" wrap="hard" name="ia_content">
${MtmAnswerDto.mtmanswerdto.ia_content }
									</textarea>
								</td>
							</tr>			
							</table>
						<div>
							<button type="button" onclick="location.href='mtm_list?rownum=${MtmUserDto.rownum}'">목록</button>
							<button type="submit" >답변수정</button>				
							<button type="button" onclick="answer_del_check(${MtmAnswerDto.mtmanswerdto.ia_num}, ${MtmUserDto.rownum}, ${ MtmUserDto.iu_num })">삭제</button>
						</div>																		
							<input type="hidden" value="${MtmUserDto.rownum}" name="rownum">
							<input type="hidden" value="${MtmAnswerDto.mtmanswerdto.ia_num }" name="ia_num">							
						</form>
					</c:if>
					<!-- 답변이 없을 경우 -->					
					<c:if test="${ MtmAnswerDto.admindto.ad_num==null}">
						<p>	
								작성한 답변이 없습니다.
						</p>
						<form action="mtm_answer_write" method="post" name="write_form">
							<table border="1">
							<tr>
								<th>작성자</th>
								<td>${adminGrade }(${adminId })</td>
							</tr>	
							<tr>
								<th>내용</th>
								<td>
									<!-- 에디터로 수정해야 함★★★★★★★ -->
									<textarea cols="20" wrap="hard" name="ia_content"></textarea>
								</td>
							</tr>			
							</table>
							<div>
								<button type="button" onclick="location.href='mtm_list?rownum=${MtmUserDto.rownum}'">목록</button>
								<button type="submit">답변등록</button>
							</div>							
							<input type="hidden" value="${adNum}" name="ad_num">							
							<input type="hidden" value="${MtmUserDto.rownum}" name="rownum">					
							<input type="hidden" value=${ MtmUserDto.iu_num } name="iu_num">		
						</form>						
					</c:if>					
		</div>
	
	</section>
	</body>
</html>