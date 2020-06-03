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
		<style type="text/css">
			
			#search_form table{
				text-align: left;
				margin-bottom: 40px;
			}
			
			#search_form table tr:NTH-LAST-CHILD(1){
				text-align: center;
			}
			
			#event_list img{
				width: 400px;
				height: 250px;
			}
		</style>
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
		
		function aa(val) {
			var step2= document.getElementsByClassName("step2");
			
			$(".step2").css("display", "none");
			$("#"+val).css("display", "inline-block");
		}
</script>
	<style type="text/css">
		.step2{
 				display : none;
			}
		#list_div{
			height: 500px;
			overflow: scroll;
		}
		.top_cnt{
			color: red;
		}
		#search2 select {
			float: right;
		}
		#search2 p{
			font-size : 13px;
			display: inline-block;
		}
	</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>제품 리스트</h1>
		<div id="main_list">
			<div id="main_user_list">
				<h2>임시로 놔두기</h2>
				<div class="list_count">임시로 놔두기(총 게시물 수 등등 표시?)</div>
				<div id="search_form">
					<form name="inputform" method="get" onsubmit="return false;">
					<table border="1">
						<tr>
							<td>검색어</td>
							<td><select name="">
								<option>아이디</option>
								<option>글제목</option>
								<option>글내용</option>
							</select>
							<input type="text" name="검색키워드">
							</td>
						</tr>
						<tr id="search_date">
							<td>기간검색</td>
							<td>
							<fmt:formatDate var="sys" value="${sysdate}" pattern="yyyy-MM-dd"/>
							<select name="****미정****" >
								<option>등록일</option>
								<option>수정일</option>
							</select>
							<input type="date" name="e_start_day" id="e_start_day" onchange="date_chk2()"> ~ 
							<input type="date" name="e_end_day" id="e_end_day" value="${sys}" onchange="date_chk2()">
							<button type="button" onclick="search_date('today')">오늘</button>
							<button type="button" onclick="search_date('7day')">7일</button>
							<button type="button" onclick="search_date('15day')">15일</button>
							<button type="button" onclick="search_date('1month')">1개월</button>
							<button type="button" onclick="search_date('3month')">3개월</button>
							<button type="button" onclick="search_date('all')">전체</button>
							</td>
						</tr>
						<tr>
							<td>분류</td>
							<td>
							<select name="step1" onchange="aa(this.value)">
								<option value="원두">원두</option>
								<option value="원두커피백">원두커피백</option>
								<option value="인스턴트">인스턴트</option>
								<option value="커피용품">커피용품</option>
								<option value="선물세트">선물세트</option>
								<option value="대량구매">대량구매</option>
							</select>
							
							<select name="step2" id="원두" class="step2" style="display: inline;">
								<option value="">클래스</option>
								<option value="">로스터리샵</option>	
								<option value="">커피휘엘</option>	
								<option value="">산지별 생두</option>	
							</select>
							<select name="step2" id="원두커피백" class="step2">
								<option value="">드립커피 로스트</option>
								<option value="">오리지널 커피백</option>	
								<option value="">마일드 커피백</option>	
							</select>
							<select name="step2" id="인스턴트" class="step2">
								<option value="">카페모리</option>
								<option value="">홈스타일카페모리</option>	
								<option value="">포타제</option>	
							</select>
							<select name="step2" id="음료" class="step2">
								<option value="">카페리얼</option>
								<option value="">워터커피</option>	
								<option value="">모히또</option>	
							</select>
							<select name="step2" id="커피용품" class="step2">
								<option value="">카페리얼</option>
								<option value="">워터커피</option>	
								<option value="">모히또</option>	
							</select>
							</td>
						</tr>
						<tr>
							<td colspan="2"><button onclick="search()">검색</button></td>
							<td></td>
						</tr>
					</table>
					</form>
				</div>
				<div id="search2">
					<p>검색 <span class="top_cnt">22</span>개 / 전체<span class="top_cnt">22</span>개 | 품절 <span class="top_cnt">1</span>개</p>
					<select name="sort" onchange="에이작스스크립트()">
								<option value="">등록일 ↑</option>
								<option value="">등록일 ↓</option>	
								<option value="">상품명 ↑</option>
								<option value="">상품명 ↓</option>	
								<option value="">판매가 ↑</option>
								<option value="">판매가 ↓</option>	
							</select>
				</div>
				<div id="list_div">
					<table border="1" id="event_list">
						<tr>
							<th><input type="checkbox"></th>
							<th>번호</th>
							<th>상품코드</th>
							<th>이미지</th>
							<th>상품명</th>
							<th>판매가</th>
							<th>포인트</th>
							<th>재고</th>
							<th>등록일</th>
							<th>수정일</th>
							<th>판매상태</th>
							<th>수정</th>
						</tr>
						<c:forEach items="${list}" var="pro" >
						<tr>
							<td><input type="checkbox"></td>
							<td>${pro.p_num}</td>
							<td>${pro.p_thumb_img1}${pro.p_thumb_img2}${pro.p_thumb_img3}
<%-- 								<img alt="썸네일" src="${pro.p_thumb_img1}"> --%>
<%-- 								<img alt="상단이미지1" src="${pro.p_thumb_img2}"> --%>
<%-- 								<img alt="상단이미지2" src="${pro.p_thumb_img3}"> --%>
							</td>
							<td>${pro.p_name}</td>
							<td>${pro.p_price}</td>
							<td>${pro.p_point}</td>
							<td>${pro.p_stock}</td>
							<td>${pro.p_sysdate}</td>
							<td>${pro.p_update}</td>
							<td>${pro.p_delflag}</td>
<!-- 							<td><button type="button" onclick="스크립트()">수정</button></td> -->
							<td><button type="button" onclick="product_updateForm">수정</button></td>
						</tr>
						</c:forEach>
					</table>
					<div class="detail_btn">
						<a href="product_insertForm">임시버튼</a>
					</div>
				</div>
			</div>
				</div>
			</div>
		</div>
	</section>
	</body>
</html>