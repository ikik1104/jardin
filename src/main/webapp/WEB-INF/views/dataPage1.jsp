<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dataPage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

/*제이쿼리 페이지 로딩 후 바로 실행*/
$(function() {
	json_test();
});

function json_test() {
	$.ajax({
		type : 'POST', 		//  get,post
		url : 'dataList', //  controller json 데이터 링크주소
		data : {}, 			// 	페이지로 매개변수 값을 넘겨줄 때 사용 
		contentType : "application/json;charset=utf-8", // 한글처리
		success : function(data) { //json데이터 return 데이터
			alert("데이터를 성공적으로 가지고 왔습니다.");
			var html="";
			
			for (var i = 0; i < data.array.length; i++) {
				html += '<tr><td>courseAreaId</td><td>'+data.array[i].courseAreaId+'</td></tr>';
				html += '<tr><td>courseAreaName</td><td>'+data.array[i].courseAreaName+'</td></tr>';
				html += '<tr><td>spotName</td><td>'+data.array[i].spotName+'</td></tr>';
			}
			
			$("#dataTable").html(html);
			
		},
		error:function(){
			alert("데이터 가지고 오기 실패");
		}
	});
}

</script>
</head>
<body>
	<div>
		<table id="dataTable" border="1">
<!-- 			<tr><td>정보</td><td>정보 값</td></tr> -->
<!-- 			<tr><td>courseAreaId</td><td>정보 값</td></tr> -->
		</table>
	</div>
</body>
</html>