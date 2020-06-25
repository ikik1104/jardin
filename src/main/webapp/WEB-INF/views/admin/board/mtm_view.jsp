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
		<title>1:1문의 조회/답변</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<link rel="stylesheet" type="text/css" href="admin/css/admin_view.css">		
		<script type="text/javascript" src="admin/js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="admin/js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="admin/js/prefixfree.dynamic-dom.min.js"></script>
        <script type="text/javascript" src="admin/js/admin_board.js"></script>
		<style type="text/css">
			section{
				padding-bottom:300px;
			}
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
			table th{
				width:15%;
			}
			.user_title{
				overflow:hidden; text-overflow:ellipsis;
			}
			.modify_textarea{
				overflow:hidden;
			}
			.byte_area{
				text-align:right; padding-right:10px;
			}
			#byte_alert, #byte_alert2{
				color:red;
			}
		</style>
		<script type="text/javascript">
		$(function(){
			$('#byte_alert').hide();			
			$('#byte_alert2').hide();
			
			var original_height= $('.modify_textarea').prop('scrollHeight');
			$('.modify_textarea').height(12+original_height);
			 var str = $('.modify_textarea').val();
			 var len=str.length;
			$('#present_byte').html(len);

			var original_height2= $('.modify_textarea2').prop('scrollHeight');
			$('.modify_textarea2').height(12+original_height2);
			var str2 = $('.modify_textarea2').val();
			var len2=str2.length;
			$('#present_byte2').html(len2);			
			
			
		});		
		function resize(obj) {
			  obj.style.height = "1px";
			  obj.style.height = (12+obj.scrollHeight)+"px";
			  
			  var str = $('.modify_textarea').val();
			    var len = 0;
			    for (var i = 0; i < str.length; i++) {
			        if (escape(str.charAt(i)).length == 6) {
			            len+=2;
			        }
			        len++;
			    }
			     if(len>4000){
			    	$('#byte_alert').show();
			    	$('#byte_excess').val('on');
			     } else {
			    	 $('#byte_alert').hide();
			    	 $('#byte_excess').val('off');
			     }
			     
			  	$('#present_byte').html(len);
			  
			}
		
		function resize2(obj) {
			  obj.style.height = "1px";
			  obj.style.height = (12+obj.scrollHeight)+"px";
			  
			  var str = $('.modify_textarea2').val();
			    var len = 0;
			    for (var i = 0; i < str.length; i++) {
			        if (escape(str.charAt(i)).length == 6) {
			            len+=2;
			        }
			        len++;
			    }
			     if(len>4000){
				    	$('#byte_alert2').show();
				    	$('#byte_excess2').val('on');
				     } else {
				    	 $('#byte_alert2').hide();
				    	 $('#byte_excess2').val('off');
				     }
			  	$('#present_byte2').html(len);
			  
			}		

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
		<!-- 글자수 입력 초과 신호 -->
		<input type="hidden" id="byte_excess" name="byte_excess">
		<input type="hidden" id="byte_excess2" name="byte_excess2">
	
		<h1>1:1문의 조회/답변</h1>
		
		<div id="user_info_area">
			<h1>게시글 정보</h1>
			<table border="1" id="mtm_table">
				<tr>
					<th>번호</th>
					<td>${mtm_user_info.mtmuserdto.iu_num }</td>
					<th>작성자</th>
					<td>${mtm_user_info.memberdto.m_id }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3" class="user_title">${mtm_user_info.mtmuserdto.iu_title }</td>
				</tr>
				<tr>
					<th>답변상태</th>
					<td colspan="3">${mtm_user_info.mtmuserdto.iu_status }</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${mtm_user_info.utildto.str1}</td>
					<th>분류</th>
					<td>${mtm_user_info.mtmuserdto.iu_sort}</td>
				</tr>										
			</table>
		</div>
		
		<div id="user_content_area">
			<h1>게시글 내용</h1>	
				<table class="content_table">
					<thead>
					</thead>
					<tbody>
					<tr>
						<td class="content_img">
							<c:if test="${mtm_user_info.mtmuserdto.iu_img=='없음' || mtm_user_info.mtmuserdto.iu_img==null}">
							</c:if>
							<c:if test="${mtm_user_info.mtmuserdto.iu_img!='없음' && mtm_user_info.mtmuserdto.iu_img!=null}">
							<img src="tempUpload/${mtm_user_info.mtmuserdto.iu_img }" alt="${ MtmUserDto.iu_img}">
							</c:if>								
							<pre style="white-space:pre-wrap; word-break:break-all; width:1000px;">
${mtm_user_info.mtmuserdto.iu_content }
							</pre>							
						</td>
					</tr>
					</tbody>
				</table>
				<div class="detail_btn">
					<a onclick="user_del_check(${mtm_user_info.mtmuserdto.iu_num})">게시글 삭제</a>
				</div>					
		</div>
		
		<div style="margin-bottom:100px;"  id="answer_info_area">
			<h1>답변 조회/작성/수정</h1>	
					<!-- 답변이 있을 경우 -->
					<c:if test="${ mtm_answer_info.admindto.ad_num!=null}">
						<form action="mtm_answer_modify" method="post" name="modify_form" id="modify_form">
							<!-- 같이 보내줄 데이터 -->
							<input type="hidden" value="${mtm_answer_info.mtmanswerdto.ia_num }" name="ia_num">
							
							<table border="1">
							<tr>
								<th>작성자</th>
								<td>
									${mtm_answer_info.admindto.ad_grade }(${mtm_answer_info.admindto.ad_id })
								</td>
							</tr>
							<tr>
								<th>등록일</th>
								<td>
									${mtm_answer_info.utildto.str1 }
								</td>
							</tr>			
							<tr>
								<th>내용</th>
								<td>
									<!-- 에디터로 수정해야 함★★★★★★★ -->
									<textarea cols="20" wrap="hard" name="ia_content" class="modify_textarea" onkeyup="resize(this)">
${mtm_answer_info.mtmanswerdto.ia_content }</textarea>
									<p class="byte_area"><span id="byte_alert">※최대 입력 글자 수를 초과했습니다. </span><span id="present_byte"></span> /4000 byte</p>
								</td>
							</tr>			
							</table>
							<div class="detail_btn">
								<a onclick="location.href='mtm_list'">목록</a>
								<a onclick="modifyAnswer()">답변수정</a>					
								<a onclick="answer_del_check(${mtm_answer_info.mtmanswerdto.ia_num}, ${ mtm_answer_info.mtmuserdto.iu_num })">삭제</a>					
							</div>																				
						</form>
					</c:if>
					<!-- 답변이 없을 경우 -->					
					<c:if test="${ mtm_answer_info.admindto.ad_num==null}">
						<p style="margin-bottom:10px;">	
								작성한 답변이 없습니다. 아래 양식을 채워서 등록해 주세요.
						</p>
						<form action="mtm_answer_write" method="post" name="write_form" id="write_form">
							<!-- 같이 보내줄 데이터 -->
							<input type="hidden" value="${adminNum }" name="ad_num" id="adminNum">
							<input type="hidden" value="${mtm_user_info.mtmuserdto.iu_num }" name="iu_num" >
						
							<table border="1">
							<tr>
								<th>작성자</th>
								<td>${adminGrade }(${adminId })</td>
							</tr>	
							<tr>
								<th>내용</th>
								<td>
									<!-- 에디터로 수정해야 함★★★★★★★ -->
									<textarea cols="20" wrap="hard" name="ia_content"  class="modify_textarea2" onkeyup="resize2(this)"></textarea>
									<p class="byte_area2"><span id="byte_alert2">※최대 입력 글자 수를 초과했습니다. </span><span id="present_byte2"></span> /4000 byte </p>
								</td>
							</tr>			
							</table>
							<div class="detail_btn">
								<a onclick="location.href='mtm_list'">목록</a>
								<a onclick="insertAnswer()">답변등록</a>		
							</div>								
						</form>						
					</c:if>					
		</div>

	
	</section>
	</body>
</html>