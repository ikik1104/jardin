<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
		<script type="text/javascript">
		
		$(document).ready(function() { 
			
			var text1 = "${text}";
			if(!(text1===null) && !(text1==="")){
			 		alert(text1);	
			 		location.href="notice_view.Ado?bid=${bid}";
				 }
			
		});
		
		
		function b_delete(id) {
			if(confirm("게시글을 삭제하시겠습니까?")){
				location.href = "notice_delete.Ado?bid="+id;	
			}
			return false;
		}
</script>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_notice_view.css">
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>공지사항</h1>
		<div>
			<div>
				<h2>
					${ruDto.RU_TITLE}<Span>작성일 : <fmt:formatDate value="${ruDto.RU_DATE}" pattern="yyyy-MM-dd"/></span>   
					<span>조회수 : ${ruDto.RU_HIT}</span>
					<span>구매 제품 : ${ruDto.P_NAME}</span>
				</h2>
			</div>

			<div>
				<div>
					<c:if test="${not empty ruDto.RU_IMG}">
					<p style="text-align:center;">
						<img src="${pageContext.request.contextPath}/upload2/${ruDto.RU_IMG}" style="width:60%; height:500px;margin-bottom: 50px;" >
					</p>
					</c:if>
					<p style="text-align: center; margin-bottom: 100px;">${ruDto.RU_CONTENT}</p>
				</div>
			</div>

			<div></div>
			<div>
				<a onclick="javascript:history.back(-1);">뒤로가기</a>
			</div>
		</div>
	</section>
	</body>
</html>