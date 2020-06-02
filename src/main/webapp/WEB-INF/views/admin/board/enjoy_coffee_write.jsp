<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/admin_main.css">
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="se2/js/HuskyEZCreator.js" charset="utf-8"></script> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- 페이지 로딩시 초기화 --> 
		<script>
		$(document).ready(function(){
				nhn.husky.EZCreator.createInIFrame({ 
					oAppRef: editor, 
					elPlaceHolder: 'txtContent', 
					sSkinURI: '/plugin/smarteditor2/SmartEditor2Skin.html', 
					fCreator: 'createSEditor2' 
					}); 
				}); 
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
		</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>

		<h1>enjoy Coffee 입력</h1>  <!-- <<<<< 20.06.02 수정요청 >>>>> -->
			<form action="" name="inputform" method="get">
				<div id="input_form">
					<table border="1">
						<tr>
							<td>글 제목</td>
							<td><input type="text" name="글제목"></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" name="ad_num" value="어드민 번호 가져오기"></td>
						</tr>
						<tr>
							<td>글 내용</td>
							<td><textarea name="글내용" id="smartEditor" style="width:100%; height: 412px;"></textarea></td>
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
<script type="text/javascript" src = "js/notice_write.js"></script>
