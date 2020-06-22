<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.js"></script>
<style>
	#cContent{width:1100px;}
	#commentList {width:1100px;}
	#commentList tr td{
		border-collapse:collapse; border:1px solid black; width:900px; height:30px;
	 }
</style>	
<script type="text/javascript">
	//html 페이지 모두 호출 후 jquery 실행
	$(function(){
		getComment_List();
	});

	function getComment_List(){
		$.ajax({
			type:"get",
			url:"./comment_List",
			dataType:"json",//보내는 데이터 타입
			data:{},				//$(#toptable).serialize
			contentType:"application/json; charset=UTF-8",//넘겨주는 데이터 타입
			success:function(data){
				alert('성공');
				
				var html="";
				var cCnt = data.length;//list 개수를 확인할 수 있음
				
				if(data.length>0){
					for(var i=0; i<data.length; i++){
						html+="<tr><td colspan='2'><h5>작성자 : "+data[i].m_num+"번 회원</h5></td></tr>";
						html += "<tr><td>내용 : "+data[i].ec_content+"</td>";
						html += "<td><a href='#'>수정</a>";
						html += "<a href='#' onclick='comment_delete("+data[i].ec_num+")'>삭제</a>";
						html += "</td></tr>";
						
					}
				} else {
					html+="<tr><td colspan='2'><h5>작성자 : 없음</h5></td></tr>";
					html += "<tr><td>내용 : 등록된 댓글이 없습니다.</td>";
					html += "</td></tr>";
				}
				
				$('#Ccnt').html(cCnt);
				$('#commentList').html(html);
			},
			error:function(request, status, error){//에러가 날 경우 이 곳 매개변수 3가지를 자동적으로 넘겨준다.
				alert('실패 : '+error);
			}
			
			
		});
	}
	
	function comment_delete(ec_num){
		alert(ec_num);
		$.ajax({
			type:'post',
			url:'./comment_delete',
			data:{ec_num:ec_num},
			success:function(data){
				alert('삭제 성공');
			},
			error:function(request, status, error){
				alert('삭제 실패');
			}
			
		});
	}
	
	function comment_insert(){
		alert(ec_num);
		$.ajax({
			type:'post',
			url:'./comment_insert',
			data:{ec_num:ec_num},
			success:function(data){
				alert('삭제 성공');
			},
			error:function(request, status, error){
				alert('삭제 실패');
			}
			
		});
	}
	
</script>
</head>
<body>
	
	<form id="toptable" name="toptable" method="post">
		<h3>댓글 개수 : </h3><span id="Ccnt"></span>
			<table>
				<tr>
					<td>
						<textarea rows="3" cols="30" id="cContent" name="cContent" placeholder="댓글을 입력하세요."></textarea>
						<br>
						<input type="hidden" name="m_num" value=""> 
						<input type="hidden" name="e_num" value="">
						<a href="#">등록</a>
					</td>
				</tr>
			</table>
	</form>
	<form id="commentListForm" name="commentListForm" method="post">
		<table id="commentList">
			<!-- ajax 데이터 넣는 곳 -->
		</table>
	</form>	
</body>
</html>