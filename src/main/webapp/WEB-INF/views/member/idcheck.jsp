<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title> 아이디 중복확인 </title>
<meta charset="UTF-8" />
<!--  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN" />
<meta name="keywords" content="JARDIN" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />-->
<link rel="stylesheet" type="text/css" href="user/css/reset.css" />
<link rel="stylesheet" type="text/css" href="user/css/content.css" />
<!--<script type="text/javascript" src="user/js/idcheck.js"></script>  -->


<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<script type="text/javascript" src="user/js/jquery.min.js"></script>
<script type="text/javascript" src="user/js/top_navi.js"></script>
<script type="text/javascript" src="user/js/left_navi.js"></script>
<script type="text/javascript" src="user/js/main.js"></script>
<script type="text/javascript" src="user/js/common.js"></script>
<script type="text/javascript" src="user/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="user/js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="user/js/jquery.anchor.js"></script>

<style>
.w348{
	margin-left:10px;
}

</style>
<script type="text/javascript">
function id_Check(){
	var id = $('#inputID').val();
	
	if(id==null || id==''){
		alert('아이디를 입력해 주세요.');
		$('#inputID').focus();
		return false;
	}
	
	//유효성 검사
	var id_check = /^[a-zA-Z0-9]{5,20}$/;
	
	if(!(id_check.test(id))){
		alert('아이디는 5~20자의 영문 소문자, 숫자를 조합해 공백 없이 입력해 주세요. ');
		$('#inputID').focus();
		return false;
	}
	
	id=id.replace(" ", "");//입력값 공백 제거
	$('#inputID').val(id);
	
$.ajax({
			       url: "check_id",
			       type: "POST",
			       data:  $("#checkform").serialize(),
			       /*
			       success : function(map){
			    	   var val = map.success;
			           if(val == 1 ){//성공
			        	   location.href='nonmember_ordercheck?orderNum='+map.orderNum+'&orderName='+map.orderName;
			           } else if(val ==0){
			        	   location.href='non_takeback_state?orderNum='+map.orderNum+'&orderName='+map.orderName;
			           } else {//주문번호 불일치
			        	   alert('주문이 존재하지 않습니다. 이름 또는 주문번호를 다시 확인하세요.'); 
			           }
			        },*/
			       success : function(val){
			           if(val == 1 ){//일치하는 아이디 없음
			        	  $('.checkText').val('사용 가능한 아이디입니다.');
			           $('#exitSign').val(1);
			           } else if(val ==0){//일치하는 아이디 있음
			        	   $('.checkText').val('이미 존재하는 아이디입니다.');
			        	   $('#exitSign').val(0);
			           }
			        },			       
			        error : function(){
			           alert("서버통신실패");
			        }
				  });		
				  
}
function exitCheck(){
	var exit = $('#exitSign').val();
	var id = $('#inputID').val();
	
	if(exit==1){//사용 가능 아이디일 경우
		$("#m_id", opener.document).val(id);
		self.close();
	} 
	if(exit==0 || exit==null || exit==undefined || exit==''){//사용 불가능 아이디일 경우
		alert('중복확인 되지 않았습니다.');
		self.close();
	}
}
/*
 function alert(){
	alert('연결');
	}*/

</script>

</head>
<body>
<div id="layerWrap">
	<form action="check_id" method="post" name="checkform" id="checkform">
	<!-- 중복체크 창 닫아도 되는지 판단 신호 -->
	<input type="hidden" id="exitSign">
	
	<div class="inputWrap">
			
		<div class="inputBody">
			<div class="title">아이디 중복확인 </div>
			<p class="popalert">아이디는 5~20자의 영문 소문자, 숫자를 조합해 공백 없이 입력해 주세요. <br/>예) apple26</p>

			<div class="inputBox">					
				<ul class="old">
					<li><label for="">아이디</label><input type="text" name="m_id" class="w348" id="inputID" maxlength="20" style="width:250px; " />
						<div onclick="id_Check()"   class="centerbrn" onclick="id_Check()"  style="cursor:pointer; display:inline-block; padding:0; margin-left:5px;">
						<a style="height:20px; font-size:15px; line-height:20px; " >검색</a>
						</div>
					</li>
					<li><input type="text" class="checkText" style="background-color:inherit; border:none; margin-left:10px; color:red; width:300px;"/></li>
				</ul>
				<ul class="new" style="display:none; ">
					<li><label for="" class="wl130">도로명 or 건물번호</label><input type="text" class="w290" id="" /></li>
				</ul>
			</div>

			<div class="centerbrn" style="cursor:pointer;" onclick="exitCheck()">
				<a >확인</a>
			</div>


		</div>

	</div>
	</form>


</div>
</body>
</html>