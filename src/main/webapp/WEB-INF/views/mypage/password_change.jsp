<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title> JARDIN SHOP </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN" />
<meta name="keywords" content="JARDIN" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="user/css/reset.css" />
<link rel="stylesheet" type="text/css" href="user/css/content.css" />
<script type="text/javascript" src="user/js/jquery.min.js"></script>
</head>
<body>

<script>
function pw_ch(){

	//비번 변경
	$.ajax({
           type : "POST",
           url : "pw_check",
           data: {
        	   m_id : "${m_id}",
        	   pw_ori : $("#pw_ori").val(),
        	   pw_new : $("#pw_new").val()
           }, 
           success : function(val){
              if(val == 1){ //리턴값이 1이면 (=성공)
                 alert("비밀번호 변경이 완료되었습니다.");
             	 parent.$.fancybox.close();
              }else{ // 0이면 실패
                 $('#pw_check').text('비밀번호가 일치하지 않습니다.');
              }
           },
           error : function(){
              alert("서버통신실패");
           }
	});
}





</script>

<div id="layerWrap">

<div class="inputWrap">
		
	<div class="inputBody">
		<div class="title">비밀번호 변경</div>
		<p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;"><img src="user/images/btn/btn_input_close.gif" alt="닫기" /></a></p>


		<div class="checkDiv">
			<table summary="새로운 비밀번호로 변경 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
				<caption>비밀번호 변경</caption>
				<colgroup>
				<col width="48%" />
				<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><span>현재 비밀번호</span></th>
						<td>
							<input type="password" class="w215" id="pw_ori"/>
							<p id="pw_check"></p>
						</td>
					</tr>
					<tr>
						<th scope="row"><span>새로운 비밀번호</span></th>
						<td><input type="password" class="w215" id="pw_new"/></td>
					</tr>
					<tr>
						<th scope="row"><span>새로운 비밀번호 <u>재입력</u></span></th>
						<td><input type="password" class="w215" /></td>
					</tr>
				</tbody>
			</table>
		</div>


		<div class="centerbrn pd10">
			<a onclick="pw_ch()">확인</a>
		</div>

	</div>

</div>


</div>
</body>
</html>