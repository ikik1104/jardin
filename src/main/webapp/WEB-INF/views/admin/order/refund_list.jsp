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
            
            rowspan_f();
            
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

        
        function rowspan_f(){
            $(".gr").each(function () {
                  var rows = $(".gr:contains('"+$(this).text()+"')");
                  var ck_row = rows.siblings(".td_ck"); //주문번호
                  var on_row = rows.siblings(".td_on"); //주문번호
                  var rd_row = rows.siblings(".td_rd"); //접수일
                  var ed_row = rows.siblings(".td_ed"); //처리일
                  var nm_row = rows.siblings(".td_nm"); //사용자id
                  var mt_row = rows.siblings(".td_mt"); //결제방법
                  var st_row = rows.siblings(".td_st"); //상태
                  var rf_row = rows.siblings(".td_rf"); //임시값 - 합계
                  var bt_row = rows.siblings(".td_bt"); //버튼
                  var each_price = rows.siblings(".each_price"); //각각 가격
					
                  var sum = 0; //환불금액 합계
                  if(rows.length > 1) {
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
                    
                      //최종환불금액 계산
                      for(i=0; i<rows.length; i++){
                    	  var ch_num = Number(each_price.eq(i).text().replace(/,/g, ''));
                    	  sum += ch_num;
                      }
                  } else {
                	  sum = each_price.eq(0).text();
                  } 
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
                  rf_row.text(commas(sum));
              });
        }
        
        
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
            var inputData = {
                keywordOpt : $("#keywordOpt").val(),
                keyword : $("#keyword").val(),
                e_start_day : $("#e_start_day").val(),
                e_end_day : $("#e_end_day").val(),
                arr: $("#sort").val()// 페이지로 매개변수 값을 넘겨줄 때 사용
            }
            
            $.ajax({
                type: "POST",       // get/post
                url: "refund_s_a",     // controller json 데이터 링크주소
                data: JSON.stringify(inputData),
                contentType: "application/json;charset=UTF-8",  // 한글처리
                success: function(data){            // json데이터 return 데이터
                    $(".tr_02").html("");
                    $(".tr_search").html("");
                    var html="";
                    var count = 0;
                    for(var i=0; i<data.length; i++){
                        var timestamp1 = data[i].rf_receipt_date;
                        var timestamp2 = data[i].rf_end_date;
                        var date1 = new Date(timestamp1).format('yyyy-MM-dd HH:mm:ss');
                        var date2 = new Date(timestamp2).format('yyyy-MM-dd HH:mm:ss');
                        html += '<tr class="tr_search">'
                        html += '<td class="gr">'+data[i].rf_receipt_num+'</td>';
                        html += '<td class="td_on"><a href="order_detail?ol_order_num=${data[i].ol_order_num }">'+data[i].ol_order_num+'</a></td>'
                        html += '<td class="td_rd">'+date1+'</td>';
                        html += '<td class="td_ed">'+date2+'</td>';
                        html += '<td class="td_nm">'+data[i].m_id+'</td>';
                        html += '<td>'+data[i].p_name+'</td>';
                        html += '<td class="each_price">'+commas(data[i].rf_price)+'</td>';
                        html += '<td class="td_rf">임시값</td>';
                        html += '<td class="td_mt">'+data[i].rf_method+'</td>';
                        html += '<td class="td_st">'+data[i].rf_status+'</td>';
                        html += '<td class="td_bt"></td>'
                        html += '</tr>'
                        count +=1;
                    }
//                  $.each(data, function(idx, list) {
//                      console.log(typeof list.rf_receipt_date);
//                      var date1 = new Date(list.rf_receipt_date*1000);
//                  }); //each를 썼던 이유는 for문을 돌리면 원래 맵에 담아왔을 때 각각의 값을 못가져왔었기 때문.. 
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
        
        
        //통화표시 정규식
        function commas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

        
        //날짜포맷 지정 때문에 삽입한 함수...
        Date.prototype.format = function (f) {
            if (!this.valueOf()) return " ";
            var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
            var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
            var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
            var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
            var d = this;
            return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
                switch ($1) {
                    case "yyyy": return d.getFullYear(); // 년 (4자리)
                    case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
                    case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
                    case "dd": return d.getDate().zf(2); // 일 (2자리)
                    case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
                    case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
                    case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
                    case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
                    case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
                    case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
                    case "mm": return d.getMinutes().zf(2); // 분 (2자리)
                    case "ss": return d.getSeconds().zf(2); // 초 (2자리)
                    case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
                    default: return $1;
                }
            });
        };
        String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
        String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
        Number.prototype.zf = function (len) { return this.toString().zf(len); };
        //날짜함수때문에 삽입한...어쩌구 끝
        
        
        
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
    <jsp:include page="../nav/order_nav.jsp"/>
    <section>
        <h1>환불 리스트</h1>
        <div id="main_list">
            <div id="main_user_list">
                <h2>임시로 놔두기</h2>
                <div class="list_count">임시로 놔두기(총 게시물 수 등등 표시?)</div>
                <div id="search_form">
                    <form name="inputform" id="inputform" name="inputform"  method="get" onsubmit="return false;">
                    <table border="1">
                        <tr>
                            <td>검색어</td>
                            <td>
                            <select id="keywordOpt" name="keywordOpt">
                                <option value="주문번호">주문번호</option>
                                <option value="주문자">주문자</option>
                                <option value="상태">처리상태</option>
                            </select>
                            <input type="text" name="keyword" id="keyword">
                            </td>
                        </tr>
                        <tr id="search_date">
                            <td>기간검색</td>
                            <td>
                            <fmt:formatDate var="sys" value="${sysdate}" pattern="yyyy-MM-dd"/>
                            <select name="****미정****" >
                                <option>환불신청일</option>
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
                    <select name="sort" id="sort" onchange="search()">
                        <option value="rf_receipt_num asc" selected="selected">주문번호 ↑</option>
                        <option value="rf_receipt_num desc">주문번호 ↓</option> 
                        <option value="m_id asc">주문자 ↑</option>
                        <option value="m_id desc">주문자 ↓</option>    
                        <option value="rf_status asc">주문상태 ↑</option>
                        <option value="rf_status desc">주문상태 ↓</option>  
                    </select>
                </div>
                <div id="list_div">
                    <table border="1" id="event_list">
                        <tr>
<!--                            <th><input type="checkbox" name="chk"></th> -->
                            <th>환불번호</th>
                            <th>주문번호</th>
<!--                            <th>주문일시</th> -->
                            <th>환불신청일</th>
                            <th>환불완료일시</th>
                            <th>주문자</th>
<!--                            <th>주문고유번호</th> -->
                            <th>주문상품</th>
<!--                            <th>수량</th> -->
                            <th>총 상품금액</th>
                            <th>최종 환불금액</th>
<!--                            <th>총 배송비</th> -->
                            <th>결제방법</th>
                            <th>처리상태</th>
                            <th>환불처리</th>
<!--                            <th>사유</th> -->
                        </tr>
                        <c:forEach var="list" items="${ refundlist }">
                        <tr class="tr_02">
<!--                            <td class="td_ck"><input type="checkbox" name="chk" value=""></td> -->
                            <td class="gr">${list.rf_receipt_num }</td>
                            <td class="td_on"><a href="order_detail?ol_order_num=${list.ol_order_num }">${list.ol_order_num }</a></td>
<!--                            <td>주문일시</td> -->
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
<!--                            <td>환불완료일시</td> -->
<!--                            <td>주문자</td> -->
<!--                            <td>주문고유번호</td> -->
<!--                            <td>주문상품</td> -->
<!--                            <td>수량</td> -->
<!--                            <td>총 상품금액</td> -->
<!--                            <td>총 배송비</td> -->
<!--                            <td>결제방법</td> -->
<!--                            <td>처리상태</td> -->
<!--                            <td>사유</td> -->
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