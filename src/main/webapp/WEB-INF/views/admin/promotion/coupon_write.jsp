<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<jsp:useBean id="sysdate" class="java.util.Date"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠폰 등록</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="admin/se2/js/HuskyEZCreator.js" charset="utf-8"></script> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_view.css">	
		<link rel="stylesheet" type="text/css" href="admin/css/a_setting.css">	
        <script type="text/javascript" src="admin/js/admin_board.js"></script>		
		<link rel="stylesheet" type="text/css" href="admin/css/list_button.css">      
		<!-- 페이지 로딩시 초기화 --> 
		<script>
		/*
		$(document).ready(function(){
				nhn.husky.EZCreator.createInIFrame({ 
					oAppRef: editor, 
					elPlaceHolder: 'txtContent', 
					sSkinURI: '/plugin/smarteditor2/SmartEditor2Skin.html', 
					fCreator: 'createSEditor2' 
					}); 
				}); 
		*/

		function date_chk1(){
			var start = inputform.co_start_day.value;
			var end = inputform.co_end_day.value;
			
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
		
		//쿠폰 기간 설정
		function radio(val){
			if(val=="expiry_1"){//유효기간 설정 쿠폰일 경우
				/*
				$("#expiry_none").css("display", "none");
				$("#expiry_tr").css("display", "block");
				*/
				$("#date_set").css("display", "none");
				$("#expiry_set").css("display", "block");				
			}else if(val=="expiry_0"){//사용기간 설정 쿠폰일 경우
				/*
				$("#expiry_tr").css("display", "none");
				$("#expiry_none").css("display", "block");
				*/
				$("#expiry_set").css("display", "none");
				$("#date_set").css("display", "block");	
			}
		}
		
		//쿠폰 타입 설정
		function pro_chk(val){
			if(val=="product"){//상품 쿠폰일 경우 상품 선택창 출력
				$("#product_1").css("display", "block");		
				$("#product_0").css("display", "none");		
				$( 'input#is_product').val('1');					
			}else if(val!="product"){//배송비, 장바구니 쿠폰일 경우
				$("#product_1").css("display", "none");		
				$("#product_0").css("display", "block");
				$( 'input#is_product').val('0');			
			}
		}		
		
		window.onload=function(){
			${alerttext}
		}
		
		</script>
		<style type="text/css">
			#input_form{
			margin: 20px;	
			}
			table {
				margin:0 auto;
				 min-width: 1000px;
			}
			#btn_div{
			 text-align: center;
			}
			/*
			#expiry_tr{
				display: none;
			}*/
			#date_set{
				display:none;
			}
			#expiry_set{
				display:block;
			}		
			#product_1{
				display:none;
			}	
		</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>쿠폰 입력</h1>
			<form action="coupon_insert" name="inputform" method="post">
				<div id="input_form">
					<table border="1" style="width:1000px; margin:0;">
						<tr>
							<th>쿠폰명</th>
							<td><input type="text" name="co_name" style="font-size:15px; height:33px; width:800px; min-width:200px; border:none; background:inherit;"></td>
						</tr>
						<tr>
							<th>쿠폰 사용기간 선택</th>
							<td>
								<input type="radio" name="co_select" value="expiry_1" onchange="radio(this.value)" checked> 쿠폰을 다운로드 한 날짜부터의 유효기간을 지정합니다.<br>
								<input type="radio" name="co_select" value="expiry_0" onchange="radio(this.value)" > 쿠폰 사용 종요일을 최종 사용일로 지정합니다.(사용 기간 쿠폰종료일 까지)
							</td>
						</tr>
						<tr>
							<th>쿠폰 사용 기간</th>
							<fmt:formatDate var="sys" value="${sysdate}" pattern="yyyy-MM-dd"/>
							<td id="date_set">시작일 : <input type="date" name="str1"  value="${sys}" onchange="date_chk1()"> ~ 
							종료일 : <input type="date" name="str2" onchange="date_chk1()" ></td>
							<td  id="expiry_set" style="height:33px; line-height:42px;">다운로드 일부터 <textarea maxlength="3" name="co_expiry"  style="border:1px solid rgb(118, 118, 118); overflow:hidden;padding-left:5px; margin:0; width:100px; height:20px; background:inherit; block:inline-block;">0</textarea>일 까지</td>
						</tr>
						<tr >
							<th>쿠폰 타입</th>
							<td>
								<select name="co_type" onchange="pro_chk(this.value)">
									<option value="">선택 안 함</option>
									<option value="delivery">배송비</option>
									<option value="product">제품</option>
									<option value="cart">장바구니</option>
								</select>
							</td>
						</tr>
						<tr>
							<th  id="product_select">상품 선택</th>
							<td id="product_0">지정 안 함</td>
							<td  id="product_1">
								<select name="co_product">
									<option value="0">선택 안 함</option>
									<c:forEach var="product_list" items="${product_list }">
										<option value=${product_list.productdto.p_num }>[${product_list.productdto.p_num}]${product_list.productdto.p_name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>						
						<tr >
							<th>할인금액</th>
							<td><input type="text" maxlength="5" name="co_discount">원 할인</td>
						</tr>
						<tr >
							<th>사용 가능 주문금액</th>
							<td>주문금액 최소 <input type="text" maxlength="5" name="co_condition">원 이상</td>
						</tr>						
					</table>
							<input type="hidden" name="is_product" id="is_product"><!-- 상품 유무 전송값 -->					
					<div id="btn_div" style="margin-top:10px; width:1000px; margin-bottom:300px;">
						<div id="btn_wrap" style="width:80px; float:right;">
							<button type="button" onclick="location.href='ad_coupon_list'">목록</button>
							<button type="submit">등록</button>
						</div>
					</div>
				</div>
			</form>
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
