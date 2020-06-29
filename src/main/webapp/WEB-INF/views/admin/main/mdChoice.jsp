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
   		function mdChoice(){
   			$("select[name=best1]").each(function(){
   				var chk_value =$(this).attr('id'); // ${idx.count}
   				var sp = $("#p1_"+chk_value).text().split("_");
   				var pNum = sp[0];
	   			if($(this).val()=="0"){
	   				alert("상품을 선택하지 않으셨습니다. 상품을 먼저 선택해주시기 바랍니다.");
	   				return false;
	   			}
	   			if($("#exp_"+chk_value).val()==""){
	   				alert("상품 설명을 적어주시기 바랍니다.");
	   				return false;
	   			}
   				
   				var arrData = [$(this).val(),$("#exp_"+chk_value).val(),pNum];
   				alert(arrData);
   				
	   			$.ajax({
					type: "POST",       // get/post
					url: "update_MD",     // controller json 데이터 링크주소
					data: JSON.stringify(arrData),
					contentType: "application/json;charset=UTF-8",  // 한글처리
					success: function(data){     
						alert("데이터 성공");
					},
					error: function(){
						alert("데이터 가져오기 실패");
					}
				});
   			});
   			location.href="admin_mdChoice";
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
			
		table tr td{padding: 10px; font-family:}
		
/* 		table .hidden{display:none;} */
		
		.title {font-weight: bold; background-color: #6f809a; color: white; text-align: center;}
		.sub {text-align: center; width: 100px; font-weight: bold;}
		.hidden {width: 500px; word-break:keep-all;}
		
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
		<h1>NEW PRODUCT</h1>
		<div id="bestseller_list">
			<div id="roll_bann" class="small_box">
				<form id="mdChoice" method="post" action="" onsubmit="return mdChoice();">
					<table border="1" id="tb1">
						<tr>
							<td class="title">No.</td>
							<td class="title">목록</td>
							<td class="title">등록된 상품</td>
							<td class="title">상품 변경</td>
						</tr>
						<c:forEach var="mdList" items="${mdList }" varStatus="idx">
							<tr>
								<td class="sub" rowspan="2">${idx.count }</td>
								<td class="sub">상품명</td>
								<td class="hidden" id="p1_${idx.count }">${mdList.p_num}_${mdList.pDto.p_name}</td>
								<td>
									<select name="best1" class="sel" id="${idx.count }">
										<option value="0">상품 선택</option>
										<c:forEach var="product_list" items="${product_list }">
											<option value="${product_list.p_num }">
											[${product_list.p_num}]${product_list.p_step1 } > ${product_list.p_step2 }: ${product_list.p_name }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td class="sub">상품 설명</td>
								<td class="hidden" id="p2">${mdList.explain}</td>
								<td>
									<textarea rows="5" cols="80" id="exp_${idx.count }"></textarea>
								</td>
							</tr>
						</c:forEach>
						
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