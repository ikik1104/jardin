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
		<script type="text/javascript" src="admin/js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="admin/js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="admin/js/prefixfree.dynamic-dom.min.js"></script>
		<style type="text/css">
			
			a {text-decoration: none; color:black;}
			a:visited {text-decoration: none;}
			
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
		
		window.onload = function(){
			// 동적 rowspan
			$(".gr").each(function () {
	              var rows = $(".gr:contains('"+$(this).text()+"')");
	              var id_row = rows.siblings(".td_id");
	              var dc_row = rows.siblings(".td_dc");
	              var df_row = rows.siblings(".td_df");
	              var cc_row = rows.siblings(".td_cc");
	              var fs_row = rows.siblings(".td_fs");
	              var pm_row = rows.siblings(".td_pm");
	              var st_row = rows.siblings(".td_st");

	              if (rows.length > 1) {
	                  rows.eq(0).attr("rowspan", rows.length);
	                  id_row.eq(0).attr("rowspan", rows.length);
	                  df_row.eq(0).attr("rowspan", rows.length);
	                  dc_row.eq(0).attr("rowspan", rows.length);
	                  cc_row.eq(0).attr("rowspan", rows.length);
	                  fs_row.eq(0).attr("rowspan", rows.length);
	                  pm_row.eq(0).attr("rowspan", rows.length);
	                  st_row.eq(0).attr("rowspan", rows.length);
	                  
	                  rows.not(":eq(0)").remove(); 
	                  id_row.not(":eq(0)").remove(); 
	                  df_row.not(":eq(0)").remove(); 
	                  dc_row.not(":eq(0)").remove(); 
	                  cc_row.not(":eq(0)").remove(); 
	                  fs_row.not(":eq(0)").remove(); 
	                  pm_row.not(":eq(0)").remove(); 
	                  st_row.not(":eq(0)").remove(); 
	              } 
	          });
			
			
			var selectedOpt = "${selectedOpt}";
			var option = $('select[name=sort]').val();
			if(selectedOpt!=""){
				$('#sort').val(selectedOpt).prop("selected", true);
			}else{
				$('#sort').val(option).prop("selected", true);
			}
			
			var keywordOpt = "${keywordOpt}";
			var keyword = "${keyword}";
			var e_start_day = "${e_start_day}";
			var e_end_day = "${e_end_day}";
			var status = "${status}";
			if(keyword!=""){
				$('#keywordOpt').val(keywordOpt).prop("selected", true);
				$('#keyword').val(keyword);
			}
			if(e_start_day!=""){
				$('#e_start_day').val(e_start_day);
				$('#e_end_day').val(e_end_day);
			}
			if(status!=""){
				$('#status').val(status).prop("selected", true);
			}
		}

		
		function date_chk2(){
			var start = inputform.e_start_day.value;
			var end = inputform.e_end_day.value;
			
			var date1 = new Date();
			var start_date = new Date(start);
			var end_date = new Date(end);
			if(end_date.getDate()>date1.getDate() || start_date.getDate()>date1.getDate()){
				alert("시작일과 종료일은 오늘 날짜 이내로 선택해주세요.");
				inputform.e_end_day.value = "";
				inputform.e_start_day.value ="";
				return false;
			}
			if(end_date.getDate()<start_date.getDate()){
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
		
		// 정렬
		function sortList(){
			var option = $('select[name=sort]').val();
			var opt_text =$("#sort option:selected").text();
			
			var keywordOpt = $('select[name=keywordOpt]').val();
			var keyword = "${keyword}";
			var e_start_day = "${e_start_day}";
			var e_end_day = "${e_end_day}";
			var status = "${status}";
			
			if(keyword=="" && (e_start_day=="" || e_end_day=="") && status==""){
				location.href="order_list?option="+option+"&&opt_text="+opt_text;
			}else if(keyword!="" || (e_start_day !="" && e_end_day!="") || status!="") {
				location.href="getSearchOrder?option="+option+"&&opt_text="+opt_text
							+"&&keywordOpt="+keywordOpt+"&&keyword="+keyword+"&&e_start_day="+e_start_day
							+"&&e_end_day="+e_end_day+"&&status="+status;
			}

		}
		
</script>
	<style type="text/css">
		.step2{
 				display : none;
			}
		#list_div{
			height: 500px;
			margin-top: 15px;
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
		#state{
			margin: 10px;
			border-top: 1px solid black;
		}
		
		#search_tb td {padding-left: 10px; background-color: white;}
		
		#searchbtn {width: 50px; height: 25px;}
		
		select {height: 20px;}
		
	</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/order_nav.jsp"/>
	<section>
		<h1>주문통합리스트</h1>
		<div id="main_list">
			<div id="main_user_list">
				<h2>주문 검색 결과</h2>
				<div class="list_count">
				<c:if test="${countSearch eq null || countOrder == countSearch}">
					검색 <span class="top_cnt">${countOrder}</span>개 / 전체 <span class="top_cnt">${countOrder}</span>개 
				</c:if>
				<c:if test="${countSearch ne null && countOrder != countSearch }">
					검색 <span class="top_cnt">${countSearch}</span>개 / 전체 <span class="top_cnt">${countOrder}</span>개 
				</c:if>
				</div>
				<div id="search_form">
					<form name="inputform" method="post" action="getSearchOrder">
					<table border="1"  id="search_tb">
						<tr>
							<td>검색어</td>
							<td>
							<select id="keywordOpt" name="keywordOpt">
								<option value="주문번호">주문번호</option>
								<option value="상품코드">상품코드</option>
								<option value="상품명">상품명</option>
								<option value="주문자">주문자</option>
							</select>
							<input type="text" name="keyword" id="keyword"> 
							</td>
						</tr>
						<tr id="search_date">
							<td>기간검색</td>
							<td>
							<fmt:formatDate var="sys" value="${sysdate}" pattern="yyyy-MM-dd"/>
							<select name="dateType" >
								<option>주문일</option>
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
							<td>처리상태</td>
							<td><select id="status" name="status">
								<option value="전체">전체</option>		
								<option value="입금대기">입금대기</option>
								<option value="입금완료">입금완료</option>
								<option value="배송준비중">배송준비중</option>
								<option value="배송중">배송중</option>
								<option value="배송완료">배송완료</option>
								<option value="구매확정">구매확정</option>
							</select>
							</td>
						</tr>
						<tr>
							<td colspan="2"><button  id="searchbtn" onclick="search()">검색</button></td>
						</tr>
					</table>
					</form>
				</div>
				<div id="search2">
					<p></p>
					<select id="sort" name="sort" onchange="sortList()">
						<option value="ol.ol_order_num asc" selected="selected">주문번호 ↑</option>
						<option value="ol.ol_order_num desc">주문번호 ↓</option>	
						<option value="ol.ol_orderer_id asc">주문자 ↑</option>
						<option value="ol.ol_orderer_id desc">주문자 ↓</option>	
						<option value="ol.ol_status asc">주문상태 ↑</option>
						<option value="ol.ol_status desc">주문상태 ↓</option>	
					</select>
				</div>

				<div id="list_div">
					<table border="1" id="event_list">
						<tr>
							<th>주문번호</th>
							<th>주문일시</th>
							<th>주문자</th>
							<th>주문고유번호</th>
							<th>상품코드</th>
							<th>주문상품</th>
							<th>수량</th>
							<th>상품금액</th>
							<th>상품쿠폰</th>
							<th>총 상품금액</th>
							<th>배송비</th>
							<th>배송비 쿠폰</th>
							<th>장바구니 쿠폰</th>
							<th>총주문금액</th>
							<th>결제방법</th>
							<th>처리상태</th>
						</tr>
						<c:forEach var="list" items="${allOrderlist}">
							<tr>
								<td class="gr"><a href="order_detail?ol_order_num=${list.OL_ORDER_NUM }">${list.OL_ORDER_NUM }</a></td>
								<td><fmt:formatDate var="o_date" value="${list.OL_DATE }" pattern="yy-MM-dd"/>${o_date }</td>
								<td class="td_id">${list.OL_ORDERER_ID }</td>
								<td>${list.OL_NUM }</td>
								<td>${list.P_NUM }</td>
								<td>${list.P_NAME }</td>
								<td>${list.OL_AMT }</td>
								<fmt:formatNumber var="p_price" value="${list.P_PRICE }" type="number"/>
								<td>${p_price }</td>
								<fmt:formatNumber var="prod_disc" value="${list.PROD_DISC }" type="number"/>
								<td>${prod_disc }</td>
								<fmt:formatNumber var="final_price" value="${list.OL_FINAL_PRICE }" type="number"/>
								<td>${final_price }</td>
								<fmt:formatNumber var="deliv_fee" value="${list.OC_DELIV_FEE }" type="number"/>
								<td class="td_df">${deliv_fee }</td>
								<fmt:formatNumber var="deliv_disc" value="${list.DELIV_DISC }" type="number"/>
								<td class="td_dc">${list.DELIV_DISC }</td>
								<fmt:formatNumber var="cart_disc" value="${list.CART_DISC }" type="number"/>
								<td class="td_cc">${cart_disc }</td>
								<fmt:formatNumber var="final_sum" value="${list.OC_FINAL_SUM }" type="number"/>
								<td class="td_fs">${final_sum }</td>
								<td class="td_pm">${list.OL_PAYMENT }</td>
								<td class="td_st">${list.OL_STATUS }</td>
							</tr>
						
						</c:forEach>
					</table>
<!-- 				<div class="detail_btn">
						<a href="#">임시버튼</a>
					</div>
 -->					
				</div>
			</div>
				</div>
			</div>
		</div>
	</section>
	</body>
</html>