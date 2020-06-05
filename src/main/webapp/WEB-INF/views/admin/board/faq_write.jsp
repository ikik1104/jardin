<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<style type="text/css">
			#input_form{
			margin: 20px;	
			}
			table {
				margin:0 auto;
				 min-width: 1000px;
			}
			table tr:NTH-LAST-OF-TYPE(1) textarea{
				width:600px;
				height: 300px;
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
		<h1>FAQ 입력</h1>
			<form action="insertFAQ" name="inputform" method="get">
				<div id="input_form">
					<table border="1">
						<tr>
							<td>카테고리</td>
							<td>
								<select name="f_step">
									<option value="user">회원</option>
									<option value="product">상품</option>
									<option value="order">주문</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>질문</td>
							<td><input type="text" name="f_title"></td>
						</tr>
						<tr>
							<td>답변</td>
							<td><textarea name="f_content" maxlength="700"></textarea></td> <!-- 안커지게 고정하는거 추가해야함 -->
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
