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
    $(document).ready(function () {
    	console.log('${sale.getP1()}');
    	$("#p1").val("${sale.getP1()}").attr("selected","selected");
    	$("#p2").val("${sale.getP2()}").attr("selected","selected");
    	$("#p3").val("${sale.getP3()}").attr("selected","selected");
    	$("#p4").val("${sale.getP4()}").attr("selected","selected");
    	$("#p5").val("${sale.getP5()}").attr("selected","selected");
    	$("#p6").val("${sale.getP6()}").attr("selected","selected");
    	$("#p7").val("${sale.getP7()}").attr("selected","selected");
    	$("#p8").val("${sale.getP8()}").attr("selected","selected");
    	$("#p9").val("${sale.getP9()}").attr("selected","selected");
    	$("#p10").val("${sale.getP10()}").attr("selected","selected");

    });
    </script>
    <style>
    .banners{ width: 100px;}
    .bannerImg{margin-top: 41px;}
    .small_box{border-bottom : 1px solid #e2e2e2; margin-bottom: 20px; padding-bottom: 20px;}
    </style>
</head>
<body>
    <jsp:include page="../nav/admin_header.jsp" />
    <jsp:include page="../nav/main_nav.jsp" />
    <section>
        <h1>sale 상품 관리</h1>
        <div id="main_list">
            <div id="products" class="small_box">
	            <div class="select_p">
	            
		            <form action="sale_regi" method="post" name="jardin_brand">
		                <span>상품1</span>
		                <select name="p1" id="p1">
							<option value="0">선택 안 함</option>
							<c:forEach var="product_list" items="${product_list }">
								<option value=${product_list.productdto.p_num }>[${product_list.productdto.p_num}]${product_list.productdto.p_name }</option>
							</c:forEach>
						</select>
						<br>
		                <span>상품2</span>
		                <select name="p2" id="p2">
							<option value="0">선택 안 함</option>
							<c:forEach var="product_list" items="${product_list }">
								<option value=${product_list.productdto.p_num }>[${product_list.productdto.p_num}]${product_list.productdto.p_name }</option>
							</c:forEach>
						</select>
						<br>
		                <span>상품3</span>
		                <select name="p3" id="p3">
							<option value="0">선택 안 함</option>
							<c:forEach var="product_list" items="${product_list }">
								<option value=${product_list.productdto.p_num }>[${product_list.productdto.p_num}]${product_list.productdto.p_name }</option>
							</c:forEach>
						</select>
						<br>
		                <span>상품4</span>
		                <select name="p4" id="p4">
							<option value="0">선택 안 함</option>
							<c:forEach var="product_list" items="${product_list }">
								<option value=${product_list.productdto.p_num }>[${product_list.productdto.p_num}]${product_list.productdto.p_name }</option>
							</c:forEach>
						</select>
						<br>
		                <span>상품5</span>
		                <select name="p5" id="p5">
							<option value="0">선택 안 함</option>
							<c:forEach var="product_list" items="${product_list }">
								<option value=${product_list.productdto.p_num }>[${product_list.productdto.p_num}]${product_list.productdto.p_name }</option>
							</c:forEach>
						</select>
						<br>
		                <span>상품6</span>
		                <select name="p6" id="p6">
							<option value="0">선택 안 함</option>
							<c:forEach var="product_list" items="${product_list }">
								<option value=${product_list.productdto.p_num }>[${product_list.productdto.p_num}]${product_list.productdto.p_name }</option>
							</c:forEach>
						</select>
						<br>
		                <span>상품7</span>
		                <select name="p7" id="p7">
							<option value="0">선택 안 함</option>
							<c:forEach var="product_list" items="${product_list }">
								<option value=${product_list.productdto.p_num }>[${product_list.productdto.p_num}]${product_list.productdto.p_name }</option>
							</c:forEach>
						</select>
						<br>
		                <span>상품8</span>
		                <select name="p8" id="p8">
							<option value="0">선택 안 함</option>
							<c:forEach var="product_list" items="${product_list }">
								<option value=${product_list.productdto.p_num }>[${product_list.productdto.p_num}]${product_list.productdto.p_name }</option>
							</c:forEach>
						</select>
						<br>
		                <span>상품9</span>
		                <select name="p9" id="p9">
							<option value="0">선택 안 함</option>
							<c:forEach var="product_list" items="${product_list }">
								<option value=${product_list.productdto.p_num }>[${product_list.productdto.p_num}]${product_list.productdto.p_name }</option>
							</c:forEach>
						</select>
						<br>
		                <span>상품10</span>
		                <select name="p10" id="p10">
							<option value="0">선택 안 함</option>
							<c:forEach var="product_list" items="${product_list }">
								<option value=${product_list.productdto.p_num }>[${product_list.productdto.p_num}]${product_list.productdto.p_name }</option>
							</c:forEach>
						</select>
						<br>
						
						
						
						<input type="submit" value="등록">
						
		            </form>
		            
	            </div>
            </div>
        </div>
    </section>
</body>
</html>