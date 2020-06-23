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

		$(function(){
			
			$(".gr").each(function () {
	              var rows = $(".gr:contains('"+$(this).text()+"')");
	              var ck_row = rows.siblings(".td_ck"); //주문번호
	              var on_row = rows.siblings(".td_on"); //주문번호
	              var rd_row = rows.siblings(".td_rd"); //접수일
	              var ed_row = rows.siblings(".td_ed"); //처리일
	              var nm_row = rows.siblings(".td_nm");	//사용자id
	              var mt_row = rows.siblings(".td_mt"); //결제방법
	              var st_row = rows.siblings(".td_st"); //상태
	              var rf_row = rows.siblings(".td_rf"); //임시값 - 합계
	              var bt_row = rows.siblings(".td_bt"); //버튼
	              var each_price = rows.siblings(".each_price"); //각각 가격

	              if (rows.length > 1) {
	                  rows.eq(0).attr("rowspan", rows.length);
	                  ck_row.eq(0).attr("rowspan", rows.length);
	                  on_row.eq(0).attr("rowspan", rows.length);
	                  rd_row.eq(0).attr("rowspan", rows.length);
	                  ed_row.eq(0).attr("rowspan", rows.length);
	                  nm_row.eq(0).attr("rowspan", rows.length);
	                  mt_row.eq(0).attr("rowspan", rows.length);
	                  st_row.eq(0).attr("rowspan", rows.length);
	                  rf_row.eq(0).attr("rowspan", rows.length);
	                  bt_row.eq(0).attr("rowspan", rows.length);
	                  
	                  rows.not(":eq(0)").remove(); 
	                  ck_row.not(":eq(0)").remove(); 
	                  on_row.not(":eq(0)").remove(); 
	                  rd_row.not(":eq(0)").remove(); 
	                  ed_row.not(":eq(0)").remove(); 
	                  nm_row.not(":eq(0)").remove(); 
	                  mt_row.not(":eq(0)").remove(); 
	                  st_row.not(":eq(0)").remove(); 
	                  rf_row.not(":eq(0)").remove(); 
	                  bt_row.not(":eq(0)").remove(); 
	                  
	                  //환불금액 합계
                      var sum = 0;
                      for(i=0; i<rows.length; i++){
                    	  sum += Number(each_price.eq(i).text());
                      }
                      rf_row.text(sum);
					  
                      //환불처리
                      var innerhtml = "";
                      if(st_row.eq(0).text() == "환불접수"){
                          if(mt_row.eq(0).text() == "신용카드 결제"){
                        	  innerhtml = '<a href="#" class="refund_btn">PG취소</a>';
                          } else {
                        	  innerhtml = '<a href="#" class="refund_btn">환불처리</a>';
                          } 
                      } else {
					  	  innerhtml = '-';	                    	  
                      }
                	  bt_row.html(innerhtml);
	              } 
	          });
			
    		$(".refund_btn").click(function(){
    			var refund_num = $(this).parent().siblings(".gr").text();
    			var refund_price = $(this).siblings(".td_rf").text();
    			if($(this).text() == "PG취소"){
        			if(confirm("PG 취소를 접수하시겠습니까?")){
        			   	 $.ajax({
        			   		 type : "POST",
        			   		 url : "refund_process",
        			   		 data : JSON.stringify({ 
        			   			 rf_receipt_num : refund_num,
        			   		 }),
        			   		 contentType : "application/json",
    			             dataType : "json",
    			             success : function(val){
        			           	 if(val != 0){
        			           		 alert("PG결제 취소를 요청했습니다.");
        			           		 location.reload();
        			           	 } else{
        			           		 alert("취소할 수 없습니다.");
        			           	 }
    			             },
    			             error : function(){
    			           	 	alert("서버통신실패. 관리자에게 문의하세요.");
    			             }
        			   	 });
        			 } else {
        				 return;
        			 };//if confirm
    				
    			} else {
    				if(confirm("환불완료 처리하시겠습니까? 무통장입금, 계좌이체의 경우 환불을 완료했는지 다시 확인하고 신중하게 처리하세요!")){
       			   	 $.ajax({
       			   		 type : "POST",
       			   		 url : "refund_process",
       			   		 data : JSON.stringify({ 
       			   			 rf_receipt_num : refund_num,
       			   		 }),
       			   		 contentType : "application/json",
   			             dataType : "json",
   			             success : function(val){
       			           	 if(val != 0){
       			           		 alert("환불 완료");
       			           		 location.reload();
       			           	 } else{
       			           		 alert("완료할 수 없습니다.");
       			           	 }
   			             },
   			             error : function(){
   			           	 	alert("서버통신실패. 관리자에게 문의하세요.");
   			             }
       			   	 });
       			 	} else {
       				 return;
       			 	};//if confirm
    			}
    		});
		});

		//검색 날짜 유효성
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
		
		//검색 & 정렬
		function search() {
			//종료일 유효성
			if($("#e_end_day").val()==""){
				alert("종료일을 선택해주세요.");
				return false;
			}
			
			
			
			
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
	</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>환불 리스트</h1>
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
								<option>주문번호</option>
								<option>상품코드</option>
								<option>상품명</option>
								<option>주문자</option>
								<option>처리상태</option>
							</select>
							<input type="text" name="검색키워드">
							</td>
						</tr>
						<tr id="search_date">
							<td>기간검색</td>
							<td>
							<fmt:formatDate var="sys" value="${sysdate}" pattern="yyyy-MM-dd"/>
							<select name="****미정****" >
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
							<td colspan="2"><button onclick="search()">검색</button></td>
							<td></td>
						</tr>
					</table>
					</form>
				</div>
				<div id="search2">
					<select name="sort" onchange="에이작스스크립트()">
						<option value="" selected="selected">주문번호 ↑</option>
						<option value="">주문번호 ↓</option>	
						<option value="">주문자 ↑</option>
						<option value="">주문자 ↓</option>	
						<option value="">주문상태 ↑</option>
						<option value="">주문상태 ↓</option>	
					</select>
				</div>
				<div id="list_div">
					<table border="1" id="event_list">
						<tr>
<!-- 							<th><input type="checkbox" name="chk"></th> -->
							<th>환불번호</th>
							<th>주문번호</th>
<!-- 							<th>주문일시</th> -->
							<th>환불신청일</th>
							<th>환불완료일시</th>
							<th>주문자</th>
<!-- 							<th>주문고유번호</th> -->
							<th>주문상품</th>
<!-- 							<th>수량</th> -->
							<th>총 상품금액</th>
                            <th>최종 환불금액</th>
<!-- 							<th>총 배송비</th> -->
							<th>결제방법</th>
							<th>처리상태</th>
							<th>환불처리</th>
<!-- 							<th>사유</th> -->
						</tr>
                        <c:forEach var="list" items="${ refundlist }">
						<tr>
<!-- 							<td class="td_ck"><input type="checkbox" name="chk" value=""></td> -->
							<td class="gr">${list.rf_receipt_num }</td>
							<td class="td_on"><a href="order_detail?ol_order_num=${list.ol_order_num }">${list.ol_order_num }</a></td>
<!-- 							<td>주문일시</td> -->
                            <td class="td_rd">${ list.rf_receipt_date }</td>
                            <td class="td_ed">${ list.rf_end_date }</td>
                            <td class="td_nm">${ list.m_id }</td>
<!--                             <td>주문고유번호</td> -->
                            <td>${ list.p_name }</td>
                            <td class="each_price">${ list.rf_price }</td>
                            <td class="td_rf">임시값</td>
                            <td class="td_mt">${ list.rf_method }</td>
                            <td class="td_st">${ list.rf_status }</td>
                            <td class="td_bt"></td>
<!-- 							<td>환불완료일시</td> -->
<!-- 							<td>주문자</td> -->
<!-- 							<td>주문고유번호</td> -->
<!-- 							<td>주문상품</td> -->
<!-- 							<td>수량</td> -->
<!-- 							<td>총 상품금액</td> -->
<!-- 							<td>총 배송비</td> -->
<!-- 							<td>결제방법</td> -->
<!-- 							<td>처리상태</td> -->
<!-- 							<td>사유</td> -->
						</tr>
                        </c:forEach>
					</table>
					<div class="detail_btn">
						<a href="#">임시버튼</a><!-- 필요없음 div통째로 지우세욤 -->
					</div>
				</div>
			</div>
				</div>
	</section>
	</body>
</html>