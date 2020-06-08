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
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
		function delProduct(num){
			
			if(confirm("해당 상품을 삭제처리 하시겠습니까? (해당 데이터는 삭제제품에서 확인/변경 가능합니다.)")){
				$.ajax({
				      url : "product_delete",
				      method : "POST",
				      data: JSON.stringify(num),
				      dataType : "json",
				      contentType: "application/json",
				      success : function(val){
				    	  if(val == 1){ //리턴값이 1이면 (=성공)
					         alert("삭제처리 완료되었습니다.");
// 							location.href="product_list";
					         location.reload(); //페이지 새로고침
				    	  }else{ // 0이면 실패
				    		  alert("삭제처리 실패.");
				    	  }
				      },
				      error : function(){
				         alert("서버통신실패");
				      }
				   });
			}
			 
		}
		
		function date_chk2(){
			var start = inputform.e_start_day.value;
			var end = inputform.e_end_day.value;
			
			var start_date = new Date(start);
			var end_date = new Date(end);

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
		
		//step1선택에 따른 step2띄워주기
		function aa(val) {
			var step2= document.getElementsByClassName("step2");
			var option = document.getElementById(val);
			
			$(".step2").css("display", "none");
			$(".step2").removeAttr("name");
			
			$(option).css("display", "inline-block");
			$(option).attr("name", "p_step2")
		}
		
		//페이지 로딩시
		$(document).ready(function(){
			var id;
			if(${not empty map}){
				//step2
				$(".step2 option").each(function(){
				    if($(this).val()=="${map.p_step2}"){
				      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
				      id = $(this).attr("id");
				      $("#step1 option").each(function(){
				    	  if($(this).val() == id){
				    		  $(this).attr("selected","selected");
				    		  }
				    	});
				    }
				});
				      
				$("#p_name").attr("value", "${map.p_name}");      
				$("#e_start_day").attr("value", "${map.e_start_day}"); 
				$("#e_end_day").attr("value", "${map.e_end_day}"); 
			}//if
		});
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
	<jsp:include page="../nav/product_nav.jsp"/>
	<section>
		<h1>제품 리스트</h1>
		<div id="main_list">
			<div id="main_user_list">
				<h2>임시로 놔두기</h2>
				<div class="list_count">임시로 놔두기(총 게시물 수 등등 표시?)</div>
				<div id="search_form">
					<form action="product_searchList" name="inputform" method="post" >
					<table border="1">
						<tr>
							<td>상품명</td>
							<td>
							<input type="text" id="p_name"  name="p_name">
							</td>
						</tr>
						<tr id="search_date">
							<td>기간검색</td>
							<td>
							<fmt:formatDate var="sys" value="${sysdate}" pattern="yyyy-MM-dd"/>
							<select name="dateType" >
								<option value="p_sysdate">등록일</option>
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
							<select name="step1" id="step1" onchange="aa(this.value)">
								<option value="원두">원두</option>
								<option value="원두커피백">원두커피백</option>
								<option value="인스턴트">인스턴트</option>
								<option value="커피용품">커피용품</option>
								<option value="선물세트">선물세트</option>
								<option value="대량구매">대량구매</option>
							</select>
							
							<select  id="원두" name="p_step2" class="step2" style="display: inline;">
								<option value="클래스">클래스</option>
								<option value="로스터리샵">로스터리샵</option>	
								<option value="커피휘엘">커피휘엘</option>	
								<option value="산지별">산지별 생두</option>	
							</select>
							<select  id="원두커피백" class="step2">
								<option value="드립커피">드립커피 로스트</option>
								<option value="오리지널">오리지널 커피백</option>	
								<option value="마일드">마일드 커피백</option>	
							</select>
							<select  id="인스턴트" class="step2">
								<option value="카페모리">카페모리</option>
								<option value="홈스타일카페모리">홈스타일카페모리</option>	
								<option value="포타제">포타제</option>	
							</select>
							<select  id="음료" class="step2">
								<option value="카페리얼">카페리얼</option>
								<option value="워터커피">워터커피</option>	
								<option value="모히또">모히또</option>	
							</select>
							<select  id="커피용품" class="step2">
								<option value="종이컵">카페리얼</option>
								<option value="커피 필터 등">워터커피</option>	
								<option value="기타">모히또</option>	
							</select>
							<select  id="선물세트" class="step2">
								<option value="선물세트">"선물세트"</option>
							</select>
							<select  id="대량구매" class="step2">
								<option value="대량구매">대량구매</option>
							</select>
							</td>
						</tr>
						<tr>
							<td colspan="2"><button type="submit">검색</button></td>
							<td></td>
						</tr>
					</table>
					<input type="hidden" name="p_delflag" value="N">
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
							<th>수정/삭제</th>
						</tr>
						<c:forEach items="${list}" var="pro" varStatus="status">
						<tr>
							<td><input type="checkbox"></td>
							<td>${status.count}</td>
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
							<td>
							<button type="button" onclick="location.href='product_updateForm?p_num=${pro.p_num}'">수정</button>
							<button type="button" onclick="delProduct(${pro.p_num})">삭제</button>
							</td>
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