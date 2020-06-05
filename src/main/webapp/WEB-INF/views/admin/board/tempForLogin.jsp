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
<% session.setAttribute("adNum", "1"); 
session.setAttribute("adminId", "inquiryadmin");
session.setAttribute("adminGrade", "문의담당자");%>

${adNum }<br>
${adminId }<br>
${adminGrade }<br>
</body>
</html>