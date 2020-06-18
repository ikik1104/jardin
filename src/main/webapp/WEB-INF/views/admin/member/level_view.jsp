<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>등급 조회/수정</title>
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
		
		//등급을 수정하면 다시 이 페이지로 돌아와 alert을 띄움
		window.onload=function(){
			${alerttext}
		}
		
		//등급 삭제 체크
		function del_check(lv_num){
			if(confirm("해당 등급을 삭제 하시겠습니까? \n(삭제한 데이터는 복구할 수 없습니다.)")){
	            $.ajax({
	                  url : "level_delete",
	                  method : "POST",
	                  data: JSON.stringify(lv_num),
	                  dataType : "json",
	                  contentType: "application/json",
	                  success : function(val){
	                     if(val == 1){ //리턴값이 1이면 (=성공)
	                        alert("삭제를 완료했습니다.");
	                        location.href='member_level_management'; //페이지 새로고침
	                     }else{ // 0이면 실패
	                        alert("삭제 실패.");
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
		<h1>등급 조회/수정</h1>
			<form action="level_modify" name="inputform" method="post">
				<div id="input_form">
					<h1>등급 조회/수정</h1>
					<table border="1">
						<tr>
							<td>등급 순서</td>
							<td>${level_info.leveldto.lv_order }</td>
						</tr>
						<tr>	
							<td>등급 순서 변경</td>
							<td>
								<select name="lv_order">
									<option value="-1">선택안함</option>
									<c:forEach var="level_list" items="${level_list }">
										<option value="${level_list.leveldto.lv_order }">${level_list.leveldto.lv_order }</option>
									</c:forEach>
									<option value="-99">직접입력</option>
								</select>
								<input type="text" name="directOrder">
								<input type="hidden" name="defaultOrder" value="${level_info.leveldto.lv_order}">
							</td>
						</tr>
						<tr>	
							<td>등급명</td>
							<td ><textarea name="lv_name">${level_info.leveldto.lv_name}</textarea></td>
						</tr>									
						<tr>
							<td>등급 분류 기준 금액</td>
							<td><textarea name="lv_sort_money">${level_info.leveldto.lv_sort_money}</textarea><button>없음</button></td>
						</tr>
						<tr>
							<td>혜택</td>
							<td><textarea name="lv_benefit">${level_info.leveldto.lv_benefit}</textarea><button>미정</button></td>
						</tr>
						<tr>	
							<td>등급 분류 기준 설명</td>
							<td>
								<textarea name="lv_des">${level_info.leveldto.lv_des}</textarea>
							</td>
						</tr>
					</table>
					
					<input type="hidden" name="lv_num" value="${level_info.leveldto.lv_num }">
					
					<div id="btn_div">
						<button type="button" onclick="location.href='member_level_management'">목록</button>
						<button type="submit" >수정</button>
						<button type="button" onclick="del_check(${level_info.leveldto.lv_num})">삭제</button>						
					</div>			
				</div>
			</form>
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
