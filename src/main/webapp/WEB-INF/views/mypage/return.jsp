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
	
	$(".spinner").each(function(){
    	var maxNum = $(this).val();
    	var spinner = $(this).spinner({ min: 1, max: maxNum });
	});
	
	
});

function return_req(ol_num, index){
	var ol_amt = $("#spin"+index).val();
	location.href = 'takeback_reason?ol_num='+ol_num+'&ol_amt='+ol_amt;
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
					<tr>
						<td class="left">
							<p class="img"><img src="user/images/img/sample_product.jpg" alt="상품" width="66" height="66" /></p>

							<ul class="goods">
								<li>
									<a href="#">${ list.P_NAME }</a>
								</li>
							</ul>
						</td>
						<td><input class="spinner" value="${ list.OL_AMT }" id="spin${ status.index }"/></td>
						<td class="pnone">${ list.OL_FINAL_PRICE } 원</td>
						<td class="pnone"><a href="#" id="${ status.index }" onclick="return_req(${ list.OL_NUM }, ${ status.index })">신청하기</a></td>
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