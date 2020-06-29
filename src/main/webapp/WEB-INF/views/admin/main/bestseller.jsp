<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
   		function chk(){
   			var best1 = $("select[name=best1]").val();
   			var best2 = $("select[name=best2]").val();
   			var best3 = $("select[name=best3]").val();
   			var best4 = $("select[name=best4]").val();
   			var best5 = $("select[name=best5]").val();
   			
   			var inputData = {
					product1 : best1,
					product2 : best2,
					product3 : best3,
					product4 : best4,
					product5 : best5,
				}
   			
   			if(best1=="0" || best2=="0" || best3=="0"){
   				alert("베스트샐러 상품 1~3은 반드시 등록해야 합니다.");
   				return false;
   			}
   			
   			var count = 0;
   			for(var i=0; i<5; i++){
   				for(var j=0; j<5; j++){
					if(i != j){
						if($(".sel").eq(i).val()!="0" && $(".sel").eq(j).val()!="0" ){
		   					if($(".sel").eq(i).val()== $(".sel").eq(j).val()){
		   						count +=1;
		   					}
						}
					}   					
   				}
   			}
   			
   			if(count>0){
   				alert("2개 이상 같은 상품을 선택하셨습니다. 다시 선택해주시기 바랍니다.");
   				return false;
   			}
   			
   			$.ajax({
				type: "POST",       // get/post
				url: "insert_bestseller",     // controller json 데이터 링크주소
				data: JSON.stringify(inputData),
				contentType: "application/json;charset=UTF-8",  // 한글처리
				success: function(data){     
					alert("데이터 성공");
					location.href="admin_bestseller";
				},
				error: function(){
					alert("데이터 가져오기 실패");
				}
			});
   		}
   		
    </script>
    <style>
    	#bestseller_list {margin: 15px 0px;}
		table {
			margin:0 auto;
			min-width: 1000px;
			border-collapse: collapse;
			border: 1px solid #d6dce7;
		}
			
		table tr td{padding: 10px; }
		
/* 		table .hidden{display:none;} */
		
		.title {font-weight: bold; background-color: #6f809a; color: white; text-align: center;}
		.sub {text-align: center; }
		
		select {height: 30px;}
		
		#btn_div{
			 text-align: center;
			 margin-top: 15px;
			}
			
		.btns {width: 65px; height: 30x; font-size:20px; margin-right: 20px;}
			
    </style>
</head>
<body>
    <jsp:include page="../nav/admin_header.jsp" />
    <jsp:include page="../nav/main_nav.jsp" />
	<section>
		<h1>BEST SELLER</h1>
		<div id="bestseller_list">
			<div id="roll_bann" class="small_box">
				<form id="main_bestseller" method="post" action="" onsubmit="return chk();">
					<table border="1" id="tb1">
						<tr>
							<td class="title">목록</td>
							<td class="title">등록된 상품</td>
							<td class="title">상품 변경</td>
						</tr>
						<tr>
							<td class="sub">베스트셀러 상품 1</td>
							<td class="hidden" id="p1">
								<c:if test="${savedBS.product1==0 }">
								등록된 상품이 없습니다.
								</c:if>
								<c:if test="${savedBS.product1!=0 }">
								${p1.p_name}
								</c:if>
							</td>
							<td>
								<select name="best1" class="sel">
									<option value="0">상품 선택</option>
									<c:forEach var="product_list" items="${product_list }">
										<option value="${product_list.p_num }">
										[${product_list.p_num}]${product_list.p_step1 } > ${product_list.p_step2 }: ${product_list.p_name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td class="sub">베스트셀러 상품 2</td>
							<td class="hidden" id="p2">
								<c:if test="${savedBS.product2==0 }">
								등록된 상품이 없습니다.
								</c:if>
								<c:if test="${savedBS.product2!=0 }">
								${p2.p_name}
								</c:if>
							</td>
								<td>
								<select name="best2" class="sel">
									<option value="0">상품 선택</option>
									<c:forEach var="product_list" items="${product_list }">
										<option value="${product_list.p_num }">
										[${product_list.p_num}]${product_list.p_step1 } > ${product_list.p_step2 }: ${product_list.p_name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td class="sub">베스트셀러 상품 3</td>
							<td class="hidden" id="p3">
								<c:if test="${savedBS.product3==0 }">
								등록된 상품이 없습니다.
								</c:if>
								<c:if test="${savedBS.product3!=0 }">
								${p3.p_name}
								</c:if>
							</td>
								<td>
								<select name="best3" class="sel">
									<option value="0">상품 선택</option>
									<c:forEach var="product_list" items="${product_list }">
										<option value="${product_list.p_num }">
										[${product_list.p_num}]${product_list.p_step1 } > ${product_list.p_step2 }: ${product_list.p_name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td class="sub">베스트셀러 상품 4</td>
							<td class="hidden" id="p4">
								<c:if test="${savedBS.product4==0 }">
								등록된 상품이 없습니다.
								</c:if>
								<c:if test="${savedBS.product4!=0 }">
								${p4.p_name}
								</c:if>
							</td>
								<td>
								<select name="best4" class="sel">
									<option value="0">상품 선택</option>
									<c:forEach var="product_list" items="${product_list }">
										<option value="${product_list.p_num }">
										[${product_list.p_num}]${product_list.p_step1 } > ${product_list.p_step2 }: ${product_list.p_name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td class="sub">베스트셀러 상품 5</td>
							<td class="hidden" id="p5">
								<c:if test="${savedBS.product5==0 }">
								등록된 상품이 없습니다.
								</c:if>
								<c:if test="${savedBS.product5!=0 }">
								${p5.p_name}
								</c:if>
							</td>
								<td>
								<select name="best5" class="sel">
									<option value="0">상품 선택</option>
									<c:forEach var="product_list" items="${product_list }">
										<option value="${product_list.p_num }">
										[${product_list.p_num}]${product_list.p_step1 } > ${product_list.p_step2 }: ${product_list.p_name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>						
					</table>

					<div id="btn_div">
						<button type="button" onclick="location.href='admin_main'" class="btns">취소</button>
						<button type="submit" class="btns">등록</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>