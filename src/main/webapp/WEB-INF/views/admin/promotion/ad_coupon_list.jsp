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
		<title>쿠폰 관리</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<script type="text/javascript" src="admin/js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="admin/js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="admin/js/prefixfree.dynamic-dom.min.js"></script>
        <link rel="stylesheet" type="text/css" href="admin/css/list_button.css">   
		<link rel="stylesheet" type="text/css" href="admin/css/a_setting.css">		
		<script type="text/javascript" src="admin/js/admin_board.js"></script>		 	
		<style type="text/css">
			
			#search_form table{
				text-align: left;
				margin-bottom: 50px;
			}
			
			#search_form table tr:NTH-LAST-CHILD(1){
				text-align: center;
			}
			
			#event_list img{
				width: 400px;
				height: 250px;
			}
			#search_date td button{
				border: 1px solid black;
				padding: 4px;
			}
		</style>
		<script type="text/javascript">

	
	//체크박스 전체 선택/해제
	$(document).ready(function(){
		$("#check_all").click(function(){
			
			if($("input:checkbox[id='check_all']").is(":checked")==true){
				$("input:checkbox[name='chk_ids']").prop("checked", true);
			}else{
				$("input:checkbox[name='chk_ids']").prop("checked", false);
			}
			
		});
		
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
                        location.reload(); //페이지 새로고침
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
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/promotion_nav.jsp"/>
	<section>
		<h1>쿠폰 관리</h1>
		<div id="main_list">
			<div id="main_user_list">
				<!--  <h2>쿠폰 검색</h2>-->
				<div class="list_count">총 쿠폰 수 : ${coupon_list.size() }</div>
				<div style="margin-bottom:5px;">
					<button onclick="location.href='coupon_write'">새 쿠폰 추가</button>
				</div>
			
				<div>
				
					<table border="1" id="event_list">
						<tr>
							<th><input type="checkbox" id="check_all" ></th>
							<th>번호</th>
							<th>쿠폰명</th>
							<th>쿠폰 타입</th>
							<th>할인 금액</th>	
							<th>적용 제품명</th>								
							<th>쿠폰 사용 조건 금액</th>								
							<th>사용 가능 시작일</th>
							<th>사용 가능 종료일</th><!-- orderlistdto -->						
							<th>쿠폰 유효기간</th>
							<th>수정/삭제</th>
						</tr>
						<c:forEach var="coupon_list" items="${coupon_list }">
						<tr>
							<td><input type="checkbox"  name="chk_ids" value="${coupon_list.coupondto.co_num  }"></td>
							<td>${coupon_list.coupondto.rownum }</td>
							<td>
								<a href="coupon_view?co_num=${coupon_list.coupondto.co_num }">
									${coupon_list.coupondto.co_name }
								</a>
							</td>
							<c:if test="${coupon_list.coupondto.co_type=='delivery' }"><td>배송</td></c:if>
							<c:if test="${coupon_list.coupondto.co_type=='cart' }"><td>장바구니</td></c:if>							
							<c:if test="${coupon_list.coupondto.co_type=='product' }"><td>상품</td></c:if>	
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${coupon_list.coupondto.co_discount }" /></td>
							<td>${coupon_list.productdto.p_name }</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${coupon_list.coupondto.co_condition }" /></td>				
							<td>${coupon_list.utildto.str1 }</td>											
							<td>${coupon_list.utildto.str2 }</td>
							<td>${coupon_list.utildto.str3}</td>				
							<td>
								<button type="button" onclick="location.href='coupon_view?co_num=${coupon_list.coupondto.co_num}'">
									수정
								</button>
								<button type="button" onclick="del_check(${coupon_list.coupondto.co_num})">삭제</button>
							</td>							
						</tr>
						</c:forEach>
					</table>
				
				<div class="detail_btn" style="text-align:left; cursor:pointer;">
							<a onclick="couponSomeDelete()">선택 삭제</a>
							<!-- 선택된 체크박스 값 체크용 -->
							 <input type="hidden" name="hiddenValue" id="hiddenValue" value=""/>
				</div>				
				</div>
			</div>
				</div>
	</section>
	</body>
</html>