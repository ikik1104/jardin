<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<style type="text/css">
			#cContent{width: 1100px;}
			#commentList{width: 1100px;}
			#commentList tr td{ border-collapse: collapse;
				border: 1px solid black; height: 30px;
			}
		</style>
		<script type="text/javascript">
			//html 페이지 모두 호출 후에 jquery실행
			$(function() {
				getComment_List();
			});
		
			//댓글 리스트
			function getComment_List() {
				$.ajax({
					type:'get',
					url:"./comment_List",
					dataType:"json",
					data:{ },  //$("#toptable").serialize, //bId:25
					contentType:"application/json; charset=UTF-8",
					success:function(date){
						alert("성공");
						var html="";
						var cCnt = data.length; //list 개수를 확인할 수 있음
						
					},
					error:function(request,status,error){
						alert("실패"+error);
					}
				});
			}
		</script>
	</head>
<body>
	<form action="" id="toptable" name="toptable" method="post">
		<h3>댓글 개수 : <span id="Ccnt">100</span></h3> 
		<table id="top_table">
			<tr>
				<td>
					<textarea rows="3" cols="30" id="cContent" name="cContent" placeholder="댓글을입력해주새요"></textarea>
					<br>
					<a href="#">등록</a>
				</td>
			</tr>
		</table>
	</form>
	<form action="commentListForm" name="commentListForm" method="post">
		<table id="commentList">
			<tr>
				<td colspan="2"><h5>작성자 : </h5></td>
			</tr>
			<tr>
				<td>내용 : 댓글에 입력한 글자가 여기에 나타납니다.</td>
				<td>
					<a href="#">수정</a>
					<a href="#">삭제</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>