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
                	$(".cnum").text(infolist.COUCOUNT)
                	$(".pnum").text(infolist.M_POINT)
                	$(".onum").text(infolist.ORDERCOUNT)
               	 },
                error : function(){
               	 alert("서버통신실패. 관리자에게 문의하세요.");
                }
	   	 	});
			
		});
 
 
 </script>
 
    <div class="myInfo">
        <ul>
            <li class="info"><strong>${ infolist.M_NAME }</strong> 님의 정보를 한눈에 확인하세요.</li>
            <li>보유 쿠폰<br />
            <span class="num cnum">${ infolist.COUCOUNT }</span> <span class="unit">장</span></li>
            <li class="point">내 포인트<br />
            <span class="num pnum">${ infolist.M_POINT }</span> <span class="unit">P</span></li>
            <li class="last">진행중인 주문<br />
            <span class="num onum">${ infolist.ORDERCOUNT }</span> <span class="unit">건</span></li>
        </ul>
    </div>


