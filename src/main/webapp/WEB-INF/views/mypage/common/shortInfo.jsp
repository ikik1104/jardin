 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <script>
 $(document).ready(function() {
			$.ajax({
	       		 type : "POST",
	       		 url : "shortInfo",
	       		 contentType : "application/json",
                dataType : "json",
                success : function(infolist){
                	$(".info strong").text(infolist.M_NAME)
                	$(".cnum").text(commas(infolist.COUCOUNT))
                	$(".pnum").text(commas(infolist.M_POINT))
                	$(".onum").text(commas(infolist.ORDERCOUNT))
               	 },
                error : function(){
               	 alert("서버통신실패. 관리자에게 문의하세요.");
                }
	   	 	});
			
		});
	
 // 천단위마다  콤마(,) 추가
	function commas(x) {
	       return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
 
 </script>
 
    <div class="myInfo">
        <ul>
        	<fmt:formatNumber var="COUCOUNT" value="${infolist.COUCOUNT }" type="number"/>
        	<fmt:formatNumber var="M_POINT" value="${infolist.M_POINT }" type="number"/>
        	<fmt:formatNumber var="ORDERCOUNT" value="${infolist.ORDERCOUNT }" type="number"/>
            <li class="info"><strong>${ infolist.M_NAME }</strong> 님의 정보를 한눈에 확인하세요.</li>
            <li>보유 쿠폰<br />
            <span class="num cnum">${COUCOUNT }</span> <span class="unit">장</span></li>
            <li class="point">내 포인트<br />
            <span class="num pnum">${M_POINT }</span> <span class="unit">P</span></li>
            <li class="last">진행중인 주문<br />
            <span class="num onum">${ORDERCOUNT }</span> <span class="unit">건</span></li>
        </ul>
    </div>


