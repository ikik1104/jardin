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
    <script type="text/javascript">$(function(){$(".detailTab ul li a:eq(${initVal})").click();});</script>
    <script type="text/javascript">
    $(document).ready(function() {

    });


        //장바구니에 담기
function cart_insert() {
	var val = [$("#p_num").val(),$("#ca_amount").val()];
	if(confirm("해당 상품을 장바구니에 담으시겠습니까?")){
		$.ajax({
	        type : "POST",
	        url : "cart_insert",
	        data: JSON.stringify(val), 
	        contentType: "application/json",
	        success : function(val){
	           if(val == 1){ //리턴값이 1이면 (=성공)
	        	   if(confirm("장바구니 페이지로 이동하시겠습니까?")){
	        			location.href="cart";
	        		}
	           }else{ // 0이면 실패
	        	   alert("장바구니에 담기 실패");
	           }
	        },
	        error : function(){
	           alert("서버통신실패");
	        }
		});
	}else{
		return false;
	}
}

// 바로구매 
function buyNow(){
	var arrData = [$("#p_num").val(),$("#ca_amount").val()];

	if(confirm("구매하기 페이지로 이동하시겠습니까?")){
		$.ajax({
	        	type:"POST",
	        	url : "buynow",
	        	data: JSON.stringify(arrData),
	         	contentType: "application/json",
	            success : function(data){
	                        if(data == 1){
	                        	location.href="buynow_payment";
		    	       	}
		        	  },
			error:function(){
					alert("서버통신실패");
				  }
		});
		
	}else {
		return false;
	}
}

//위시리스트 담기
function addWishlist(p_num){
	
	$.ajax({
    	type:"POST",
    	url : "addWishlist",
    	data: JSON.stringify(p_num),
     	contentType: "application/json",
        success : function(data){
                    if(data == 1){
                    	if(confirm("해당 상품을 위시리스트에 담았습니다. 위시리스트 페이지로 이동하시겠습니까?")){
                    		location.href="wishlist";
                    	}else {
                    		return false;
                    	}
                    }else if(data == -1){
                    	if(confirm("이미 위시리스트에 담겨 있는 상품입니다. 위시리스트 페이지로 이동하시겠습니까?")){
                    		location.href="wishlist";
                    	}else {
                    		return false;
                    	}
	    	       	}else{
	    	       		alert("회원 전용 서비스입니다. 로그인 후 사용이 가능합니다. ");
	    	       	}
        	  },
	error:function(){
			alert("서버통신실패");
		  }
});
	
}

		function basicUpdate(num,content,title) {
			var html = "";
			html += "<form name='updateReview' id='updateReview' method='post'>";
			html += "제목 : <input type='text' name='ru_title' value='"+title+"'><br>";
			html += "<input type='hidden' name='ru_num' value='"+num+"'>";
			html += "내용 : <br><textarea rows='5' cols='50' name='ru_content'>"+content+"</textarea><br>";
			html += "<button type='button' onclick='updateReviewAjax()'>취소</button> <button type='button' onclick='back(\""+content+"\",\""+title+"\")'>취소</button></form>";
			$("#review_title").html(html);
			$("#reviewModify").css("display", "none");
		}
		
		function back(content, title){
			$("#review_title").html(title);
			$("#review_content").html(content);
			$("#reviewModify").css("display", "block");
		}
	
    	
		//ajax리뷰 업데이트
		function updateReviewAjax() {
			$.ajax({
				  type: 'post',
				  url:"./updateReview",
				  data: $("#updateReview").serialize(), // form에 있는 input값을 controller전송
				  contentType: "application/x-www-form-urlencoded;charset=UTF-8",
				  success:function(data){
				   if(data==1){
				    alert("리뷰 수정이 완료되었습니다.");
				    location.reload(true);
				   }
				   
				  },
				  error:function(request,status,error){
				   alert("실패 : "+error);
				  }
				  
				  });
		}
        
    </script>
</head>
<body>

<!--익스레이어팝업-->
<div id="ieUser" style="display:none">
    <div class="iewrap">
        <p class="img"><img src="user/images/ico/ico_alert.gif" alt="알림" /></p>
        <p class="txt">IE버전이 낮아 홈페이지 이용에 불편함이 있으므로 <strong>IE9이상이나 다른 브라우저</strong>를 이용해 주세요. </p>
        <ul>
            <li><a href="http://windows.microsoft.com/ko-kr/internet-explorer/download-ie" target="_blank"><img src="user/images/ico/ico_ie.gif" alt="IE 최신브라우저 다운" ></a></li>
            <li><a href="https://www.google.com/intl/ko/chrome/browser" target="_blank"><img src="user/images/ico/ico_chrome.gif" alt="IE 최신브라우저 다운" ></a></li>
            <li><a href="http://www.mozilla.org/ko/firefox/new" target="_blank"><img src="user/images/ico/ico_mozila.gif" alt="MOZILA 최신브라우저 다운" ></a></li>
            <li><a href="http://www.apple.com/safari" target="_blank"><img src="user/images/ico/ico_safari.gif" alt="SAFARI 최신브라우저 다운" ></a></li>
            <li><a href="http://www.opera.com/ko/o/ie-simple" target="_blank"><img src="user/images/ico/ico_opera.gif" alt="OPERA 최신브라우저 다운" ></a></li>
        </ul>
        <p class="btn" onclick="msiehide();"><img src="user/images/ico/ico_close.gif" alt="닫기" /></p>
    </div>
</div>
<!--//익스레이어팝업-->
<!--IE 6,7,8 사용자에게 브라우저 업데이터 설명 Div 관련 스크립트-->
<script type="text/javascript">

    var settimediv = 200000; //지속시간(1000= 1초)
    var msietimer;

    $(document).ready(function () {
//          msiecheck();
        //리뷰 길이 자르기
//          textLengthOverCut();
    });

    var msiecheck = function () {
        var browser = navigator.userAgent.toLowerCase();
        if (browser.indexOf('msie 6') != -1 ||
            browser.indexOf('msie 7') != -1 ||
            browser.indexOf('msie 8') != -1) {
            msieshow();
        }
        else {
            msiehide();
        }
    }

    var msieshow = function () {
        $("#ieUser").show();
        msietimer = setTimeout("msiehide()", settimediv);
    }

    var msiehide = function () {
        $("#ieUser").hide();
        clearTimeout(msietimer);
    }

    //text 치환
    function textLengthOverCut(txt, len, lastTxt) {
        if (len == "" || len == null) { // 기본값
            len = 20;
        }
        if (lastTxt == "" || lastTxt == null) { // 기본값
            lastTxt = "...";
        }
        if (txt.length > len) {
            txt = txt.substr(0, len) + lastTxt;
        }
        return txt;
    }




</script>

<div id="allwrap">
    <div id="wrap">

        <jsp:include page="../header.jsp" />

        <!-- container -->
        <div id="container">

            <div id="location">
                <ol>
                    <li><a href="#">HOME</a></li>
                    <li>${pdto.p_step1}</li>
                    <li class="last">${pdto.p_step2}</li>
                </ol>
            </div>

            <!-- maxcontents -->
            <div id="maxcontents">



                <!-- product -->
                <div id="pDetail">

                    <!-- Slide -->
                    <div class="imgSlide">
                        <div class="img">
                            <ul>
                                <li style="padding: 0px;"><img src="${pdto.p_thumb_img1}" width="350px" alt="제품이미지" /></li>
                                <c:if test="${not empty pdto.p_thumb_img2}">
	                                <li style="padding: 0px;"><img src="${pdto.p_thumb_img2}" width="350px"  alt="제품이미지" /></li>
                                </c:if>
                                <c:if test="${not empty pdto.p_thumb_img3}">
	                                <li style="padding: 0px;"><img src="${pdto.p_thumb_img3}" width="350px"  alt="제품이미지" /></li>
                                </c:if>
                            </ul>
                        </div>

                        <div class="thum">
                            <ul>
                                <li><img src="${pdto.p_thumb_img1}" width="350px"  alt="썸네일 제품이미지" /></li>
                                <c:if test="${not empty pdto.p_thumb_img2}">
	                                <li><img src="${pdto.p_thumb_img2}" width="350px"  alt="썸네일 제품이미지" /></li>
                                </c:if>
                                <c:if test="${not empty pdto.p_thumb_img3}">
	                                <li><img src="${pdto.p_thumb_img3}" width="350px"  alt="썸네일 제품이미지" /></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                    <!-- //Slide -->


                    <!-- info -->
                    <div class="info">
                        <p class="title">
                            <span>[오리지널]</span>
                            ${pdto.p_name}
                        </p>

                        <div class="priceInfo">
                            <form action="cart_insert" method="post" name="inputForm">
                                <ul>
                                    <li>
                                        <div class="stit">판매가</div> <div class="heavygray">
                                        <strong><fmt:formatNumber value="${pdto.p_price}" type="number"/>원</strong>
                                    </div>
                                    </li>
                                    <li>
                                        <div class="stit">포인트</div> <div class="orange"><strong>${pdto.p_point} Point</strong></div>
                                    </li>
                                    <li>
                                        <div class="stit">식품유형</div> <div>${pdto.p_type}</div>
                                    </li>
                                    <li>
                                        <div class="stit">용량</div> <div>${pdto.p_capacity}</div>
                                    </li>
                                    <li>
                                        <div class="stit">수량</div> <div class="num"><input id="ca_amount" value="1" name="ca_amount"/></div>
                                        <input type="hidden"  name="p_num" id="p_num" value="${pdto.p_num}">
                                    </li>
                                    <li>
                                        <div class="stit">평점${pdto.p_score}</div>
                                        <div>
                                            <c:forEach begin="1" end="${pdto.p_score}" >
		                                       <img src="user/images/ico/ico_star.gif" alt="별점" />
		                                    </c:forEach>
		                                     <c:forEach begin="1" end="${5-pdto.p_score}">
		                                       <img src="user/images/ico/ico_star_off.gif" alt="별점" />
		                                     </c:forEach>
                                        </div>
                                    </li>
                                </ul>
                            </form>
                        </div>

                        <!-- 판매중 -->
                        <div class="infobtn">
                            <ul>
                                <li onclick="buyNow()"><a href="#" class="ty1">바로 <span>구매하기</span></a></li>
							    <li onclick="cart_insert()"><a href="#" class="ty2">장바구니 <span>담기</span></a></li>
							    <li onclick="addWishlist(${pdto.p_num})" class="last"><a href="#" class="ty3">위시 <span>리스트</span></a></li>
                            </ul>
                        </div>
                        <!-- //판매중 -->

                        <!-- 판매중지 -->
                        <div class="endbtn" style="display:none;">
                            <ul>
                                <li><a href="#">판매중지</a></li>
                                <li><a href="#">SOLD OUT</a></li>
                            </ul>
                        </div>
                        <!-- //판매중지 -->


                    </div>
                    <!-- //info -->

                </div>
                <!-- //product -->


                <!-- tab -->
                <div class="detailTab">
                    <ul>
                        <li class="dep"><a href="javascript:;" onclick="return false;" id="detailInfo">상품상세 정보</a></li>
                        <li><a href="javascript:;" onclick="return false;" id="goodsRelation">관련상품</a></li>
                        <li class="dep"><a href="javascript:;" onclick="return false;" id="goodsReview">상품리뷰 <span>(${reviewCount})</span></a></li>
                        <li><a href="javascript:;" onclick="return false;" id="goodsQna">질문과 답변 <span>(${qnaCount})</span></a></li>
                        <li class="last"><a href="javascript:;" onclick="return false;" id="goodsNotice">정책 및 공지</a></li>
                    </ul>
                </div>
                <!-- //tab -->


                <!-- detail content -->
                <div id="detailContent">

                    <!-- detail info -->
                    <div class="detailInfo disnone">
                        <img src="${pdto.p_content_img}" width="900px" class="web" alt="제품상세 정보" />
                        <img src="${pdto.p_content_img}" class="mobile" alt="제품상세 정보" />
                        <div class="checkInfoDiv">
                            <table summary="제품의 정보를 알 수 있는 표로 제품명, 내용량, 제조원, 포장재질, 유통기한, 고객상담실, 식품의 유형, 유통전문판매원, 영양성분, 원재료명 및 함량, 업소명 및 소재지 순으로 나열되어 있습니다." class="checkTable" border="1" cellspacing="0">
                                <caption>제품의 정보</caption>
                                <colgroup>
                                    <col width="20%" class="tw22" />
                                    <col width="*" />
                                    <col width="18%" class="tw22" />
                                    <col width="*" class="tw25" />
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row" class="info"><span>제조명</span></th>
                                    <td>${pdto.p_name}</td>
                                    <th scope="row" class="info"><span>내용량</span></th>
                                    <td>${pdto.p_capacity}</td>
                                </tr>

                                <tr>
                                    <th scope="row" class="info"><span>제조원</span></th>
                                    <td>${pdto.p_producer}</td>
                                    <th scope="row" class="info"><span>식품유형</span></th>
                                    <td>${pdto.p_type}</td>
                                </tr>

                                <tr>
                                    <th scope="row" class="info"><span>유통기한</span></th>
                                    <td>${pdto.p_expiry}</td>
                                    <th scope="row" class="info"><span>고객<u>상담실</u></span></th>
                                    <td>02-546-3881</td>
                                </tr>

                                <tr>
                                    <th scope="row" class="info"><span>유전자 재조합 유무</span></th>
                                    <td >${pdto.p_gene}</td>
                                    <th scope="row" class="info"><span>수입식품 유무</span></th>
                                    <td>${pdto.p_import}</td>
                                </tr>

                                <tr>
                                    <th scope="row" class="info"><span>식품의 <u>유형</u></span></th>
                                    <td>${pdto.p_step2}</td>
                                </tr>

                                <tr>
                                    <th scope="row" class="info"><span>원재료명 <u>및 함량</u></span></th>
                                    <td colspan="3">${pdto.p_detail}</td>
                                </tr>

                                <tr>
                                    <th scope="row" class="info"><span>업소명 <u>및 소재지</u></span></th>
                                    <td colspan="3">${pdto.p_location}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- detail info -->

                    <!-- goods relation -->
                    <div class="goodsRelation disnone">
                        <div class="headTitle">
                            <strong>관련상품&nbsp;</strong> 이 상품을 구매하신 분들이 함께 구매한 상품입니다.
                        </div>

                        <div class="relationList">
                            <ul>
                                <li>
                                    <div class="img"><img src="user/images/img/sample_relation_goods.jpg" alt="관련상품 이미지" /></div>
                                    <div class="name"><a href="#">쟈뎅 오리지널 블루마운틴 블렌드 원두커피백 15P</a></div>
                                    <div class="price">4,3330원</div>
                                </li>

                                <li>
                                    <div class="img"><img src="user/images/img/sample_relation_goods.jpg" alt="관련상품 이미지" /></div>
                                    <div class="name"><a href="#">쟈뎅 오리지널 블루마운틴 블렌드 원두커피백 15P</a></div>
                                    <div class="price">4,3330원</div>
                                </li>

                                <li>
                                    <div class="img"><img src="user/images/img/sample_relation_goods.jpg" alt="관련상품 이미지" /></div>
                                    <div class="name"><a href="#">쟈뎅 오리지널 블루마운틴 블렌드 원두커피백 15P</a></div>
                                    <div class="price">4,3330원</div>
                                </li>

                                <li>
                                    <div class="img"><img src="user/images/img/sample_relation_goods.jpg" alt="관련상품 이미지" /></div>
                                    <div class="name"><a href="#">쟈뎅 오리지널 블루마운틴 블렌드 원두커피백 15P</a></div>
                                    <div class="price">4,3330원</div>
                                </li>

                                <li>
                                    <div class="img"><img src="user/images/img/sample_relation_goods.jpg" alt="관련상품 이미지" /></div>
                                    <div class="name"><a href="#">쟈뎅 오리지널 블루마운틴 블렌드 원두커피백 15P</a></div>
                                    <div class="price">4,3330원</div>
                                </li>
                            </ul>
                        </div>

                        <div class="btnAreaList">
                            <!-- 페이징이동1 -->
                            <div class="allPageMoving1">

                                <a href="#" class="n"><img src="user/images/btn/btn_pre2.gif" alt="처음으로"/></a><a href="#" class="pre"><img src="user/images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
                                <strong>1</strong>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#">4</a>
                                <a href="#">5</a>
                                <a href="#" class="next"><img src="user/images/btn/btn_next1.gif" alt="뒤페이지로"/></a><a href="#" class="n"><img src="user/images/btn/btn_next2.gif" alt="마지막페이지로"/></a>

                            </div>
                            <!-- //페이징이동1 -->
                        </div>

                    </div>
                    <!-- //goods relation -->

                    <!-- goods review -->
                    <div class="goodsReview disnone">
                        <div class="headTitle">
                            <strong>포토 상품평&nbsp;</strong> 포토 상품평 작성자 중 우수상품평을 선정해 소정의 선물을 드립니다.
                             <c:if test="${empty userNum}">
	                        	<p class="btn"><a href="login" >구매 후기 작성</a></p>
	                        </c:if>
	                        <c:if test="${not empty userNum}">
	                        	<p class="btn"><a href="ordercheck" >구매 후기 작성</a></p>
	                        </c:if>
                        </div>


                        <!-- 포토 구매후기 -->
                        <div class="imgListType">
                            <ul id="ajax_photo">
                            	<c:choose>
                            		<c:when test="${not empty photo}"><!-- 널이 아니면 아래 출력 -->
		                            	<c:forEach items="${photo}" var="photo">
		                                    <!-- List -->
		                                    <li>
		                                        <div class="img"><img src="user/images/img/sample_epil.jpg" width="155" height="160" alt="" /></div>
		                                        <div class="txt">
		                                            <div class="subject">
		                                                <a href="#"><span class="orange">[포토후기]</span>${photo.RU_TITLE}</a>
		                                            </div>
		                                            <div class="conf">
		                                                    ${photo.RU_CONTENT}
		                                            </div>
		                                            <div class="data">
		                                                <p>작성자 <span>${photo.M_ID}</span></p>
		                                                <p>등록일 <span><fmt:formatDate value="${photo.RU_DATE}" pattern="yyyy-MM-dd"/> </span></p>
		                                                <p>조회수 <span>${photo.RU_HIT}</span></p>
		                                                <p>평점
		                                                    <span class="ty">
		                                 <c:forEach begin="1" end="${photo.RU_SCORE}" >
		                                     <img src="user/images/ico/ico_star.gif" alt="별점" />
		                                 </c:forEach>
		                                 <c:forEach begin="1" end="${5-photo.RU_SCORE}">
		                                     <img src="user/images/ico/ico_star_off.gif" alt="별점" />
		                                 </c:forEach>
		                                 </span>
		                                                </p>
		                                            </div>
		                                        </div>
		                                    </li>
		                                    <!-- //List -->
		                                </c:forEach>
                            		</c:when>
                            		<c:otherwise>
                            			<li style="text-align: center; padding : 20px 0;">등록된 포토후기가 없습니다.</li>
                            		</c:otherwise>
                            	</c:choose>
                                
                            </ul>
                        </div>
						<c:if test="${not empty photo}">
	                        <div class="btnAreaList" >
	                            <!-- 페이징이동1 -->
	                            <div class="allPageMoving1" id="ajaxPhotoPaging">
	                                <a href="product_detail?p_page=1&p_num=${pdto.p_num}&initVal=2" class="n"><img src="user/images/btn/btn_pre2.gif" alt="처음으로"/></a>
	                                <c:if test="${ photoPaging.getPage()<=1 }">
	                                    <img src="user/images/btn/btn_pre1.gif" alt="앞페이지로"/>
	                                </c:if>
	                                <c:if test="${ photoPaging.getPage()>1 }">
	                                    <a href="product_detail?p_page=${ photoPaging.getPage() - 1 }&p_num=${pdto.p_num}&initVal=2" class="pre"><img src="user/images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
	                                </c:if>
	                                <c:forEach var="num" begin="${ photoPaging.getStartPage() }" end="${ photoPaging.getEndPage() }" step="1">
	                                    <c:choose>
	                                        <c:when test="${ num == photoPaging.getPage() }">
	                                            <strong>${ num }</strong>
	                                        </c:when>
	                                        <c:when test="${ num != photoPaging.getPage() }">
	                                            <a href="product_detail?p_page=${ num }&p_num=${pdto.p_num}&initVal=2">${ num }</a>
	                                        </c:when>
	                                    </c:choose>
	                                </c:forEach>
	
	                                <c:if test="${ photoPaging.getPage()>= photoPaging.getLastPage() }">
	                                    <img src="user/images/btn/btn_next1.gif" alt="뒤페이지로"/>
	                                </c:if>
	                                <c:if test="${ photoPaging.getPage() < photoPaging.getLastPage() }">
	                                    <a href="product_detail?p_page=${ photoPaging.getPage() + 1 }&p_num=${pdto.p_num}&initVal=2" class="next"><img src="user/images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
	                                </c:if>
	                                <a href="product_detail?p_page=${ photoPaging.getLastPage() }&p_num=${pdto.p_num}&initVal=2" class="n"><img src="user/images/btn/btn_next2.gif" alt="마지막페이지로"/></a>
	                            </div>
	                            <!-- //페이징이동1 -->
	                        </div>
						</c:if>


                        <!-- //포토 구매후기 -->
                        <div class="headTitle depth">
                            <strong>상품리뷰&nbsp;</strong>상품리뷰는 상품 구매 후 작성하실 수 있습니다.
                            <c:if test="${empty userNum}">
	                        	<p class="btn"><a href="login" >구매 후기 작성</a></p>
	                        </c:if>
	                        <c:if test="${not empty userNum}">
	                        	<p class="btn"><a href="ordercheck" >구매 후기 작성</a></p>
	                        </c:if>
                        </div>

                        <!-- 상품리뷰 -->
                        <div class="accordion">
                            <ul>
                            	<c:choose>
                            		<c:when test="${not empty basic}">
		                                <c:forEach items="${basic}" var="basic">
		                                    <!-- 반복 -->
		                                    <li>
		                                        <div class="headArea">
		                                            <div class="subject">
		                                                <a href="javascript:;" class="accbtn">${basic.RU_TITLE}</a>
		                                            </div>
		                                            <div class="writer">${basic.M_ID}</div>
		                                            <div class="day">
		                                                <p><fmt:formatDate value="${basic.RU_DATE}" pattern="yyyy-MM-dd"/></p>
		                                                <p>
		                                                    <c:forEach begin="1" end="${basic.RU_SCORE}" >
		                                                        <img src="user/images/ico/ico_star.gif" alt="별점" />
		                                                    </c:forEach>
		                                                    <c:forEach begin="1" end="${5-basic.RU_SCORE}">
		                                                        <img src="user/images/ico/ico_star_off.gif" alt="별점" />
		                                                    </c:forEach>
		
		                                                </p>
		                                            </div>
		                                        </div>
		
		                                        <div class="hideArea">
		                                            <div class="bodyArea" id="review_title">
		                                                    ${basic.RU_TITLE}
		                                            </div>
		
		 											
		 											<c:if test="${not empty basic.RA_NUM}">
			                                            <!-- 답변 -->
			                                            <div class="answer">
			                                                <div class="inbox">
			                                                    <div class="aname">
			                                                        <p>${basic.AD_GRADE}</p>
			                                                    </div>
			
			                                                    <div class="atxt" id="review_content">
			                                                            ${basic.RA_CONTENT}
			                                                    </div>
			                                                </div>
			                                            </div>
			                                            <!-- //답변 -->
		 											</c:if>
		
													<c:if test="${basic.M_NUM == userNum}">
		                                            <div class="modify" id="reviewModify">
		                                                <a onclick="basicUpdate('${basic.RU_NUM}','${basic.RU_CONTENT}','${basic.RU_TITLE}')">수정</a>
		                                                <a onclick="basicDelete(${basic.RU_NUM})">삭제</a>
		                                            </div>
													</c:if>
		                                        </div>
		                                    </li>
		                                    <!-- //반복 -->
		                                </c:forEach>
                            		</c:when>
                            		<c:otherwise>
                            			<li style="text-align: center; padding: 20px 0; ">등록된 상품평이 없습니다.</li>
                            		</c:otherwise>
                            	</c:choose>
                            </ul>
                        </div>

						<c:if test="${not empty basic}">
	                        <div class="btnAreaList">
	                            <!-- 페이징이동1 -->
	                            <div class="allPageMoving1">
	                                <a href="product_detail?b_page=1&ru_type='일반'&p_num=${pdto.p_num}&initVal=2" class="n"><img src="user/images/btn/btn_pre2.gif" alt="처음으로"/></a>
	                                <c:if test="${ basicPaging.getPage()<=1 }">
	                                    <img src="user/images/btn/btn_pre1.gif" alt="앞페이지로"/>
	                                </c:if>
	                                <c:if test="${ basicPaging.getPage()>1 }">
	                                    <a href="product_detail?b_page=${ basicPaging.getPage() - 1 }&ru_type='일반'&p_num=${pdto.p_num}&initVal=2" class="pre"><img src="user/images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
	                                </c:if>
	                                <c:forEach var="num" begin="${ basicPaging.getStartPage() }" end="${ basicPaging.getEndPage() }" step="1">
	                                    <c:choose>
	                                        <c:when test="${ num == basicPaging.getPage() }">
	                                            <strong>${ num }</strong>
	                                        </c:when>
	                                        <c:when test="${ num != basicPaging.getPage() }">
	                                            <a href="product_detail?b_page=${ num }&ru_type='일반'&p_num=${pdto.p_num}&initVal=2">${ num }</a>
	                                        </c:when>
	                                    </c:choose>
	                                </c:forEach>
	
	                                <c:if test="${ basicPaging.getPage()>= basicPaging.getLastPage() }">
	                                    <img src="user/images/btn/btn_next1.gif" alt="뒤페이지로"/>
	                                </c:if>
	                                <c:if test="${ basicPaging.getPage() < basicPaging.getLastPage() }">
	                                    <a href="product_detail?b_page=${ basicPaging.getPage() + 1 }&ru_type='일반'&p_num=${pdto.p_num}&initVal=2" class="next"><img src="user/images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
	                                </c:if>
	                                <a href="product_detail?b_page=${ basicPaging.getLastPage() }&ru_type='일반'&p_num=${pdto.p_num}&initVal=2" class="n"><img src="user/images/btn/btn_next2.gif" alt="마지막페이지로"/></a>
	                            </div>
	                            <!-- //페이징이동1 -->
	                        </div>
	                        <!-- //상품리뷰 -->
						</c:if>

                    </div>
                    <!-- //goods review -->


                    <!-- goods qna -->
                    <div class="goodsQna disnone">
                        <div class="headTitle depth">
                            <strong>질문과 답변&nbsp;</strong>상품과 관련된 문의와 답변을 하는 공간입니다.
                            <c:if test="${empty userNum}">
	                            <p class="btn"><a href="login">문의하기</a></p>
                            </c:if>
                            <c:if test="${not empty userNum}">
	                            <p class="btn"><a href="inquiry_form?p_num=${pdto.p_num}" class="popBtn">문의하기</a></p>
                            </c:if>
                        </div>

                        <!-- 질문과 답변 -->
                        <div class="accordion">
                            <ul>
                                <c:choose>
                                    <c:when test="${not empty qna}">
                                        <c:forEach var="qna" items="${qna}">
                                            <li>
                                                <div class="headArea">
                                                    <div class="subject">
                                                        <a href="javascript:;" class="accbtn">${qna.QU_TITLE}</a>
                                                    </div>
                                                    <div class="writer">[${qna.M_ID}]</div>
                                                    <div class="day">
                                                        <p><fmt:formatDate value="${qna.QU_DATE}" pattern="yyyy-MM-dd"/></p>
                                                        <c:if test="${qna.QU_STATUS eq '답변대기'}">
	                                                        <p><span class="nbtnMini iw70">${qna.QU_STATUS}</span></p>
                                                        </c:if>
                                                        <c:if test="${qna.QU_STATUS eq '답변완료'}">
	                                                        <p><span class="obtnMini iw70">${qna.QU_STATUS}</span></p>
                                                        </c:if>
                                                    </div>
                                                </div>

                                                <div class="hideArea">
                                                    <div class="bodyArea">
                                                            ${qna.QU_CONTENT}
                                                    </div>
                                                    
                                                    <!-- 답변 -->
                                                    <c:if test="${not empty qna.QA_NUM}">
                                                        <div class="answer">
                                                            <div class="inbox">
                                                                <div class="aname">
                                                                    <p>담당자</p>
                                                                </div>

                                                                <div class="atxt">
                                                                        ${qna.QA_CONTENT}
                                                                </div>
                                                                
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <!-- //답변 -->

													<c:if test="${qna.M_NUM == userNum}">
                                                    <div class="modify">
                                                        <a href="#">수정</a>
                                                        <a href="#">삭제</a>
                                                    </div>
                                                    </c:if>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <li style="text-align: center; padding: 20px 0;">등록된 질문이 없습니다.</li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                        <!-- //질문과 답변 -->

						<c:if test="${not empty qna}">
	                        <div class="btnAreaList">
	                            <!-- 페이징이동1 -->
	                            <div class="allPageMoving1">
	                                <a href="product_detail?q_page=1&p_num=${pdto.p_num}&initVal=3" class="n"><img src="user/images/btn/btn_pre2.gif" alt="처음으로"/></a>
	                                <c:if test="${ qnaPaging.getPage()<=1 }">
	                                    <img src="user/images/btn/btn_pre1.gif" alt="앞페이지로"/>
	                                </c:if>
	                                <c:if test="${ qnaPaging.getPage()>1 }">
	                                    <a href="product_detail?q_page=${ qnaPaging.getPage() - 1 }&p_num=${pdto.p_num}&initVal=3" class="pre"><img src="user/images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
	                                </c:if>
	                                <c:forEach var="num" begin="${ qnaPaging.getStartPage() }" end="${ qnaPaging.getEndPage() }" step="1">
	                                    <c:choose>
	                                        <c:when test="${ num == qnaPaging.getPage() }">
	                                            <strong>${ num }</strong>
	                                        </c:when>
	                                        <c:when test="${ num != qnaPaging.getPage() }">
	                                            <a href="product_detail?q_page=${ num }&p_num=${pdto.p_num}&initVal=3">${ num }</a>
	                                        </c:when>
	                                    </c:choose>
	                                </c:forEach>
	
	                                <c:if test="${ qnaPaging.getPage()>= qnaPaging.getLastPage() }">
	                                    <img src="user/images/btn/btn_next1.gif" alt="뒤페이지로"/>
	                                </c:if>
	                                <c:if test="${ qnaPaging.getPage() < qnaPaging.getLastPage() }">
	                                    <a href="product_detail?q_page=${ qnaPaging.getPage() + 1 }&p_num=${pdto.p_num}&initVal=3" class="next"><img src="user/images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
	                                </c:if>
	                                <a href="product_detail?q_page=${ qnaPaging.getLastPage() }&p_num=${pdto.p_num}&initVal=3" class="n"><img src="user/images/btn/btn_next2.gif" alt="마지막페이지로"/></a>
	                            </div>
	                            <!-- //페이징이동1 -->
	                        </div>
						</c:if>
	                    </div>
	                    <!-- //goods qna -->


                    <!-- goods notice -->
                    <div class="goodsNotice disnone">
                        <div class="headTitle depth">
                            <strong>정책 및 공지&nbsp;</strong>주문 전 필독 사항입니다.
                        </div>

                        <div class="detailDiv">
                            <table summary="정책 및 공지 알림 게시판으로 회원가입안내, 주문안내, 결제안내, 배송안내, 교환/반품안내, 환불안내 순으로 조회 하실수 있습니다. " class="detailTable" border="1" cellspacing="0">
                                <caption>정책 및 공지</caption>
                                <colgroup>
                                    <col width="22%" class="tw30" />
                                    <col width="*" />
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row"><span>회원가입<br/>안내</span></th>
                                    <td>
                                        <ul>
                                            <li>저희 쇼핑몰은 회원제로 운영합니다.</li>
                                            <li>회원가입비나 월회비, 연회비 등 어떠한 비용도 청구하지 않는 100% 무료입니다.</li>
                                            <li>회원님들께는 구매 시 포인트 혜택을 드립니다.</li>
                                        </ul>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><span>주문 안내</span></th>
                                    <td>
                                        <ul>
                                            <li>Step 1 : 상품 검색</li>
                                            <li>Step 2 : 장바구니에 담기</li>
                                            <li>Step 3 : 회원 ID 로그인 또는 비회원으로 주문하기</li>
                                            <li>Step 4 : 주문 성공 화면(주문번호)</li>
                                        </ul>

                                        <p class="fn12">※비회원 주문인 경우 주문번호와 승인번호(카드 결제 시)를 꼭 메모해 두시기 바랍니다.<br/>&nbsp;&nbsp;&nbsp;단, 회원의 경우 자동으로 저장되므로 따로 관리하실 필요가 없습니다.</p>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><span>결제 안내</span></th>
                                    <td>
                                        <ul>
                                            <li>카드 결제나 무통장 입금을 하시는 경우 입금/결제 확인 후 상품이 배송됩니다.</li>
                                            <li>무통장 입금 시 주문자와 입금자가 다른 경우 배송이 지연될 수 있습니다. 게시판에 정보를 남겨주셔야 합니다. </li>
                                        </ul>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><span>배송 안내</span></th>
                                    <td>
                                        <ul>
                                            <li>배송 방법 : 택배</li>
                                            <li>배송 지역 : 전국 지역 (제주 도서/산간지역 별도)</li>
                                            <li>배송 비용 : 총 결제금액이 100,000원 미만일 경우 2,500원 추가됩니다.</li>
                                            <li>배송 안내 : 재고가 없거나 재입고 될 경우 7~14일이 소요됩니다.</li>
                                        </ul>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><span>교환/반품<br/>안내</span></th>
                                    <td>
                                        <ul>
                                            <li>저희 쇼핑몰은 교환/반품 정책을 운영하고 있습니다.</li>
                                            <li>사이즈 교환에 한하여는 1회 교환이 가능합니다. (단, 택배비는 고객 부담입니다.)</li>
                                            <li>교환 시 제품을 수령한 날로부터 24시간 이내 1:1문의 게시판 혹은 고객센터로 연락을 주시고 3일 이내에 보내주신 상품에 한하여 교환됩니다.</li>
                                            <li>제품에 하자가 있는 경우에는 동일 사이즈, 동일 디자인으로 재교환 해 드립니다.</li>
                                        </ul>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><span>환불 안내</span></th>
                                    <td>
                                        <ul>
                                            <li>환불 시 반품 확인 여부를 확인 한 후 3일 이내에 결제금액을 환불해 드립니다.</li>
                                            <li>신용카드로 결제하신 경우, 신용카드 승인을 취소하면 결제 대금이 청구되지 않습니다. </li>
                                        </ul>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //goods notice -->


                </div>
                <!-- //detail content -->







		
		<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
		<script type="text/javascript" src="user/js/jquery.fancybox-1.3.4.pack.js"></script>
		<link rel="stylesheet" type="text/css" href="user/css/jquery.fancybox-1.3.4.css" />
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
		<style type="text/css">
		.ui-corner-all{border-bottom-right-radius:0 !important; border-bottom-left-radius:0 !important; border-top-left-radius:0 !important; border-top-right-radius:0 !important;}
		.ui-widget-content{border:0;}
		.ui-spinner-input{width:70px; margin:0; border:1px #ddd solid; padding:2px 0 2px 5px; font-family:'Nanum Gothic' !important; font-size:12px !important;}
		</style>
		
		<script type="text/javascript">
		$(document).ready(function() {
		
			// spinner
			var spinner = $( "#spinner" ).spinner({ min: 1 });
			
		
			// rolling
			function widthChk(){
				var winWidth = $(window).width();
				if(winWidth > 983){var twidth = 348;
				}else if(winWidth < 983 && winWidth > 767){var twidth = 298;
				}else{var twidth = 248;}
				return twidth
			}
		
			function slideChk(){
				var ulchk = widthChk() * $(".img ul li").size();
				$(".img ul").css("width",ulchk);
			}
			
			$(".thum ul li").click(function(){
				var winWidth = $(window).width();
				var thumNum = $(".thum ul li").index(this);	
				var ulLeft = widthChk() * thumNum ;
				$(".thum ul li").removeClass("hover");
				$(this).addClass("hover");
				$(".img ul").stop().animate({"left": - ulLeft}, 500);
			});
			
		
			// goods relation last margin
			function relationChk(){
				var winWidth = $(window).width();
				if(winWidth > 767){
					$(".relationList li").css("margin","0 20px 0 0");
					$(".relationList li:eq(4)").css("margin","0");
				}else if(winWidth < 768 && winWidth > 360){
					$(".relationList li").css("margin","0 10px 10px 0");
					$(".relationList li:eq(4)").css("margin","0");
				}else{
					$(".relationList li").css("margin","0 10px 10px 0");
					$(".relationList li:nth-child(2n)").css("margin","0 0 10px 0");
				}
			}
		
			// layer popup
			var winWidth = $(window).width();
			if(winWidth > 767){
				var layerCheck = 540;
				var popCheck = 768;
			}else{
				var layerCheck = 320;
				var popCheck = 320;
			}
			$(".passbtn").fancybox({
				'autoDimensions'    : false,
				'showCloseButton'	: false,
				'width' : layerCheck,
				'padding' : 0,
				'type'			: 'iframe',
				'onComplete' : function() {
					$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
					$('#fancybox-content').height($(this).contents().find('body').height());
					});
				}
			});
		
			$(".popBtn").fancybox({
				'autoDimensions'    : false,
				'showCloseButton'	: false,
				'width' : popCheck,
				'padding' : 0,
				'type'			: 'iframe',
				'onComplete' : function() {
					$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
					$('#fancybox-content').height($(this).contents().find('body').height());
					});
				}
			});
		
		
			// resize
			$(window).resize(function(){
				$(".thum ul li:eq(0)").click();
				slideChk();
				relationChk();
			});
		
		
			$(".thum ul li:eq(0)").click();
			slideChk();
			relationChk();
		
		});
		</script>




            </div>
            <!-- //maxcontents -->

        </div>
        <!-- //container -->




        <jsp:include page="../footer.jsp" />



    </div>
</div>
	
</body>
</html>