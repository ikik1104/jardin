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
<script type="text/javascript" src="user/js/jquery.min.js"></script>
<script type="text/javascript" src="user/js/common.js"></script>
<script type="text/javascript">
$(function() {


	
});


function type_chk(val) {
	if(val=='포토'){
		$("#review_image").css("display", "contents");
	}else{
		$("#review_image").css("display", "none");
	}
} 

</script>
</head>
<body>
<div id="layerWrap">

<div class="inputWrap">
		
	<div class="inputBody">
		<div class="title">리뷰 작성하기</div>
		
		<p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;"><img src="user/images/btn/btn_input_close.gif" alt="닫기" /></a></p>
			
		<div class="checkDivMt">
			
		<form action="review_insert" method="post" name="inputForm">
			<table summary="분류, 구매여부, 작은이미지, 평가, 제목, 상세 내용 순으로 포토 리뷰를 작성 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
				<caption>포토 리뷰 작성</caption>
				<colgroup>
				<col width="19%" class="tw30" />
				<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th>후기 유형</th>
						<td><input type="radio" name="ru_type" value="일반" onchange="type_chk(this.value)" checked>일반 리뷰&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="포토" name="ru_type" onchange="type_chk(this.value)" >포토리뷰</td>
					</tr>
					<tr>
						<th scope="row"><span>분류</span></th>
						<td>
							<ul class="pta">
								<li>
									<select>
										<option value="">${pdto.p_step1}</option>
									</select>
								</li>
								<li class="pt5">
									<select>
										<option value="">${pdto.p_step2}</option>
									</select>
								</li>
							</ul>
						</td>
					</tr>					
					<tr id="review_image" style="display: none;">
						<th scope="row"><span>작은이미지</span></th>
						<td>
<!-- 							<input type="file" name="ru_img" class="fileType" /> -->
							<input type="text" name="ru_img" class="fileType" /> 
							<!-- 임시로 텍스트로 넣어둠 -->
						</td>
					</tr>
					<tr>
						<th scope="row"><span>평가</span></th>
						<td>
							<ul class="pta">
								<li>
									<input type="radio" name="ru_score" id="starFive" checked="checked" value="5"/>
									<label for="starFive" class="star">
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star.gif" alt="별점" />
									</label>
								</li>

								<li>
									<input type="radio" name="ru_score" id="starFour"  value="4"/>
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
									<input type="radio" name="ru_score" id="startwo" value="2" />
									<label for="startwo" class="star">
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star.gif" alt="별점" />
									</label>
								</li>

								<li>
									<input type="radio" name="ru_score" id="starOne"  value="1"/>
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
						<th scope="row"><span>내용</span></th>
						<td>
							<textarea class="tta" name="ru_content"></textarea>
						</td>
						
					</tr>		
				</tbody>
			</table>
			<input type="hidden" name="ru_score" id="star_point" value="5">
			<input type="hidden" name="m_num"  value="${m_num}">
			<input type="hidden" name="p_num"  value="${pdto.p_num}">
			</form>			
		</div>
			
		<!-- Btn Area -->
		<div class="btnArea">
			<div class="bCenter">
				<ul>								
					<li><a href="javascript:inputForm.submit();" class="sbtnMini">확인</a></li>
					<li><a onclick="parent.$.fancybox.close();" href="javascript:;" class="nbtnbig">취소</a></li>
				</ul>
			</div>
		</div>
		<!-- //Btn Area -->

	</div>

</div>


</div>
</body>
</html>