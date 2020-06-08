<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="admin/se2/js/HuskyEZCreator.js" charset="utf-8"></script> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- 페이지 로딩시 초기화 --> 
		<script>
		$(document).ready(function(){
				nhn.husky.EZCreator.createInIFrame({ 
					oAppRef: editor, 
					elPlaceHolder: 'txtContent', 
					sSkinURI: '/plugin/smarteditor2/SmartEditor2Skin.html', 
					fCreator: 'smartEditor' 
					}); 
				
				$("#f_step1 option").each(function(){ //select box의 옵션을 전부 들고와서 for문처럼 돌림
				    if($(this).val()=="${faq.f_step}"){ //이 옵션의 값이 넘어온 값과 같다면
				      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
				    }
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
			<form action="faq_update" name="inputform" method="post">
				<div id="input_form">
					<table border="1">
						<tr>
							<td>카테고리</td>
							<td>
								<select name="f_step" id="f_step">
									<option value="user">회원</option>
									<option value="product">상품</option>
									<option value="order">주문</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>질문</td>
							<td><input type="text" name="f_title" value="${faq.f_title}"></td>
						</tr>
						<tr>
							<td>답변</td>
							<td><textarea name="f_content" id="smartEditor" maxlength="700">${faq.f_content}</textarea></td> <!-- 안커지게 고정하는거 추가해야함 -->
						</tr>
					</table>
					<div id="btn_div">
						<input type="hidden" value="${faq.f_num}" name="f_num">
						<button type="button" onclick="location.href="입력전페이지 이동">취소</button>
						<button type="submit">등록</button>
					</div>
				</div>
			</form>
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
