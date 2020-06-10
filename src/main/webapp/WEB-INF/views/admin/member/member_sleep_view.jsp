<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보 조회/수정</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="se2/admin/js/HuskyEZCreator.js" charset="utf-8"></script> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- 페이지 로딩시 초기화 --> 
		<script>
	/*
		$(document).ready(function(){
				nhn.husky.EZCreator.createInIFrame({ 
					oAppRef: editor, 
					elPlaceHolder: 'txtContent', 
					sSkinURI: '/plugin/smarteditor2/SmartEditor2Skin.html', 
					fCreator: 'createSEditor2' 
					}); 
				}); 

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
		//회원 탈퇴 체크 
		function del_check(m_num){
			if(confirm("해당 회원을 탈퇴처리 하시겠습니까? \n(탈퇴처리하면 회원 정보가 삭제되며, 삭제한 데이터는 복구할 수 없습니다.)")){
	            $.ajax({
	                  url : "member_delete",
	                  method : "POST",
	                  data: JSON.stringify(m_num),
	                  dataType : "json",
	                  contentType: "application/json",
	                  success : function(val){
	                     if(val == 1){ //리턴값이 1이면 (=성공)
	                        alert("탈퇴처리 완료되었습니다.");
	                        location.href='member_list'; //페이지 새로고침
	                     }else{ // 0이면 실패
	                        alert("탈퇴처리 실패.");
	                     }
	                  },
	                  error : function(){
	                     alert("서버통신실패");
	                  }
	               });
	         }
		}
		
	
		//회원을 수정/탈퇴처리하면 다시 이 페이지로 돌아와 alert을 띄움 - 성공하면 list로 이동, 실패하면 여기 남음
		window.onload=function(){
			${alerttext}
		}
		
		$( document ).ready(function() {
			$("#level_select").val("${member_info.memberdto.m_level }").attr("selected", "selected");
		});
		
		</script>
		<style type="text/css">
			#input_form{
			margin: 20px;	
			}
			table {
				 min-width: 1000px;
			}
			table tr td:NTH-OF-TYPE(1) {
				width: 100px;
				height: 30px;
			}
			#btn_div{
			 text-align: center;
			}
		</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>

		<h1>회원정보 조회/수정</h1>
		
	<form action="member_modify" name="inputform" method="post">		
		<div  id="input_form">
			<h1>회원정보 조회/수정</h1>
			<table border="1">
				<tr>
					<th>회원번호</th>
					<td colspan="3">${member_info.memberdto.m_num }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${member_info.memberdto.m_name }</td>
					<th>아이디</th>
					<td>${member_info.memberdto.m_id }</td>				
				</tr>					
				<tr>
					<th>비밀번호</th>
					<td>
						<textarea name="m_pw">
${member_info.memberdto.m_pw }
						</textarea>
					</td>	
					<th>가입일</th>
					<td>${member_info.memberdto.m_join_date }</td>				
				</tr>					
				<tr>
					<th>이메일</th>
					<td>${member_info.memberdto.m_email }</td>
					<th>이메일 수신</th>
					<td>${member_info.memberdto.m_email_ok }</td>				
				</tr>				
				<tr>
					<th>우편번호</th>
					<td>${member_info.memberdto.m_zipcode }</td>
					<th>주소1</th>
					<td>${member_info.memberdto.m_address1 }</td>				
				</tr>						
				<tr>
					<th>주소2</th>
					<td>${member_info.memberdto.m_address2 }</td>
					<th>휴대전화</th>
					<td>${member_info.memberdto.m_phone }</td>				
				</tr>						
				<tr>
					<th>SMS 수신</th>
					<td>${member_info.memberdto.m_sms_ok }</td>
					<th>유선전화</th>
					<td>${member_info.memberdto.m_tel }</td>				
				</tr>											
				<tr>
					<th>생년월일</th>
					<td>${member_info.memberdto.m_birth }</td>
					<th>양력/음력</th>
					<td>${member_info.memberdto.m_birth_sort }</td>				
				</tr>					
				<tr>
					<th>등급</th>
					<td>	
						<select name="m_level" id="level_select">
							<option value="일반">일반</option>
							<option value="우수">우수</option>							
						</select>
					</td>
					<th>최종 로그인</th>
					<td>${member_info.memberdto.m_last_login }</td>				
				</tr>				
				<tr>
					<th>가입일</th>
					<td colspan="3">${member_info.memberdto.m_join_date }</td>
				</tr>						
			</table>
			<input type="hidden" value=${member_info.memberdto.m_num } name="m_num">
					
			<div id="btn_div">
				<button type="button" onclick="location.href='member_sleep_list'">목록</button>
				<button type="submit" >수정</button>
				<button type="button" onclick="del_check(${member_info.memberdto.m_num })" >탈퇴 처리</button>						
			</div>		
		</div>
		
		<!-- 수정하지 않은 항목에 넣어줄 값들 -->
		<input type="hidden" name="pw" value=${member_info.memberdto.m_pw }>
		<input type="hidden" name="level" value=${member_info.memberdto.m_level }>
	</form>
		
			
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
