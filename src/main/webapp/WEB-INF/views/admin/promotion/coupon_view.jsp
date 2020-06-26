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
		<title>쿠폰 조회/수정</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="admin/se2/js/HuskyEZCreator.js" charset="utf-8"></script> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- 페이지 로딩시 초기화 --> 
		<script>
		
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
				$("#date_set").hide();
				$("#expiry_set").show();	
			}else if(val=="expiry_0"){//사용기간 설정 쿠폰일 경우
				/*
				$("#expiry_tr").css("display", "none");
				$("#expiry_none").css("display", "block");
				*/
				$("#expiry_set").hide();
				$("#date_set").show();
			}
		}
		
		//쿠폰 타입 설정
		function pro_chk(val){
			if(val=="product"){//상품 쿠폰일 경우 상품 선택창 출력
				$("#product_1").show();	
				$("#product_0").hide();	
				//$( 'input#is_product').val('1');					
			}else if(val!="product"){//배송비, 장바구니 쿠폰일 경우
				$("#product_1").hide();	
				$("#product_0").show();	
				//$( 'input#is_product').val('0');			
			}
		}		
		
		
		
		window.onload=function(){
			${alerttext}
		}
		
		$(document).ready(function(){
			if(${coupon_info.utildto.str1=='-'}){
				//유효기간 쿠폰일 경우
				$('input:radio[name="co_select"][value="expiry_1"]').attr("checked", "checked");
				$( '#date_set' ).hide();
				$( '#original_date' ).hide();				
			} else {
				//기간제 쿠폰일 경우
				$('input:radio[name="co_select"][value="expiry_0"]').attr("checked", "checked");
				$( '#expiry_set' ).hide();			
				$( '#original_expiry' ).hide();						
			}
			
			if(${coupon_info.coupondto.co_type=='delivery'}){
				//적용 상품 없는 쿠폰일 경우
				$("#co_type").val("delivery").prop("selected", true);
				$( '#product_1' ).hide();				
			} else if(${coupon_info.coupondto.co_type=='cart'}){
				$("#co_type").val("cart").prop("selected", true);
				$( '#product_1' ).hide();							
			} else if(${coupon_info.coupondto.co_type=='product'}){
				$("#co_type").val("product").prop("selected", true);
				$( '#product_0' ).hide();								
			}
			/*
			$("#check_all").click(function(){
				
				if($("input:checkbox[id='check_all']").is(":checked")==true){
					$("input:checkbox[name='chk_ids']").prop("checked", true);
				}else{
					$("input:checkbox[name='chk_ids']").prop("checked", false);
				}
				
			});*/
			
		});

		//쿠폰 삭제 체크
		function del_check(co_num){
			if(confirm("해당 쿠폰을 삭제 하시겠습니까? \n(삭제한 데이터는 복구할 수 없습니다.)")){
	            $.ajax({
	                  url : "coupon_delete",
	                  method : "POST",
	                  data: JSON.stringify(co_num),
	                  dataType : "json",
	                  contentType: "application/json",
	                  success : function(val){
	                     if(val == 1){ //리턴값이 1이면 (=성공)
	                        alert("삭제를 완료했습니다.");
	                        location.href='ad_coupon_list'; //페이지 새로고침
	                     }else{ // 0이면 실패
	                        alert("삭제 실패.");
	                     }
	                  },
	                  error : function(){
	                     alert("서버통신실패");
	                  }
	               });
	         }
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
			#date_set{
				display:none;
			}
			#expiry_set{
				display:block;
			}		
			#product_1{
				display:none;
			}	
			}*/
		</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>쿠폰 조회/수정</h1>
			<form action="coupon_modify" name="inputform" method="post">
				<div id="input_form">
					<table border="1">
						<tr>
							<td>쿠폰명</td>
							<td><textarea name="co_name">${coupon_info.coupondto.co_name }</textarea></td>
						</tr>
						
						<tr id="original">
								<td>기존 쿠폰 사용 기간</td>
								<td id="original_date">${coupon_info.utildto.str1 } ~ ${coupon_info.utildto.str2 }</td>
								<td  id="original_expiry">다운로드 일부터 ${coupon_info.utildto.str3 }일 까지	
								<input type="hidden" name="originStart" value="${coupon_info.utildto.str1 }">
								<input type="hidden" name="originEnd" value="${coupon_info.utildto.str2 }">
								</td>
						</tr>						
						<tr>
							<td>쿠폰 사용기간 유형 변경</td>
							<td>
								<input type="radio" name="co_select" value="expiry_1" onchange="radio(this.value)" > 쿠폰을 다운로드 한 날짜부터의 유효기간을 지정합니다.<br>
								<input type="radio" name="co_select" value="expiry_0" onchange="radio(this.value)" > 쿠폰 사용 종요일을 최종 사용일로 지정합니다.(사용 기간 쿠폰종료일 까지)
								
							</td>
						</tr>		
						<tr>
								<td>쿠폰 사용 기간 변경</td>
								<fmt:formatDate var="sys" value="${sysdate}" pattern="yyyy-MM-dd"/>
								<td id="date_set">시작일 : <input type="date" name="str1"  value="${sys}" onchange="date_chk1()"> ~ 
								종료일 : <input type="date" name="str2" onchange="date_chk1()" ></td>
								<td  id="expiry_set">다운로드 일부터 <textarea  maxlength="3" name="co_expiry" >${coupon_info.utildto.str3 }</textarea>일 까지
								<input type="hidden" name="originExpiry" value="${coupon_info.utildto.str3 }">
								</td>
						</tr>
						<tr >
							<td> 기존 쿠폰 타입</td>
							<td>
								<c:if test="${coupon_info.coupondto.co_type =='delivery'}">배송</c:if>
								<c:if test="${coupon_info.coupondto.co_type =='cart'}">장바구니</c:if>							
								<c:if test="${coupon_info.coupondto.co_type =='product'}">상품</c:if>								
							</td>
						</tr>						
						<tr >
							<td>쿠폰 타입 변경</td>
							<td>
								<input type="hidden" value="${coupon_info.coupondto.co_type}" name="coType">
								<select id="co_type" name="co_type" onchange="pro_chk(this.value)">
									<option value="none">선택 안 함</option>
									<option value="delivery">배송비</option>
									<option value="product">제품</option>
									<option value="cart">장바구니</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>기존 적용 상품</td>
							<c:if test="${coupon_info.productdto.p_name=='-'}"><td>-</td></c:if>
							<c:if test="${coupon_info.productdto.p_name!='-'}">
								<td>
									[${coupon_info.coupondto.co_product }]${coupon_info.productdto.p_name }
								</td>
							</c:if>							
						</tr>				
						<script>
							function checkProChange(){
								inputform.pro_change_sign.value='on';
							}
							
						</script>				
						<tr>
							<td  id="product_select">적용 상품 변경</td>
							<td id="product_0">지정 안 함</td>
							<td  id="product_1">
								<select name="co_product" onclick="checkProChange()">
									<option value="0">선택 안 함</option>
									<c:forEach var="product_list" items="${product_list }">
										<option value=${product_list.productdto.p_num }>[${product_list.productdto.p_num}]${product_list.productdto.p_name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>						
						
						
						<tr >
							<td>할인금액</td>
							<td><textarea maxlength="5" name="co_discount">${coupon_info.coupondto.co_discount }</textarea>원 할인</td>
						</tr>
						<tr >
							<td>사용 가능 주문금액</td>
							<td>주문금액 최소<textarea maxlength="5" name="co_condition">${coupon_info.coupondto.co_condition}</textarea>원 이상</td>
						</tr>						
					</table>
							<input type="hidden" name="is_product" id="is_product"><!-- 상품 유무 전송값 -->					
							<input type="hidden" name="co_num" value="${coupon_info.coupondto.co_num }">
						
						
					<div id="btn_div">
						<button type="button" onclick="location.href='ad_coupon_list'">목록</button>
						<button type="button" onclick="submitCheck()" >수정</button>	
						<button type="button" onclick="del_check(${coupon_info.coupondto.co_num})">삭제</button>							
					</div>
				</div>
				
				<c:if test="${coupon_info.coupondto.co_product==0 ||  coupon_info.coupondto.co_product==null}">
					<input type="hidden" name="originProduct" value="0"  id="originProduct" >									
				</c:if>
				<c:if test="${coupon_info.coupondto.co_product!=0 ||  coupon_info.coupondto.co_product!=null}">
					<input type="hidden" name="originProduct" value="${coupon_info.coupondto.co_product}"  id="originProduct" >									
				</c:if>	
				
			</form>
			<script type="text/javascript">
				function submitCheck(){
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
					if(inputform.co_product.value==0 || inputform.co_product.value=='0' || inputform.co_product.value== inputform.originProduct.value){
						//적용상품 수정 안 할 경우
						inputform.co_product.value=$('#originProduct').val();
						
					}	
					
					inputform.submit();
					
				}
			</script>
	</section>
	</body>
</html>
<!--<script type="text/javascript" src = "admin/js/notice_write.js"></script>    -->
