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
		<script type="text/javascript" src="se2/admin/js/HuskyEZCreator.js" charset="utf-8"></script> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- 페이지 로딩시 초기화 --> 
		<script>
		$(document).ready(function(){
				nhn.husky.EZCreator.createInIFrame({ 
					oAppRef: editor, 
					elPlaceHolder: 'txtContent', 
					sSkinURI: '/plugin/smarteditor2/SmartEditor2Skin.html', 
					fCreator: 'createSEditor2' 
					}); 
				
				
			//넘어온 value 넣어주기		
			//step1
			$("#p_step1").each(function(){
			    if($(this).val()=="${pdto.p_step1}"){
			      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
			      $(".step2").css("display", "none");
					$("#${pdto.p_step1}").css("display", "block");
			    }
			});
			
			//step2
			$("#p_step2").each(function(){
			    if($(this).val()=="${pdto.p_step2}"){
			      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
			    }
			});
			
				
		}); 
		
		
		function aa(val) {
		//step1의 value와 step2의 id와 일치한 애들을 class를 빼준다.(일단 전부 넣어주고 나서)
		var step2= document.getElementsByClassName("step2");
		var option = document.getElementById(val);
		
		$(".step2").css("display", "none");
		$("#"+val).css("display", "block");
		}
		
		function point_change(val) {
			var point = val*0.1;
			$("#point").val(point);
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
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>제품 수정</h1>
			<form action="product_update" name="inputform" method="get" enctype="multipart/form-data">
				<div id="input_form">
					<table border="1">
						<tr>
							<td>분류 1</td>
							<td>
							<select name="p_step1" id="p_step1" onchange="aa(this.value)">
								<option value="원두">원두</option>
								<option value="원두커피백">원두커피백</option>
								<option value="인스턴트">인스턴트</option>
								<option value="커피용품">커피용품</option>
								<option value="선물세트">선물세트</option>
								<option value="대량구매">대량구매</option>
							</select>
							</td>
						</tr>
						<tr>
							<td>분류 2</td>
							<td>
							<select name="p_step2" id="원두" class="step2" style="display: inline;">
								<option value="클래스">클래스</option>
								<option value="로스터리샵">로스터리샵</option>	
								<option value="커피휘엘">커피휘엘</option>	
								<option value="산지별생두">산지별 생두</option>	
							</select>
							<select name="p_step2" id="원두커피백" class="step2">
								<option value="드립커피로스트">드립커피 로스트</option>
								<option value="오리지널커피백">오리지널 커피백</option>	
								<option value="마일드커피백">마일드 커피백</option>	
							</select>
							<select name="p_step2" id="인스턴트" class="step2">
								<option value="카페모리">카페모리</option>
								<option value="홈스타일카페모리">홈스타일카페모리</option>	
								<option value="포타제">포타제</option>	
							</select>
							<select name="p_step2" id="음료" class="step2">
								<option value="카페리얼">카페리얼</option>
								<option value="워터커피">워터커피</option>	
								<option value="모히또">모히또</option>	
							</select>
							<select name="p_step2" id="커피용품" class="step2">
								<option value="종이컵">종이컵</option>
								<option value="커피필터">커피필터</option>	
								<option value="기타">종이 등</option>	
							</select>
							</td>
						</tr>
						<tr>
							<td>제품명</td>
							<td><input type="text" name="p_name" value="${pdto.p_num}" maxlength="40"></td>
						</tr>
						<tr>
							<td>가격</td>
							<td><input type="text" name="p_price" value="${pdto.p_price}" onchange="point_change(this.value)" max="9999999"></td>
						</tr>
						<tr>
							<td>포인트</td>
							<td><input type="text" name="p_point" value="${pdto.p_point}" id="point" readonly>제품 가격의 10%</td>
						</tr>
						<tr>
							<td>제조원</td>
							<td><input type="text" name="p_producer" value="${pdto.p_producer}" maxlength="10"></td>
						</tr>
						<tr>
							<td>유통기한</td>
							<td><input type="text" name="p_expiry" value="${pdto.p_expiry}" maxlength="10"></td>
						</tr>
						<tr>
							<td>식품유형</td>
							<td><input type="text" name="p_type" value="${pdto.p_type}" maxlength="10"></td>
						</tr>
						<tr>
							<td>용량</td>
							<td><input type="text" name="p_capacity" value="${pdto.p_capacity}" maxlength="10"></td>
						</tr>
						<tr>
							<td>원재료명 및 함량</td>
							<td><input type="text" name="p_detail" value="${pdto.p_detail}" maxlength="350"></td>
						</tr>
						<tr>
							<td>업소명 및 소재지</td>
							<td><input type="text" name="p_location" value="${pdto.p_location}" maxlength="50"></td>
						</tr>
						<tr>
							<td>유전자 재조합 유무</td>
							<td>
								예<input type="radio" name="p_gene" value="유전자 재조합 상품" <c:if test="${pdto.p_gene} == 유전자 재조합 상품">selected</c:if> >&nbsp;&nbsp;&nbsp;
								아니오<input type="radio" name="p_gene" value="해당사항없음" <c:if test="${pdto.p_gene} == 해당사항없음">selected</c:if> >
							</td>
						</tr>
						<tr>
							<td>수입식품 여부</td>
							<td>
								예<input type="radio" name="p_import" value="수입식품" <c:if test="${pdto.p_import} == 수입식품">selected</c:if> >&nbsp;&nbsp;&nbsp;
								아니오<input type="radio" name="p_import" value="해당사항없음" <c:if test="${pdto.p_import} == 해당사항없음">selected</c:if> >
							</td>
						</tr>
						<tr>
							<td>재고</td>
							<td><input type="text" name="p_stock" value="${pdto.p_stock}" max="99999"></td>
						</tr>
						<tr>
							<td>제품 대표이미지</td>
<!-- 							<td><input type="file" name="p_thumb_img1"></td> -->
							<td><input type="text" name="p_thumb_img1" value="${pdto.p_thumb_img1}"></td>
						</tr>
						<tr>
							<td>제품 이미지1</td>
<!-- 							<td><input type="file" name="p_thumb_img2"></td> -->
							<td><input type="text" name="p_thumb_img2" value="${pdto.p_thumb_img2}"></td>
						</tr>
						<tr>
							<td>제품 이미지2</td>
<!-- 							<td><input type="file" name="p_thumb_img3"></td> -->
							<td><input type="text" name="p_thumb_img3" value="${pdto.p_thumb_img3}"></td>
						</tr>
						<tr>
							<td>상세내용 이미지</td>
<!-- 							<td><input type="file" name="p_content_img"></td> -->
							<td><input type="text" name="p_content_img" value="${pdto.p_content_img}"></td>
						</tr>
					</table>
					<div id="btn_div">
						<button type="button" onclick="location.href="입력전페이지 이동">취소</button>
						<button type="button" onclick="location.href="유효성 검사">등록</button>
						<button type="submit" >임시등록</button>
					</div>
				</div>
			</form>
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
