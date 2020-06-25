<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <style>
            #cContent{width:1100px;}
            #commentList{width:1100px; border-collapse: collapse;}
            #commentList tr td{border-collapse: collapse; border: 1px solid black; height: 30px;}
        </style>
        <script>
        	$(function(){
        		getComment_list();	
        	});
        	
        	function getComment_list(){
        		$.ajax({
        			type : 'get',
        			url : './comment_list',
        			dataType : "json",
        			data : {}, //bid //$(#toptable).serialize
        			contentType : "application/json; charset=UTF-8",
        			success : function(data){
        				alert("성공");
        				var cCnt = data.length;
        				var str="";
						if(data.length>0){
							for(var i=0; i<data.length; i++){
            	                str += "<tr><td colspan='2'><h5> 작성자 :" + data[i].cname +"</h5></td></tr>";
            	                str += "<tr><td>"+ data[i].ccontent +"</td>";
            	                str += "<td><a href=''>수정</a><a href=''>삭제</a></td></tr>";
							}
						} else {
							str += "<tr><td colspan='2'><h5> 작성자 : 없음 </h5></td></tr>"
							str += "<tr><td>등록된 댓글이 없습니다.</td>";
							str += "<td></td></tr>";	
						}
        				
            			$("#cCnt").html(cCnt);
            			$("#commentList").html(str);
        				
        			},
        			error : function(request, status, error){
        				alert("실패" + error);
        			}
        		});
        	}
        </script>
    </head>
    
    <body>
        <form id="toptable" name="toptable" method="post">
            <h3>댓글 개수 : <span id="cCnt"></span></h3>
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
                
            </table>
        </form>
    </body>
</html>