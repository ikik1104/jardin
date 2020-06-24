<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 새 글 등록</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="se2/admin/js/HuskyEZCreator.js" charset="utf-8"></script> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- css. 기능 수정 -->
		<link rel="stylesheet" type="text/css" href="admin/css/admin_view.css">	
        <script type="text/javascript" src="admin/js/admin_board.js"></script>		
				
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
		<h1>공지사항 등록</h1>
			<form action="notice_insert" name="inputform" method="post" id="notice_insert" >
				<div id="input_form">
					<h1>공지사항 작성</h1>
					<table border="1" style="margin-top:10px; width:1000px;">
						<tr>
							<th class="notice_th">작성자</th>
							<td>${adminGrade }(${adminId })</td>
						</tr>
						<tr>
							<th class="notice_th">제목</th>
							<td><input type="text" name="str2" style="border:none; background:inherit; height:40; font-size:15px; padding:3px 0; width:800px;"></td>
						</tr>									
						<tr>
							<th class="notice_th">내용</th>
							<td>
								<!-- 텍스트에디터로 변경?★★★★★★★★★ -->
								<textarea name="str3" id="smartEditor" style="width:100%; height: 412px;"></textarea>
							</td>
						</tr>
					</table>
					
					<div class="detail_btn" style="width:1000px;">
						<a onclick="location.href='notice_list'">목록</a>				
						<a onclick="notice_insert()">등록</a>														
					</div>					
					
					<input type="hidden" value="${adminNum }" name="str1">					
				</div>
			</form>
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
