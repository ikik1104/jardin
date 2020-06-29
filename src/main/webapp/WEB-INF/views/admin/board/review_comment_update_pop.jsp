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
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="admin/js/jquery-3.4.1.min.js"></script>
		<script type="text/javascript" src="user/js/jquery.min.js"></script>
		<!-- 페이지 로딩시 초기화 --> 
		<script>
		//폼 넘기기
		function submit_form() {
			var ra_num = $("#ra_num").val();
	    	var ra_content = $("#ra_content").val();
	    	var form1 = [ra_num,ra_content];
	    	
	    	$.ajax({
			      type : "POST",
			      url : "review_answer_update",
			      dataType : "json",
			      data: JSON.stringify(form1),
			      contentType: "application/json",
			      success : function(val){
			    	  if(val == 1){ //리턴값이 1이면 (=성공)
				         alert("답변수정이 완료되었습니다.");
				         window.opener.location.reload();
				         window.close();
			    	  }else{ // 0이면 실패
			    		  alert("답변등록 실패.");
			    	  }
			      },
			      error : function(){
			         alert("서버통신실패");
			      }
			   });
		}
		
		</script>
		<style type="text/css">
			#input_form{
			margin: 20px;	
			}
			table {
				margin:0 auto;
				 min-width: 1000px;
			}
			table tr td:NTH-OF-TYPE(1) {
				width: 100px;
				height: 30px;
			}
			#btn_div{
			 text-align: center;
			}
			.step2{
 				display : none;
			}
		</style>
	</head>
	<body>
		<h1>답변 수정</h1>
			<form name="inputform" method="post">
				<div id="input_form">
					<table border="1">
						<tr>
							<td>질문 내용</td>
							<td>${dto.RU_CONTENT}</td>
						</tr>
						<tr>
							<td>질문 답변</td>
							<td><textarea name="ra_content" id="ra_content" maxlength="200"  cols="100" rows="20">${dto.RA_CONTENT}</textarea></td>
						</tr>
					</table>
					<div id="btn_div">
						<input type="hidden" name="ra_num" id="ra_num" value="${dto.RA_NUM}">
						<button type="button" onclick="javascript: window.close();">취소</button>
						<button type="button" onclick="submit_form()" >등록</button>
					</div>
				</div>
			</form>
	</body>
</html>
