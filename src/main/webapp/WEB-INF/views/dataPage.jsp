<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		json_test();
	});
	
	function json_test(){
		$.ajax({
			type : 'get',
			url : 'datadata',
			data : {},
			contentType : "application/json;charset=utf-8",
			success : function(data){
				alert("성공이다.");
				var html="";
				for(var i=0; i<data.array.length; i++){
    				html += '<tr><td>courseAreaName</td><td>'+data.array[i].courseAreaName+'</td></tr>';
    				html += '<tr><td>courseAreaId</td><td>'+data.array[i].courseAreaId+'</td></tr>';
    				html += '<tr><td>spotName</td><td>'+data.array[i].spotName+'</td></tr>';
				}
				$('#dataTable').html(html);
			},
			error : function(){
				alert("실패다.");
			}
			
			
		});
	}

</script>


</head>
<body>
    <div>
        <table id="dataTable">
        </table>
    </div>



</body>
</html>