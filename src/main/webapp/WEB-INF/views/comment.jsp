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
			
			function comment_insert(num) {
				$.ajax({
					type:'post',
					url:"./comment_delete",
					data:{ cId : num },  //$("#toptable").serialize, //bId:25
					contentType:"application/json; charset=UTF-8",
					success:function(data){
						if(data == 1){
							alert("데이터가 삭제되었습니다/");
							getComment_List();
						}
					},
					error:function(request,status,error){
						alert("실패"+error);
					}
				});
			}
			
			
			
			function comment_delete(num) {
				$.ajax({
					type:'post',
					url:"./comment_delete",
					data:{ cId : num },  //$("#toptable").serialize, //bId:25
					contentType:"application/json; charset=UTF-8",
					success:function(data){
						if(data == 1){
							alert("데이터가 삭제되었습니다/");
							getComment_List();
						}
					},
					error:function(request,status,error){
						alert("실패"+error);
					}
				});
			}
		
			//댓글 리스트
			function getComment_List() {
				$.ajax({
					type:'get',
					url:"./comment_List",
					dataType:"json",
					data:{ },  //$("#toptable").serialize, //bId:25
					contentType:"application/json; charset=UTF-8",
					success:function(data){
						alert("성공");
						var html="";
						var cCnt = data.length; // list 개수를 확인할 수 있음
						$("#Ccnt").html(cCnt);
						
						if(data.length>0){
							for(var i=0; i<data.length;i++){
							
								html += '<tr><td colspan="2"><h5>작성자 : '+data[i].cName+' </h5></td></tr>';
								html += '<tr><td>내용 : '+data[i].cContent+'</td>';
								html += '<td><a href="#">수정</a><a onclick="comment_delete('+data[i].cId+')">삭제</a></td></tr>';
								
							}
						}else{
							html += '<tr><td colspan="2"><h5>작성자 : 없음  </h5></td></tr>';
							html += '<tr><td>내용 : 등록된 댓글이 없습니다. </td>';
							html += '<td></td></tr>';
						}
						
						$("#commentList").html(html);
						
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
		<h3>댓글 개수 : <span id="Ccnt"></span></h3> 
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
			<!-- ajax의 데이터를 넣는 곳 -->
		</table>
	</form>
</body>
</html>