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
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="user/css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="user/css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="user/css/content.css?v=Y" />
<script type="text/javascript" src="user/js/jquery.min.js"></script>
<script type="text/javascript" src="user/js/top_navi.js"></script>
<script type="text/javascript" src="user/js/left_navi.js"></script>
<script type="text/javascript" src="user/js/main.js"></script>
<script type="text/javascript" src="user/js/common.js"></script>
<script type="text/javascript" src="user/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="user/js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="user/js/jquery.anchor.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="user/js/html5.js"></script>
<script type="text/javascript" src="user/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">




$(document).ready(function() {
   	//반품버튼 클릭
	$("#return_submit").click(function(){
		var rt_reason = '[' + $("#rt_reason1 option:selected").val() + ']' + $("#rt_reason2").val();
		var ol_num = '${ ol_num }';
		var rt_amt = '${ rt_amt }';
		var origin_amt = '${ origin_amt }';
		var ol_price = '${ ol_price }'; //반품할 수량만큼의 가격
		var origin_price = '${ origin_price }';
		var ol_order_num = '${ ol_order_num }';
		var p_name = '${ p_name }';
		var arrData = [ol_num, rt_amt, rt_reason, origin_amt, ol_price, origin_price, ol_order_num, p_name];
		
		$.ajax({
       		 type : "POST",
       		 url : "return_request",
       		 data : JSON.stringify(arrData),
       		 contentType : "application/json",
                dataType : "json",
                success : function(val){
               	 if(val == 1){
               		 alert("반품접수가 완료되었습니다.");
               		 parent.location.href="ordercheck";
               		 parent.$.fancybox.close();
               	 } else{
               		 alert("반품 접수가 완료되지 않았습니다. 관리자에게 문의하세요.");
               	 }
                },
                error : function(){
               	 alert("서버통신실패. 관리자에게 문의하세요.");
                }
   	 	});
		
	});
});
</script>
<style type="text/css">
body{
background : white;
}
</style>
</head>
<body>



<div id="layerWrap">

<div class="inputWrap">
        
    <div class="inputBody">
        <div class="title">반품/교환 사유</div>
        <p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;"><img src="user/images/btn/btn_input_close.gif" alt="닫기" /></a></p>

        <!-- 반품할 상품 정보 -->
        <div class="orderDivNm">
            <table summary="상품 게시판으로 주문하신 상품명, 수량, 판매가, 배송순으로 조회 하시고 쿠폰을 적용하실 수 있습니다." class="orderTable" border="1" cellspacing="0">
                <caption>상품 게시판</caption>
                <colgroup>
                <col width="*" />
                <col width="8%" class="tw25" />
                <col width="12%" class="pnone" />
                </colgroup>
                <thead>
                    <th scope="col">상품명</th>
                    <th scope="col">반품수량</th>
                    <th scope="col" class="pnone">가격</th>
                </thead>
                <tbody>
                    <tr>
                        <td class="left">
                            <p class="img"><img src="user/images/img/sample_product.jpg" alt="상품" width="66" height="66" /></p>

                            <ul class="goods">
                                <li>
                                    <a href="#">${ p_name }</a>
                                </li>
                            </ul>
                        </td>
                        <td>${ rt_amt } 개</td>
                        <td class="pnone">${ ol_price } 원</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="checkDiv">
            <table
                summary="분류, 자세한 이유 순으로 반품/교환 사유를 작성 하실수 있습니다."
                class="checkTable" border="1" cellspacing="0">
                <caption>반품/교환 사유</caption>
                <colgroup>
                    <col width="22%" class="tw30" />
                    <col width="*" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span>분류</span></th>
                        <td><select name="rt_reason1" id="rt_reason1">
                                <option value="">선택해주세요.</option>
                                <option value="불량">불량/파손</option>
                                <option value="변심">단순변심</option>
                                <option value="기타">기타</option>
                        </select></td>
                    </tr>
                    <tr>
                        <th scope="row"><span>자세한 이유</span></th>
                        <td><textarea class="tta" id="rt_reason2"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Btn Area -->
        <div class="btnArea">
            <div class="bCenter">
                <ul>
                    <li><a href="#" class="sbtnMini" id="return_submit">반품/교환신청</a></li>
                    <li><a href="#" class="nbtnbig">취소</a></li>
                </ul>
            </div>
        </div>
        <!-- //Btn Area -->

</div>

</div>


</div>














</body>
</html>