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
	
	//유효성검사
	
	//포토등록버튼
	$(".photo_btn").click(function(){
		photo_rv_insert.submit();
	});
	
});
</script>
</head>
<body>


<div id="layerWrap">

<div class="inputWrap">
		
	<div class="inputBody">
		<div class="title">사용 후기</div>
		<p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;"><img src="user/images/btn/btn_input_close.gif" alt="닫기" /></a></p>

		<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<div class="productTab normaltab reviewtab">
						<ul>
							<li><a href="javascript:;" onclick="return false;" class="on" id="photoReview">포토 구매후기</a></li>
							<li class="last"><a href="javascript:;" onclick="return false;" id="normalReview">일반 구매후기</a></li>
						</ul>						
					</div>
					<script type="text/javascript">
						$(function(){$(".productTab ul li a:eq(0)").click();});
					</script>

					<!-- detail content -->
					<div class="checkDivTab">
					
						<!-- photo review -->
						<div class="photoReview disnone">
							<form action="my_review_insert?ol_order_num=${ ol_order_num }&ol_num=${ol_num}" name="photo_rv_insert" method="post" enctype="multipart/form-data">
								<table summary="분류, 구매여부, 작은이미지, 평가, 제목, 상세 내용 순으로 포토 구매후기를 작성 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
									<caption>포토 구매후기 작성</caption>
									<colgroup>
									<col width="19%" class="tw30" />
									<col width="*" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><span>구매상품</span></th>
											<td>
												${ p_name }
												<input type="hidden" name="p_num" value="${ p_num }"> 
											</td>
										</tr>
										<tr>
											<th scope="row"><span>작은이미지</span></th>
											<td>
												<input type="file" name="ru_img_file" class="fileType" />
												<input type="hidden" name="ru_type" value="포토">
											</td>
										</tr>
										<tr>
											<th scope="row"><span>평가</span></th>
											<td>
												<ul class="pta">
													<li>
														<input type="radio" name="ru_score" id="starFive" value="5" checked="checked"/>
														<label for="starFive" class="star">
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
														</label>
													</li>
		
													<li>
														<input type="radio" name="ru_score" id="starFour" value="4"/>
														<label for="starFour" class="star">
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
														</label>
													</li>
		
													<li>
														<input type="radio" name="ru_score" id="starThree" value="3"/>
														<label for="starThree" class="star">
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
														</label>
													</li>
		
													<li>
														<input type="radio" name="ru_score" id="startwo" value="2"/>
														<label for="startwo" class="star">
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
														</label>
													</li>
		
													<li>
														<input type="radio" name="ru_score" id="starOne" value="1"/>
														<label for="starOne" class="star">
															<img src="user/images/ico/ico_star.gif" alt="별점" />
														</label>
													</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row"><span>제목</span></th>
											<td>
												<input type="text" name="ru_title" class="wlong" />
											</td>
										</tr>
										<tr>
											<th scope="row"><span>상세 내용</span></th>
											<td>
												<textarea class="tta" name="ru_content"></textarea>
											</td>
										</tr>								
									</tbody>
								</table>
								
								<!-- Btn Area -->
								<div class="btnArea">
									<div class="bCenter">
										<ul>																
											<li><a href="#" class="nbtnbig">취소</a></li>
											<li><a href="#" class="sbtnMini photo_btn">확인</a></li>
										</ul>
									</div>
								</div>
								<!-- //Btn Area -->
								
							</form>
						</div>
						<!-- //photo review -->
						
						<!-- normal review -->
						<div class="normalReview disnone">
							<form action="my_review_insert?ol_order_num=${ ol_order_num }&ol_num=${ol_num}" name="normal_rv_insert">
								<table summary="분류, 구매여부, 작은이미지, 평가, 제목, 상세 내용 순으로 포토 구매후기를 작성 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
									<caption>일반 구매후기 작성</caption>
									<colgroup>
									<col width="19%" class="tw30" />
									<col width="*" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><span>구매상품</span></th>
											<td>${ p_name }</td>
										</tr>
										<tr>
											<th scope="row"><span>평가</span></th>
											<td>
												<ul class="pta">
													<li>
														<input type="radio" name="ru_score" id="starFive" value="5" checked="checked"/>
														<label for="starFive" class="star">
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
														</label>
													</li>
		
													<li>
														<input type="radio" name="ru_score" id="starFour" value="4" />
														<label for="starFour" class="star">
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
														</label>
													</li>
		
													<li>
														<input type="radio" name="ru_score" id="starThree" value="3" />
														<label for="starThree" class="star">
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
														</label>
													</li>
		
													<li>
														<input type="radio" name="ru_score" id="startwo" value="2" />
														<label for="startwo" class="star">
															<img src="user/images/ico/ico_star.gif" alt="별점" />
															<img src="user/images/ico/ico_star.gif" alt="별점" />
														</label>
													</li>
		
													<li>
														<input type="radio" name="ru_score" id="starOne" value="1"/>
														<label for="starOne" class="star">
															<img src="user/images/ico/ico_star.gif" alt="별점" />
														</label>
													</li>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row"><span>제목</span></th>
											<td>
												<input type="text" class="wlong" name="ru_title"/>
											</td>
										</tr>
										<tr>
											<th scope="row"><span>상세 내용</span></th>
											<td>
												<textarea class="tta" name="ru_content"></textarea>
												<input type="hidden" name="ru_type" value="일반">
											</td>
										</tr>								
									</tbody>
								</table>
							<!-- Btn Area -->
								<div class="btnArea">
									<div class="bCenter">
										<ul>																
											<li><a href="#" class="nbtnbig">취소</a></li>
											<li><a href="#" class="sbtnMini normal_btn">확인</a></li>
										</ul>
									</div>
								</div>
							<!-- //Btn Area -->
							</form>
							
							
						</div>
						<!-- //normal review -->
						
					</div>
					<!-- //detail contents -->

				</div>
			</div>
			<!-- //contents -->
		
        
	</div>

</div>


</div>




</body>
</html>