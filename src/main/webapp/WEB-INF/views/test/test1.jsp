<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html >
<head>
<title> JARDIN SHOP </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="user/css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="user/css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="user/css/content.css?v=Y" />
<script type="text/javascript" src="user/js/jquery.min.js"></script>
<script type="text/javascript" src="user/js/top_navi.js"></script>
<script type="text/javascript" src="user/js/left_navi.js"></script>
<script type="text/javascript" src="user/js/main.js"></script>
<script type="text/javascript" src="user/js/common.js"></script>
<script type="text/javascript" src="user/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="user/js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="user/js/jquery.anchor.js"></script>
<script type="text/javascript" src="user/js/js_test1.js"></script>
<script type="text/javascript" src="user/js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="user/css/jquery.fancybox-1.3.4.css" />
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

</head>
<body>
								<input type="hidden" name="originStart" value="${coupon_info.utildto.str1 }">
								<input type="hidden" name="originEnd" value="${coupon_info.utildto.str2 }">

<script>
	if(inputform.str1.value==null || inputform.str1.value==undefined || inputform.str1.value=='' || inputform.str1.value==inputform.originStart.value){
		//시작일 수정 안 할 경우
		inputform.str1.value=inputform.originStart.value;
	}
	if(inputform.str2.value==null || inputform.str2.value==undefined || inputform.str2.value==''){
		//종료일 수정 안 할 경우
		inputform.str2.value=inputform.originEnd.value;
	}
	if(inputform.co_expiry.value==null || inputform.co_expiry.value==undefined || inputform.co_expiry.value=='' || inputform.co_expiry.value=='-'){
		//유효기간 수정 안 할 경우
		inputform.co_expiry.value=inputform.originExpiry.value;
	}	
	if(inputform.co_type.value=='none' || inputform.co_type.value== inputform.coType.value ){
		//쿠폰타입 수정 안 할 경우
		inputform.co_type.value=inputform.coType.value;
	}	
	if(inputform.co_product.value=='0' || inputform.co_product.value==0 || inputform.co_product.value==inputform.originProduct.value){
		//적용상품 수정 안 할 경우
		inputform.co_product.value=inputform.originProduct.value;
	}	

</script>



					<!-- 등록된 1:1문의 없을 경우 -->
					<c:if test="${mtm_list.size()==0 }">
						등록된 1:1문의가 없습니다.
					</c:if>
					<!-- 등록된 1:1문의 있을 경우 -->
					<c:if test="${mtm_list.size()!=0 }">

		<link rel="stylesheet" type="text/css" href="admin/css/a_setting.css">	

<style>
			section{
				padding-bottom:300px;
			}
			
			table th{
				width:15%;
			}
			.user_title{
				overflow:hidden; text-overflow:ellipsis;
			}
			
			.modify_textarea, .modify_textarea2{
				overflow:hidden;
			}
			.byte_area, .byte_area2{
				text-align:right; padding-right:10px;
			}
			#byte_alert, #byte_alert2{
				color:red;
			}		
</style>
maxlength="85" 
class="user_title"
 class="modify_textarea" onkeyup="resize(this)"
  class="modify_textarea2" onkeyup="resize2(this)"
<p class="byte_area"><span id="byte_alert">※최대 입력 글자 수를 초과했습니다. </span><span id="present_byte"></span> /4000 byte</p>
<p class="byte_area2"><span id="byte_alert2">※최대 입력 글자 수를 초과했습니다. </span><span id="present_byte2"></span> /4000 byte</p>
<!-- 글자수 입력 초과 신호 -->
<input type="hidden" id="byte_excess" name="byte_excess">
<input type="hidden" id="byte_excess2" name="byte_excess2">

<script type="text/javascript">
if($('#byte_excess').val()=='on'){
	alert('제목 최대 입력 글자 수를 초과했습니다.');
	return false;
}
if($('#byte_excess2').val()=='on'){
	alert('내용 최대 입력 글자 수를 초과했습니다.');
	return false;
}


window.onload=function(){
	$('#byte_alert').hide();		
	
	var original_height= $('.modify_textarea').prop('scrollHeight');
	$('.modify_textarea').height(12+original_height);
	 var str = $('.modify_textarea').val();
	 var len=0;
	 
	 if(str!=undefined && str!=null && str!=''){
	 for (var i = 0; i < str.length; i++) {
	        if (escape(str.charAt(i)).length == 6) {
	            len+=2;
	        }
	        len++;
	    }
	 }
	$('#present_byte').html(len);
	
	$('#byte_alert2').hide();		
	
	var original_height2= $('.modify_textarea2').prop('scrollHeight');
	$('.modify_textarea2').height(12+original_height2);
	 var str2 = $('.modify_textarea2').val();
	 var len2=0;
	 
	 if(str2!=undefined && str2!=null && str2!=''){
	 for (var i = 0; i < str2.length; i++) {
	        if (escape(str2.charAt(i)).length == 6) {
	            len2+=2;
	        }
	        len2++;
	    }
	 }
	$('#present_byte2').html(len2);	
	
};		

function resize(obj) {
	  obj.style.height = "1px";
	  obj.style.height = (12+obj.scrollHeight)+"px";
	  
	  var str = $('.modify_textarea').val();
	    var len = 0;
	    for (var i = 0; i < str.length; i++) {
	        if (escape(str.charAt(i)).length == 6) {
	            len+=2;
	        }
	        len++;
	    }
	     if(len>4000){
	    	$('#byte_alert').show();
	    	$('#byte_excess').val('on');
	     } else {
	    	 $('#byte_alert').hide();
	    	 $('#byte_excess').val('off');
	     }
	     
	  	$('#present_byte').html(len);
	  
	}
	
function resize2(obj) {
	  obj.style.height = "1px";
	  obj.style.height = (12+obj.scrollHeight)+"px";
	  
	  var str = $('.modify_textarea2').val();
	    var len = 0;
	    for (var i = 0; i < str.length; i++) {
	        if (escape(str.charAt(i)).length == 6) {
	            len+=2;
	        }
	        len++;
	    }
	     if(len>4000){
	    	$('#byte_alert2').show();
	    	$('#byte_excess2').val('on');
	     } else {
	    	 $('#byte_alert2').hide();
	    	 $('#byte_excess2').val('off');
	     }
	     
	  	$('#present_byte2').html(len);
	  
	}

if($('#mtm_content2').val()==null || $('#mtm_content2').val()==''){
	alert('내용을 입력해 주세요.');
	return false;
}			

</script>








<script type="text/javascript">
function date_chk2(){
	var start = inputform.e_start_day.value;
	var end = inputform.e_end_day.value;
	
	var date1 = new Date();
	var start_date = new Date(start);
	var end_date = new Date(end);
	if(end_date.getTime()<date1.getTime()){
		alert("종료일은 오늘 날짜 이후 or 시작일 이후의 날짜를 선택해주세요.");
		inputform.e_end_day.value ="";
		return false;
	}
	if(end_date.getTime()<start_date.getTime()){
		alert("시작일 이후의 날짜를 선택해주세요.");
		inputform.e_end_day.value ="";
		return false;
	}
}

function search() {
	//ajax 구현 해서 바로 검색결과 띄워주기
	
}

//구현 끝~! ㅋㅋ
function search_date(val){
	var start = document.getElementById("e_start_day");
	var end = document.getElementById("e_end_day");
	
	var today = new Date();
	var date = new Date();
	
	if(val == "today"){
		start.valueAsDate = today;
		end.valueAsDate = today;
	}else if(val == "all"){
		start.valueAsDate = null;
		end.valueAsDate = null;
	}else if(val == "7day"){
		var weekDate = today.getTime() - (7 * 24 * 60 * 60 * 1000);
		date.setTime(weekDate);				
		start.valueAsDate = date;
		end.valueAsDate = today;
	}else if(val == "15day"){
		var weekDate = today.getTime() - (15 * 24 * 60 * 60 * 1000);
		date.setTime(weekDate);				
		start.valueAsDate = date;
		end.valueAsDate = today;
	}else if(val == "1month"){
		date.setMonth(date.getMonth() - 1);
		start.valueAsDate = date;
		end.valueAsDate = today;
	}else if(val == "3month"){
		date.setMonth(date.getMonth() - 3);
		start.valueAsDate = date;
		end.valueAsDate = today;
	}
}
</script>

	
</body>
</html>