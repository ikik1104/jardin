<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 게시글 조회</title>
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
		
		//당첨자 게시글을 수정하면 다시 이 페이지로 돌아와 alert을 띄움
		window.onload=function(){
			${alerttext}
		}
		
		//당첨자 게시글 삭제 체크 
		function del_check(wb_num){
			if(confirm("해당 게시글을 삭제하시겠습니까? (삭제한 데이터는 복구할 수 없습니다.)")){
	            $.ajax({
	                  url : "win_board_delete",
	                  method : "POST",
	                  data: JSON.stringify(wb_num),
	                  dataType : "json",
	                  contentType: "application/json",
	                  success : function(val){
	                     if(val == 1){ //리턴값이 1이면 (=성공)
	                        alert("삭제처리 완료되었습니다.");
	                        location.href='win_list'; //페이지 새로고침
	                     }else{ // 0이면 실패
	                        alert("삭제처리 실패.");
	                     }
	                  },
	                  error : function(){
	                     alert("서버통신실패");
	                  }
	               });
	         }
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
		<h1>당첨자 게시글 조회/수정</h1>
			<form action="win_board_modify" name="inputform" method="post">
				<div id="input_form">
					<h1>당첨자 게시글 조회/수정 <span style="font-size:15px; font-weight:normal;">* 수정 가능 항목</span></h1>
					<table border="1" style="margin:0; width:1000px;">
						<colgroup>
							<col width="15%">
							<col  width="35%">
							<col width="15%">
							<col width="35%">
						</colgroup>.
						<tr>
							<th>작성자</th>
							<td>${win_board_list.admindto.ad_grade }(${win_board_list.admindto.ad_id })</td>
							<th>조회수</th>
							<td>${win_board_list.winboarddto.wb_hit }</td>
						</tr>			
						<tr>
							<th>제목 *</th>
							<td colspan="3" style="height:33px;">
							<textarea name="wb_title"  style="height:20px;">${win_board_list.winboarddto.wb_title }</textarea>
							</td>
						</tr>									
						<tr>
							<th>등록일</th>
							<td colspan="3">${win_board_list.winboarddto.wb_date }</td>
						</tr>									
						<tr>
							<th>이벤트명</th>
							<td colspan="3">${win_board_list.eventdto.e_title }</td>
						</tr>
						<tr>
							<th>이벤트 변경 *</th>
							<td colspan="3">
								<select name="e_num" style="height:20px;">
									<option value="0">변경 안 함</option>
									<c:forEach var="event_list" items="${event_list }">
										<option value="${event_list.eventdto.e_num }">${event_list.eventdto.e_title }</option>
									</c:forEach>
								</select>
							</td>
						</tr>						
						<tr>
							<th>내용  *</th>
							<td colspan="3">
								<!-- 텍스트에디터로 변경?★★★★★★★★★ -->
								<textarea wrap="hard" name="wb_content" id="smartEditor" style="width:100%; height: 412px;">
${win_board_list.winboarddto.wb_content }
								</textarea>								
							</td>
						</tr>
					</table>
					<input type="hidden" value=${win_board_list.winboarddto.wb_num } name="wb_num">
					<input type="hidden" value=${win_board_list.winboarddto.e_num } name="eNum">					
					
					<div id="btn_div" style="width:1000px; margin-top:10px; margin-bottom:200px;">
						<div id="btn_wrap" style="width:120px; float:right;">
						<button type="button" onclick="location.href='win_list'">목록</button>
						<button type="submit" >수정</button>
						<button type="button" onclick="del_check(${win_board_list.winboarddto.wb_num })" >삭제</button>						
						</div>
					</div>		
				</div>
			</form>
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
