<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	mtmtest page<br>
	<c:forEach var="dto" items="${list }">
	${dto.getIu_num() }<br>
	${dto.getM_num() }<br>	
	${dto.getIu_title() }<br>	
	
	</c:forEach>
	
	
</body>
</html>