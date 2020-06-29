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
	
    $(".submit_color").css('color', '#f7703c');
    
    $(".gotodetail").click(function(){
    	var p_num = $(this).attr('id');
    	parent.location.href="product_detail?p_num="+p_num;
  		parent.$.fancybox.close();
    });
	
});


</script> 
<style type="text/css">
.ui-corner-all{border-bottom-right-radius:0 !important; border-bottom-left-radius:0 !important; border-top-left-radius:0 !important; border-top-right-radius:0 !important;}
.ui-widget-content{border:0;}
.ui-spinner-input{width:50px; margin:0; border:1px #ddd solid; padding:2px 0 2px 5px; font-family:'Nanum Gothic' !important; font-size:12px !important;}
.noreview{text-align: center; font-size: 16px; line-height: 100px;}
.orderDivNm{margin-bottom: 30px;}
</style>
</head>
<body>
<div id="layerWrap">

<div class="inputWrap">
		
	<div class="inputBody">
		<div class="title">작성 가능한 리뷰 목록</div>
		<p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;"><img src="user/images/btn/btn_input_close.gif" alt="닫기" /></a></p>

		<div class="orderDivNm">  
			<!-- 작성가능한 리뷰 있음 -->
			<c:if test="${ not empty list }">
				<table summary="상품 게시판으로 주문하신 상품명, 수량, 판매가, 배송순으로 조회 하시고 쿠폰을 적용하실 수 있습니다." class="orderTable" border="1" cellspacing="0">
					<caption>상품 게시판</caption>
					<colgroup>
					<col width="*" />
					<col width="30%" class="pnone" />
					</colgroup>
					<thead>
						<th scope="col">상품명</th>
						<th scope="col" class="pnone">리뷰작성</th>
					</thead>
					<tbody>
		                    <c:forEach items="${ list }" var="list" varStatus="status">
							<tr id="${ status.index }" class="parents">
		                        <td>
									<p class="img"><img src="${ list.P_THUMB_IMG1 }" alt="상품" width="66" height="66" /></p>
		
									<ul class="goods">
										<li>
											<a href="#" id="${ list.P_NUM }" class="name${ status.index } gotodetail">${ list.P_NAME }</a>
										</li>
									</ul>
								</td>
								
								<td class="pnone">
									<a href="my_review_write?p_num=${ list.P_NUM }&p_name=${ list.P_NAME }&ol_num=${ list.O_NUM }&ol_order_num=${ list.OL_ORDER_NUM }" class="submit_color" id="btn${ status.index }"> 작성하기 </a>
								</td>
							</tr>
		                    </c:forEach>
					</tbody>
				</table>
            </c:if>
            <!-- 작성가능한 리뷰 없음 -->
            <c:if test="${ empty list }">
            	<div class="noreview">작성 가능한 리뷰가 없습니다.</div>
            </c:if>
		</div>
        
        <!-- 작성 완료 목록 -->
               
        <div class="title">작성한 리뷰 목록</div>
            <div class="orderDivNm">  
            <c:if test="${ not empty listEnd }">
                <table summary="상품 게시판으로 주문하신 상품명, 수량, 판매가, 배송순으로 조회 하시고 쿠폰을 적용하실 수 있습니다." class="orderTable" border="1" cellspacing="0">
                    <caption>상품 게시판</caption>
                    <colgroup>
                    <col width="*" />
                    <col width="30%" class="pnone" />
                    </colgroup>
                    <thead>
                        <th scope="col">상품명</th>
                        <th scope="col" class="pnone">작성글보기</th>
                    </thead>
                    <tbody>
                            <c:forEach items="${ listEnd }" var="listEnd" varStatus="status2">
                            <tr id="${ status2.index }" class="parents">
                                <td>
                                    <p class="img"><img src="${ listEnd.P_THUMB_IMG1 }" alt="상품" width="66" height="66" /></p>
        
                                    <ul class="goods">
                                        <li>
                                            <a href="#" id="${ listEnd.P_NUM }" class="name${ status2.index } gotodetail">${ listEnd.P_NAME }</a>
                                        </li>
                                    </ul>
                                </td>
                                
                                <td class="pnone">
                                    <a href="my_review_view?ol_num=${ listEnd.O_NUM }" class="submit_color" id="btn2${ status2.index }"> 작성글보기 </a>
                                </td>
                            </tr>
                            </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <!-- 작성가능한 리뷰 없음 -->
            <c:if test="${ empty listEnd }">
                <div class="noreview">작성 완료한 리뷰가 없습니다.</div>
            </c:if>
        </div> 
        
        
        
        <!-- //작성 완료 목록 -->
        
	</div>

</div>


</div>
</body>
</html>