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
		function aa(val) {
		//step1의 value와 step2의 id와 일치한 애들을 class를 빼준다.(일단 전부 넣어주고 나서)
		var step2= document.getElementsByClassName("step2");
		var option = document.getElementById(val);
		
		
		$(".step2").css("display", "none");
		$(".step2").removeAttr("name");
		
		$(option).css("display", "block");
		$(option).attr("name", "p_step2")
		}
		
		function point_change(val) {
			var point = val*0.01;
			$("#point").val(point);
		}
		
		//폼 넘기기
		function submit_form() {
			var ru_num = $("#ru_num").val();
	    	var ra_content = $("#ra_content").val();
	    	var form1 = [ru_num,ra_content];
	    	
	    	$.ajax({
			      type : "POST",
			      url : "review_answer_insert",
			      dataType : "json",
			      data: JSON.stringify(form1),
			      contentType: "application/json",
			      success : function(val){
			    	  if(val == 1){ //리턴값이 1이면 (=성공)
				         alert("답변등록이 완료되었습니다.");
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
		<h1>답변 등록</h1>
			<form name="inputform" method="post">
				<div id="input_form">
					<table border="1">
						<tr>
							<td>질문 내용</td>
							<td>${dto.RU_CONTENT}</td>
						</tr>
						<tr>
							<td>질문 답변</td>
							<td><textarea name="ra_content" id="ra_content" maxlength="200" cols="100" rows="20"></textarea></td>
						</tr>
					</table>
					<div id="btn_div">
						<input type="hidden" name="ru_num" id="ru_num" value="${dto.RU_NUM}">
						<button type="button" onclick="location.href="입력전페이지 이동">취소</button>
						<button type="button" onclick="location.href="유효성 검사">등록</button>
						<button type="button" onclick="submit_form()" >임시등록</button>
					</div>
				</div>
			</form>
	</body>
</html>
