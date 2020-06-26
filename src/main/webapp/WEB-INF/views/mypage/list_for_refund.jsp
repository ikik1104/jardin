<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title> JARDIN SHOP </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN" />
<meta name="keywords" content="JARDIN" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="user/css/reset.css" />
<link rel="stylesheet" type="text/css" href="user/css/content.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="user/js/jquery.min.js"></script>
<script type="text/javascript" src="user/js/common.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	
	//자식창 닫고 상품상세가기
	$(".gotodetail").click(function(){
    	var p_num = $(this).attr('id');
    	parent.location.href="product_detail?p_num="+p_num;
  		parent.$.fancybox.close();
    });
	
	//반품 수량 최소, 최대값 설정	
	$(".spinner").each(function(){
    	var maxNum = $(this).val();
    	var spinner = $(this).spinner({ min: 1, max: maxNum });
	});
	
	//수량 선택에 따라 가격 변동
	$('.ui-spinner').click(function() {
	    var index = $(this).closest(".parents").attr('id');
	    var total_price = $(".tp"+index).val(); //원래 총 가격
	    var total_amt = $(".amt"+index).val(); //원래 총 수량
	    var one_price = total_price / total_amt;
	    var modi_amt = $(this).children('.spinner').val(); //변경된 수량을 가져옴	    
	    var modi_price = one_price * modi_amt;
	    $("#price"+index).text(modi_price);
	});
	
	// 체크박스 
	$("#checkAll").click(function(){
		// 전체 선택 체크박스가 체크된 상태일 경우
		if($('#checkAll').prop('checked')){
    		var sum = 0;
			// 해당 화면에 있는 모든 checkbox들 체크
			$('input[name=chk]:checkbox').each(function(){
				$(this).prop('checked', true);
			});
			$('input:checkbox[name=chk]:checked').each(function(){
        		var index = $(this).closest(".parents").attr('id');
        		var sub = $("#price"+index).text();
        		sum += Number(sub);
        	});
    		$(".refund_price").text(sum);
		// 전체 선택 체크박스 해제된 경우
		}else{
			// 해당 화면에 있는 모든 checkbox들 체크 해제
			$('input[name=chk]:checkbox').each(function(){
				$(this).prop('checked', false);
			});
			$(".refund_price").text("0");
		}
	});
	
	//체크 하나라도 해제 시 전체선택 체크박스 해제
	$(".chk").click(function(){
		var checkboxLength = $('input:checkbox[name="chk"]').length;
		var checkedLength = $('input:checkbox[name="chk"]:checked').length;
		if(checkboxLength == checkedLength){
			$('#checkAll').prop('checked', true);
		}else {
			$('#checkAll').prop('checked', false);
		}
		
	});
	
	//체크한 가격 합계
	$('input:checkbox[name="chk"]').click(function(){
    	var count = $('input:checkbox[name="chk"]:checked').length;
    	var sum = 0;
    	if(count>0){
        	$('input:checkbox[name=chk]:checked').each(function(){
        		var index = $(this).closest(".parents").attr('id');
        		var sub = $("#price"+index).text();
        		sum += Number(sub);
        	});
    		$(".refund_price").text(sum);
    	} else if(count<=0){
    		$(".refund_price").text("0");
    	}
	});
	
});

function submit(){
	var html ="";
	$('input:checkbox[name=chk]:checked').each(function(){
		var index = $(this).closest(".parents").attr('id');
		html += '<input type="hidden" name="index" value="'+ index +'">'; 
	});
	$(".hidden_array").html(html);
	
	refund_request.submit();
}



</script> 
<style type="text/css">
.ui-corner-all{border-bottom-right-radius:0 !important; border-bottom-left-radius:0 !important; border-top-left-radius:0 !important; border-top-right-radius:0 !important;}
.ui-widget-content{border:0;}
.ui-spinner-input{width:50px; margin:0; border:1px #ddd solid; padding:2px 0 2px 5px; font-family:'Nanum Gothic' !important; font-size:12px !important;}
.btnbtn{width: 130px;}
.bCenter {width: 289px;}
.refundTotal {margin-top: 11px; vertical-align: middle;font-size: 17px;font-weight: bold;background: #cecece;height: 30px;padding-top: 12px;padding-left: 13px;}
.refund_price {float: right; padding-right: 16px;}
</style>
</head>
<body>
<div id="layerWrap">

<div class="inputWrap">
	<form action="refund_request" method="post" name="refund_request">
    	<div class="inputBody">
    		<div class="title">주문 상품 리스트</div>
    		<p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;"><img src="user/images/btn/btn_input_close.gif" alt="닫기" /></a></p>
    
    		<div class="orderDivNm">
    			<table summary="상품 게시판으로 주문하신 상품명, 수량, 판매가, 배송순으로 조회 하시고 쿠폰을 적용하실 수 있습니다." class="orderTable" border="1" cellspacing="0">
    				<caption>상품 게시판</caption>
    				<colgroup>
    				<col width="10%"/>
    				<col width="*" />
    				<col width="8%" class="tw25" />
    				<col width="12%" class="pnone" />
    				</colgroup>
    				<thead>
    					<th scope="col"><input type="checkbox" id="checkAll"/></th>
    					<th scope="col">상품명</th>
    					<th scope="col">수량</th>
    					<th scope="col" class="pnone">가격</th>
    				</thead>
    				<tbody>
                        <c:forEach items="${ list }" var="list" varStatus="status">
    					<tr id="${ status.index }" class="parents">
                            <td><input type="checkbox" class="chk" name="chk" id="chk${ status.index }"></td>
                            <td>
    							<p class="img"><img src="${ list.P_THUMB_IMG1 }" alt="상품" width="66" height="66" /></p>
    
    							<ul class="goods">
    								<li>
    									<a href="#" id="${list.P_NUM }" class="name${ status.index } gotodetail">${ list.P_NAME }</a>
    								</li>
    							</ul>
    						</td>
    						<td>
                                <span class="amt${ status.index }">${ list.OL_AMT }</span>
                                <input type="hidden" name="refundDto[${ status.index }].ol_num" class="num${ status.index }" value="${ list.OL_NUM }"/>
                                <input type="hidden" name="refundDto[${ status.index }].rf_price" class="price${ status.index }" value="${ list.OL_FINAL_PRICE }"/>
                                <input type="hidden" name="refundDto[${ status.index }].p_name" class="name${ status.index }" value="${ list.P_NAME }"/>
                                <input type="hidden" name="refundDto[${ status.index }].ol_order_num" class="name${ status.index }" value="${ list.OL_ORDER_NUM }"/>
                            </td>
    						<td class="pnone" id="price${ status.index }">${ list.OL_FINAL_PRICE }</td>
    					</tr>
                        </c:forEach>
    				</tbody>
    			</table>
    		</div>
            <div class="refundTotal">
                <div>예상 환불 금액 : <span class="refund_price">0</span></div>
            </div>
            
            <span class="hidden_array"></span>
            
            <!-- Btn Area -->
            <div class="btnArea">
                <div class="bCenter">
                    <ul class="ulCenter">                                                                
                        <li><a href="inquiry" class="nbtnbig btnbtn">취소</a></li>
                        <li><a href="#" class="sbtnMini btnbtn" onclick="submit()">선택상품 결제취소</a></li>
                    </ul>
                </div>
            </div>
            <!-- //Btn Area -->
            
    	</div>
    </form>
</div>


</div>
</body>
</html>