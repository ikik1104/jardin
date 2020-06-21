<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">

/* 제이쿼리 페이지 로딩 후 바로 실행 */
 $(function(){
	 test1();
 });

function test1(){
	$.ajax({
		type: 'GET',       // get/post
		url: 'dataList1',     // controller json 데이터 링크주소
		data: {},           // 페이지로 매개변수 값을 넘겨줄 때 사용
		contentType: "application/json;charset=utf-8",  // 한글처리
		success: function(data){            // json데이터 return 데이터
			alert("데이터 성공적으로 가지고 왔습니다.");
			var html="";
			for(var i=0;i<data.array.length;i++){
				html += '<tr><td>courseAreaId</td><td>'+data.array[i].courseAreaId+'</td></tr>';
				html += '<tr><td>courseAreaName</td><td>'+data.array[i].courseAreaName+'</td></tr>';
				html += '<tr><td>spotName</td><td>'+data.array[i].spotName+'</td></tr>';
			}	
			$('#dataTable').html(html);
		},
		error: function(){
			alert("데이터 가져오기 실패");
		}
		
	});
}


</script>
</head>
<body>
	<table id="dataTable">

	</table>
</body>
</html>