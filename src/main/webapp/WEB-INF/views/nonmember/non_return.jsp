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
	
	//반품 수량 최소, 최대값 설정	
	$(".spinner").each(function(){
    	var maxNum = $(this).val();
    	var spinner = $(this).spinner({ min: 0, max: maxNum });
	    var index = $(this).closest(".parents").attr('id');
    	if(maxNum == 0){
    		$("#price"+index).text(0);
    		$("#btn"+index).text('신청완료');
    	}
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
	
});

		
//개별 반품
function return_req(ol_num, index){
	var ol_amt = $("#spin"+index).val();
	var origin_amt = $(".amt"+index).val();
	var ol_price = $("#price"+index).text();
	var origin_price = $(".tp"+index).val();
	var p_name = $(".name"+index).text();
	var orderer = '${orderer}';
	console.log('orderer : '+orderer)
	var ol_order_num = $(".onum"+index).val();
	var array = [ol_num, ol_amt, origin_amt, ol_price, p_name, origin_price, ol_order_num, orderer];
	location.href = 'non_takeback_reason?array='+array;
}

</script> 
<style type="text/css">
.ui-corner-all{border-bottom-right-radius:0 !important; border-bottom-left-radius:0 !important; border-top-left-radius:0 !important; border-top-right-radius:0 !important;}
.ui-widget-content{border:0;}
.ui-spinner-input{width:50px; margin:0; border:1px #ddd solid; padding:2px 0 2px 5px; font-family:'Nanum Gothic' !important; font-size:12px !important;}
</style>
</head>
<body>
<div id="layerWrap">

<div class="inputWrap">
		
	<div class="inputBody">
		<div class="title">반품/교환 상품정보</div>
		<p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;"><img src="user/images/btn/btn_input_close.gif" alt="닫기" /></a></p>

		<div class="orderDivNm">
			<table summary="상품 게시판으로 주문하신 상품명, 수량, 판매가, 배송순으로 조회 하시고 쿠폰을 적용하실 수 있습니다." class="orderTable" border="1" cellspacing="0">
				<caption>상품 게시판</caption>
				<colgroup>
				<col width="*" />
				<col width="8%" class="tw25" />
				<col width="12%" class="pnone" />
				<col width="13%" class="pnone" />
				</colgroup>
				<thead>
					<th scope="col">상품명</th>
					<th scope="col">수량</th>
					<th scope="col" class="pnone">가격</th>
					<th scope="col" class="pnone">반품신청</th>
				</thead>
				<tbody>
                    <c:forEach items="${ list }" var="list" varStatus="status">
					<tr id="${ status.index }" class="parents">
                        <td>
							<p class="img"><img src="user/images/img/sample_product.jpg" alt="상품" width="66" height="66" /></p>

							<ul class="goods">
								<li>
									<a href="#" class="name${ status.index }">${ list.P_NAME }</a>
								</li>
							</ul>
						</td>
						<td>
                            <input class="spinner" value="${ list.OL_AMT }" id="spin${ status.index }"/>
                            <input type="hidden" class="amt${ status.index }" value="${ list.OL_AMT }"/>
                            <input type="hidden" class="tp${ status.index }" value="${ list.OL_FINAL_PRICE }"/>
                            <input type="hidden" class="num${ status.index }" value="${ list.OL_NUM }"/>
                            <input type="hidden" class="onum${ status.index }" value="${ list.OL_ORDER_NUM }"/>
                        </td>
						<td class="pnone" id="price${ status.index }">${ list.OL_FINAL_PRICE }</td>
						<td class="pnone"><a href="#" id="btn${ status.index }" onclick="return_req(${ list.OL_NUM }, ${ status.index })">신청하기</a></td>
					</tr>
                    </c:forEach>
				</tbody>
			</table>
		</div>
        
	</div>

</div>


</div>
</body>
</html>