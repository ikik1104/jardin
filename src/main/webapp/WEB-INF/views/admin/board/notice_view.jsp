<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="se2/admin/js/HuskyEZCreator.js" charset="utf-8"></script> 
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
		
		//공지글을 등록/수정하면 다시 이 페이지로 돌아와 alert을 띄움
		window.onload=function(){
			${alerttext}
		}
		
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
		<h1>공지사항 조회/수정</h1>
			<form action="notice_modify" name="inputform" method="post">
				<div id="input_form">
					<h1>공지사항 조회/수정</h1>
					<table border="1">
						<tr>
							<td>작성자</td>
							<td>${adminGrade }(${adminId })</td>
						</tr>
						<tr>
							<td>제목</td>
							<td><textarea name="no_title"><!-- 여기에 제목 불러오기 --></textarea></td>
						</tr>									
						<tr>
							<td>내용</td>
							<td>
								<!-- 텍스트에디터로 변경?★★★★★★★★★ -->
								<textarea name="no_content" id="smartEditor" style="width:100%; height: 412px;">
								<!-- 여기에 내용 불러오기 -->
								</textarea>
							</td>
						</tr>
					</table>
					<div id="btn_div">
						<button type="button" onclick="location.href='notice_list?rownum=${rownum}'">목록</button>
						<button type="submit" >수정</button>
						<button type="button" >삭제</button>						
					</div>
					<input type="hidden" value="${rownum }" name="rownum">				
				</div>
			</form>
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
