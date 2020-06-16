<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인 됨</h2>


<% session.setAttribute("userNum", 6); 
session.setAttribute("userID", "kiwi");%>
</body>
</html>