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
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script>
		</script>
		<style type="text/css">
			#input_form{
			margin: 20px;	
			}
			table {
				margin:0 auto;
				 min-width: 1000px;
			}
			#btn_div{
			 text-align: center;
			}
			#expiry_tr{
				display: none;
			}
		</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>관리자 추가하기</h1>
			<form action="" name="inputform" method="get">
				<div id="input_form">
					<table border="1">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="ad_name">
							<button type="button" onclick="idChk(this.value)">아이디 중복체크</button>
							<span id="idChk">중복체크 결과 여기에 뿌려주기</span></td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input type="password"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td>
								<input type="text" name="ad_name">
							</td>
						</tr>
						<tr >
							<td>관리자등급</td>
							<td>
								<select>
									<option value="">최고관리자</option>
									<option value="">관리자</option>
									<option value="">문의 담당자</option>
								</select>
							</td>
						</tr>
					</table>
					<div id="btn_div">
						<button type="button" onclick="location.href="입력전페이지 이동">취소</button>
						<button type="button" onclick="location.href="유효성 검사">등록</button>
					</div>
				</div>
			</form>
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
