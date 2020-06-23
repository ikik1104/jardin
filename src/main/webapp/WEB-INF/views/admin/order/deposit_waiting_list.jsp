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
			rowspan_f();
		}
		$(document).ready(function () {
			  // 체크박스 
	 		$("#checkAll").click(function(){
	 		// 전체 선택 체크박스가 체크된 상태일 경우
				if($('#checkAll').prop('checked')){
					// 해당 화면에 있는 모든 checkbox들 체크
					$('input[name=chk]:checkbox').each(function(){
						$(this).prop('checked', true);
					});
				}else {
					// 해당 화면에 있는 모든 checkbox들 체크 해제
					$('input[name=chk]:checkbox').each(function(){
						$(this).prop('checked', false);
					});
				}
	 		});
	 		
			$(".chk").click(function(){
				var checkboxLength = $('input:checkbox[name="chk"]').length;
				var checkedLength = $('input:checkbox[name="chk"]:checked').length;
				if(checkboxLength == checkedLength){
					$('#checkAll').prop('checked', true);
				}else {
					$('#checkAll').prop('checked', false);
				}
			});
	         
	     });
		
		// rowspan
		function rowspan_f(){
			$(".gr").each(function () {
	              var rows = $(".gr:contains('"+$(this).text()+"')");
	              var chk_row = rows.siblings(".td_chk");
	              var date_row = rows.siblings(".td_date");
	              var id_row = rows.siblings(".td_id");
	              var fs_row = rows.siblings(".td_fs");
	              var pm_row = rows.siblings(".td_pm");
	              var name_row = rows.siblings(".td_name");
	              var account_row = rows.siblings(".td_account");

	              if (rows.length > 1) {
	                  rows.eq(0).attr("rowspan", rows.length);
	                  chk_row.eq(0).attr("rowspan", rows.length);
	                  date_row.eq(0).attr("rowspan", rows.length);
	                  id_row.eq(0).attr("rowspan", rows.length);
	                  fs_row.eq(0).attr("rowspan", rows.length);
	                  pm_row.eq(0).attr("rowspan", rows.length);
	                  name_row.eq(0).attr("rowspan", rows.length);
	                  account_row.eq(0).attr("rowspan", rows.length);

	                  rows.not(":eq(0)").remove(); 
	                  chk_row.not(":eq(0)").remove(); 
	                  date_row.not(":eq(0)").remove(); 
	                  id_row.not(":eq(0)").remove(); 
	                  fs_row.not(":eq(0)").remove(); 
	                  pm_row.not(":eq(0)").remove(); 
	                  name_row.not(":eq(0)").remove(); 
	                  account_row.not(":eq(0)").remove(); 
	              } 
	          });
			}
		
		// 검색 날짜 유효성
		function date_chk2(){
			var start = inputform.e_start_day.value;
			var end = inputform.e_end_day.value;
			
			var date1 = new Date();
			var start_date = new Date(start);
			var end_date = new Date(end);
			
			if(end_date>date1 || start_date>date1){
				alert("시작일과 종료일은 오늘 날짜 이내로 선택해주세요.");
				inputform.e_end_day.value = "";
				inputform.e_start_day.value ="";
				return false;
			}
			if(end_date<start_date){
				alert("시작일 이후의 날짜를 선택해주세요.");
				inputform.e_end_day.value ="";
				return false;
			}
		}
		
		// 검색 & 정렬
		function search() {
			if($("#e_end_day").val()==""){
				alert("종료일을 선택해주세요.");
				return false;
			}
			
			var inputData = {
					keywordOpt : $("#keywordOpt").val(),
					keyword : $("#keyword").val(),
					e_start_day : $("#e_start_day").val(),
					e_end_day : $("#e_end_day").val(),
					option: $("#sort").val()// 페이지로 매개변수 값을 넘겨줄 때 사용
				}
			
			$.ajax({
				type: "POST",       // get/post
				url: "dw_search",     // controller json 데이터 링크주소
				data: JSON.stringify(inputData),
				contentType: "application/json;charset=UTF-8",  // 한글처리
				success: function(data){            // json데이터 return 데이터
					$(".tr_02").html("");
					$(".tr_search").html("");
					var html="";
					var count = 0;
					$.each(data, function(idx, list) {
						html += '<tr class="tr_search">'
						html += '<td class="td_chk"><input type="checkbox" name="chk" class="chk" id="'+list.OL_ORDER_NUM+'"></td>';
						html += '<td class="gr"><a href="order_detail">'+list.OL_ORDER_NUM+'</a></td>'
						html += '<td class="td_search">'+list.ODATE+'</td>';
						html += '<td class="td_id">'+list.OL_ORDERER_ID+'</td>';
						html += '<td>'+list.OL_NUM+'</td>';
						html += '<td class="td_fs">'+list.OC_FINAL_SUM+'</td>';
						html += '<td class="td_pm">'+list.OL_PAYMENT+'</td>';
						html += '<td>입금자명</td>';
						html += '<td>입금계좌</td>';
						html += '</tr>'
						count +=1;
					});	
					if(count==0){
						html += '<tr class="tr_search" style="background-color: white;"><td colspan="9" style="color: gray;">검색 결과가 없습니다.</td></tr>';
					}
					$('#event_list').append(html);
					rowspan_f();
					$("#search_cnt").text(count);
										
				},
				error: function(){
					alert("데이터 가져오기 실패");
				}
				
			});
			
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
		
		// 선택한 주문건 처리상태 변경
		function change_status() {
			var count = $('input:checkbox[name="chk"]:checked').length;
			if(count>0){
				if(confirm("선택하신 주문건의 처리상태를 입금완료로 변경하시겠습니까?")){
					$("input[name=chk]:checked").each(function(){
						var orderNum = $(this).attr('id');
						var statusOpt = $("select[name=statusOpt]").val();
						var arrData = [orderNum, statusOpt]
						$.ajax({
			                url : "change_status",
			                method : "POST",
			                data: arrData,
			                dataType : "json",
			                contentType: "application/json",
			                success : function(val){
			                   if(val == 1){
			                      search();
			                   }
			                },
			                error : function(){
			                   alert("서버통신실패");
			                }
			             });
					});
				}
			}else {
				alert("선택하신 주문건이 없습니다. 처리상태를 변경할 주문건을 먼저 선택해주시기 바랍니다.");
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
			margin-top: 10px;
			padding-top:10px;
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
		<h1>입금대기 리스트</h1>
		<div id="main_list">
			<div id="main_user_list">
				<h2>주문 검색 결과</h2>
				<div class="list_count">
				<fmt:formatNumber var="countAll" value="${count }" type="number"/>
				검색 <span class="top_cnt" id="search_cnt">${countAll }</span>개 / 전체 <span class="top_cnt">${countAll }</span>개 
				</div> 
				<div id="search_form">
					<form class="inputform" id="inputform" name="inputform" onsubmit="return false;">
					<table border="1"  id="search_tb">
						<tr>
							<td>검색어</td>
							<td>
							<select id="keywordOpt" name="keywordOpt">
								<option value="주문번호">주문번호</option>
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
							<td colspan="2"><button  id="searchbtn" onclick="search()">검색</button></td>
						</tr>
					</table>
					</form>
				</div>
				<div id="search2">
					<p></p>
					<select id="sort" name="sort" onchange="search()">
						<option value="ol.ol_order_num asc" selected="selected">주문번호 ↑</option>
						<option value="ol.ol_order_num desc">주문번호 ↓</option>	
						<option value="ol.ol_orderer_id asc">주문자 ↑</option>
						<option value="ol.ol_orderer_id desc">주문자 ↓</option>	
						<option value="ol.ol_date asc">주문일시 ↑</option>
						<option value="ol.ol_date desc">주문일시 ↓</option>
					</select>
				</div>
				<div id="list_div">
					<table border="1" id="event_list">
						<tr>
							<th><input type="checkbox" id="checkAll"></th>
							<th>주문번호</th>
							<th>주문일시</th>
							<th>주문자</th>
							<th>주문고유번호</th>
							<th>총 주문금액</th>
							<th>결제방법</th>
							<th>입금자명</th>
							<th>입금계좌</th>
						</tr>
						<c:forEach var="list" items="${allOrderlist}">
							<tr class="tr_02">
								<td class="td_chk"><input type="checkbox" name="chk" class="chk" id="${list.OL_ORDER_NUM }"></td>
								<td class="gr"><a href="order_detail?ol_order_num=${list.OL_ORDER_NUM }">${list.OL_ORDER_NUM }</a></td>
								<td class="td_date"><fmt:formatDate var="o_date" value="${list.OL_DATE }" pattern="yy-MM-dd"/>${o_date }</td>
								<td class="td_id">${list.OL_ORDERER_ID }</td>
								<td>${list.OL_NUM }</td>
								<td class="td_fs">${list.OC_FINAL_SUM }</td>
								<td class="td_pm">${list.OL_PAYMENT }</td>
								<td class="td_name">입금자명</td>
								<td class="td_account">입금계좌</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="state">
					선택한 주문을
					<select name="statusOpt">
						<option value="입금완료">입금완료</option>
					</select>
					<button type="button" onclick="change_status()">일괄처리</button>
				</div>
			</div>
				</div>
				
	</section>
	</body>
</html>