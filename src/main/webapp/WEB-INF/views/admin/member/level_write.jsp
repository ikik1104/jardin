<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>새 등급 추가</title>
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
		
		//등급을 등록하면 다시 이 페이지로 돌아와 alert을 띄움
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
		<h1>등급 등록</h1>
			<form action="level_insert" name="inputform" method="post">
				<div id="input_form">
					<h1>등급 작성</h1>
					<table border="1">
						<tr>
							<td>등급 순서</td>
							<td>
								<select name="lv_order">
									<option value="-1">선택안함</option>
									<c:forEach var="level_list" items="${level_list }">
										<option value="${level_list.leveldto.lv_order }">${level_list.leveldto.lv_order }</option>
									</c:forEach>
									<option value="-99">직접입력</option>
								</select>
								<input type="text" name="directOrder">
							</td>
							<td>등급명</td>
							<td><input type="text" name="lv_name"></td>
						</tr>									
						<tr>
							<td>등급 분류 기준 금액</td>
							<td><input type="text" name="lv_sort_money"><button>없음</button></td>
							<td>혜택</td>
							<td><input type="text" name="lv_benefit"><button>미정</button></td>
						</tr>
						<tr>	
							<td>등급 분류 기준 설명</td>
							<td>
								<textarea name="lv_des"></textarea>
							</td>
						</tr>
					</table>
					
					<div id="btn_div">
						<button type="button" onclick="location.href='member_level_management'">목록</button>
						<button type="submit" >등록</button>
					</div>			
				</div>
			</form>
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
