<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>        
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>당첨자 게시글 작성</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="se2/admin/js/HuskyEZCreator.js" charset="utf-8"></script> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_view.css">	
		<link rel="stylesheet" type="text/css" href="admin/css/a_setting.css">	
        <script type="text/javascript" src="admin/js/admin_board.js"></script>	
		<link rel="stylesheet" type="text/css" href="admin/css/list_button.css">    
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
		<h1>당첨자 게시글 등록</h1>
			<form action="win_board_insert" name="inputform" method="post">
			<!-- 같이 보내줄 데이터 -->
			<input type="hidden" value="${adminNum }"  name="ad_num">
			
				<div id="input_form">
					<h1>게시글 작성 <span style="font-size:15px;font-weight:normal;">* 작성 가능 항목</span></h1>
					<table border="1" style="margin-top:10px; width:1000px;">
						<colgroup>
							<col width="15%">
							<col>
						</colgroup>
						<tr>
							<th>작성자</th>
							<td >${adminGrade }(${adminId })</td>
						</tr>
						<tr>
							<th>제목 *</th>
							<td><input type="text" name="wb_title" style="font-size:15px; padding-left:10px; width:800px; min-weight:200px; background:inherit; height:30px; border:none; "></td>
						</tr>			
						<tr>
							<th>이벤트명 *</th>
							<td>
								<select name="e_num" style="width:500px; height:20px;">
									<option value="0">선택 안 함</option>
									<c:forEach var="event_list" items="${event_list }">
										<option value="${event_list.eventdto.e_num }">${event_list.eventdto.e_title }</option>
									</c:forEach>
								</select>							
								<!--<input type="text" name="event_title">-->
							</td>
						</tr>														
						<tr>
							<th>내용 *</th>
							<td>
								<!-- 텍스트에디터로 변경?★★★★★★★★★ -->
								<textarea name="wb_content" id="smartEditor" style="width:100%; height: 412px;"></textarea>
							</td>
						</tr>
					</table>
					
					<div id="btn_div" style="margin-top:10px; width:1000px; margin-bottom:200px;">
						<div style="width:80px; float:right;">
						<button type="button" onclick="location.href='win_list'">목록</button>
						<button type="submit" >등록</button>
						</div>
					</div>
				</div>
			</form>
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
