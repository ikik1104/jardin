<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type ="text/javascript" https://code.jquery.com/jquery-2.2.4.js"></script>
<style>
	#cContent {width: 1100px;}
	#commentList {width: 1100px;}
	#commentList tr td {border-collapse: collapse; boarder: 1px solid black; height:30px;}
</style>
<script type="text/javascript">
	$(function() {
		getcComment_List();
	})
	
	//댓글 리스트 출력
	function getcComment_List(){
		$.ajax({
			type: 'get',
			url: 'comment_List',
			dataType:"json",
			data: {},  // {bId: 123}
			contentType: "application/json; charset=UTF-8",
			success:function(data){
				alert("성공");
			},
			error:function(request, sataus, error){
				alert("실패: "+error);
			}
		})
	}
</script>
</head>
<body>
	<form id="commentForm" name="commentForm" method="post">
		<h3>댓글 개수: <span id="cCnt"></span></h3>
		<table>
			<tr>
				<td>
					<textarea rows="3" cols="30" id="cContent" name="cContent" placeholder="댓글을 입력해주세요."></textarea>
					<br>
					<a href="#">등록</a>
				</td>
			</tr>
		</table>
	</form>
	<form id="commentListForm" name="commentListForm" method="post">
		<table id="commentList">
			<tr>
				<td colspan="2"><h5>작성자</h5></td>
			</tr>
			<tr>
				<td>내용: </td>
				<td>
					<a href="#">수정</a>
					<a href="#">삭제</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>