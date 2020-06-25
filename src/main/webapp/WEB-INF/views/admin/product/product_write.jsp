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
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="admin/js/jquery-3.4.1.min.js"></script>
		<!-- 페이지 로딩시 초기화 --> 
		<script>
		
		function checkForm() {
			var regexp = /^[0-9]*$/;
			
			if(regexp.test(inputform.p_price.value){
				alert("가격을 숫자만 입력 가능합니다.");
				return false;
			}
			
			if(regexp.test(inputform.p_stock.value){
				alert("재고는 숫자만 입력 가능합니다.");
				return false;
			}
			
			inputform.submit()==true;
			
		}
		
		function aa(val) {
		//step1의 value와 step2의 id와 일치한 애들을 class를 빼준다.(일단 전부 넣어주고 나서)
		var step2= document.getElementsByClassName("step2");
		var option = document.getElementById(val);
		
		
		$(".step2").css("display", "none");
		$(".step2").removeAttr("name");
		
		$(option).css("display", "block");
		$(option).attr("name", "p_step2")
		}
		
		function point_change(val) {
			var point = val*0.01;
			$("#point").val(point);
		}
		
// 		//제품 등록 전 검사
// 		function insertChk() {
// 			alert(inputform.p_thumb_img2.value);
// 			if(inputform.p_name.value == ""){
// 				alert("상품의 이름을 입력해주세요."); 
// 				inputform.p_name.focus();
// 				return false;
				
// 			}
			
			
// 		}
		
		</script>
		<style type="text/css">
			#input_form{
			margin: 20px;	
			}
			table {
				margin:0 auto;
				 min-width: 1000px;
			}
			table tr td:NTH-OF-TYPE(1) {
				width: 100px;
				height: 30px;
			}
			#btn_div{
			 text-align: center;
			}
			.step2{
 				display : none;
			}
		</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/product_nav.jsp"/>
	<section>
		<h1>제품 등록</h1>
			<form action="product_insert" name="inputform" method="POST" enctype="multipart/form-data" onsubmit="return checkForm();">
				<div id="input_form">
					<table border="1">
						<tr>
							<td>분류 1</td>
							<td>
							<select name="p_step1" onchange="aa(this.value)">
								<option value="원두">원두</option>
								<option value="인스턴트 커피">인스턴트 커피</option>
								<option value="차">차</option>
								<option value="음료/커피/티">음료/커피/티</option>
								<option value="선물세트">선물세트</option>
								<option value="브랜드관">브랜드관</option>
								<option value="용품">용품</option>
							</select>
							</td>
						</tr>
						<tr>
							<td>분류 2</td>
							<td>
							<select id="원두" class="step2" name="p_step2" style="display: inline;">
								<option value="클래스">클래스</option>
								<option value="바리스타">바리스타</option>	
								<option value="미스터즈">미스터즈</option>	
								<option value="쟈뎅">쟈뎅</option>	
							</select>
							<select  id="인스턴트 커피" class="step2">
								<option value="카페모리">오리지널 카페모리</option>	
								<option value="에스프레소 스틱">에스프레소 스틱 커피백</option>	
							</select>
							<select  id="차" class="step2">
								<option value="아워티(티백)">아워티(티백)</option>	
							</select>
							<select  id="음료/커피/티" class="step2">
								<option value="시그니처">시그니처</option>
								<option value="카페리얼">카페리얼</option>	
								<option value="아워티(음료)">아워티(음료)</option>	
							</select>
							<select  id="선물세트" class="step2">
								<option value="선물세트">선물세트</option>
								<option value="DIY 선물세트">DIY 선물세트</option>	
							</select>
							<select  id="브랜드관" class="step2">
								<option value="GS">GS</option>
								<option value="투썸">투썸</option>
								<option value="드롭탑">드롭탑</option>
								<option value="요거프레소">요거프레소</option>
							</select>
							<select  id="용품" class="step2">
								<option value="커피용품">커피용품</option>
							</select>
							</td>
						</tr>
						<tr>
							<td>제품명</td>
							<td><input type="text" name="p_name" maxlength="40" required></td>
						</tr>
						<tr>
							<td>가격</td>
							<td><input type="text" name="p_price" onchange="point_change(this.value)" max="9999999" required></td>
						</tr>
						<tr>
							<td>포인트</td>
							<td><input type="text" name="p_point" id="point" readonly required>제품 가격의 1%</td>
						</tr>
						<tr>
							<td>식품유형</td>
							<td><input type="text" name="p_type" maxlength="10" required></td>
						</tr>
						<tr>
							<td>유전자 재조합 유무</td>
							<td>
								<label>예<input type="radio" name="p_gene" value="유전자 재조합 상품" >&nbsp;&nbsp;&nbsp;</label>
								<label>아니오<input type="radio" name="p_gene" value="해당사항없음" checked></label>
							</td>
						</tr>
						<tr>
							<td>수입식품 여부</td>
							<td>
								<label>예<input type="radio" name="p_import" value="수입식품">&nbsp;&nbsp;&nbsp;</label>
								<label>아니오<input type="radio" name="p_import" value="해당사항없음" checked></label>
							</td>
						</tr>
						<tr>
							<td>재고</td>
							<td><input type="text" name="p_stock" max="99999" required></td>
						</tr>
						<tr>
							<td>제품 대표이미지</td>
							<td><input type="file" name="thumb_img1" required></td>
<!-- 							<td><input type="text" name="p_thumb_img1"></td> -->
						</tr>
						<tr>
							<td>제품 이미지1</td>
							<td><input type="file" name="thumb_img2"></td>
<!-- 							<td><input type="text" name="p_thumb_img2"></td> -->
						</tr>
						<tr>
							<td>제품 이미지2</td>
							<td><input type="file" name="thumb_img3"></td>
<!-- 							<td><input type="text" name="p_thumb_img3"></td> -->
						</tr>
						<tr>
							<td>상세내용 이미지</td>
							<td><input type="file" name="content_img" required></td>
<!-- 							<td><input type="text" name="p_content_img"></td> -->
						</tr>
					</table>
					<div id="btn_div">
						<button type="button" onclick="location.href="입력전페이지 이동">취소</button>
						<button type="button" onclick="location.href="유효성 검사">등록</button>
						<button type="submit"  >임시등록</button>
<!-- 						onclick="insertChk()" -->
					</div>
				</div>
			</form>
	</section>
	</body>
</html>
