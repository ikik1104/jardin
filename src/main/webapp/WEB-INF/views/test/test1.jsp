<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html >
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
<script type="text/javascript" src="user/js/js_test1.js"></script>
<script type="text/javascript" src="user/js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="user/css/jquery.fancybox-1.3.4.css" />
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

</head>
<body>
					<th class="cut_fifteen">기존 썸네일</th>
					<td class="cut_forty"><a href="${AllDto.eventdto.e_thumb_img }" target="_blank"><p class="cut">${AllDto.eventdto.e_thumb_img }</p></a></td>
					<th class="cut_fifteen">* 썸네일 변경</th>
					<td class="cut_thirty"><p class="cut"><input type="file" name="new_thumb" id="new_thumb"></p></td>				
				</tr>				
				
				<tr>
					<th class="cut_fifteen">기존 첨부이미지</th>
					<c:if test="${ AllDto.eventdto.e_content_img==null}"><td>-</td></c:if>
					<c:if test="${ AllDto.eventdto.e_content_img!=null}">
						<td><a target="_blank" href="${AllDto.eventdto.e_content_img }"><p class="cut">${AllDto.eventdto.e_content_img }</p></a></td>
					</c:if>
					<th class="cut_fifteen">* 첨부이미지 변경</th>
					<td class="cut_thirty"><p class="cut"><input type="file" name="new_content" id="new_content" multiple="multiple" onchange="change_img()"></p></td>				
				</tr>		
				<c:if test="${AllDto.eventdto.co_num!=0 }"><!-- 기존에 쿠폰이 있을 경우 -->
				<tr>



				<tr>
					<th class="cut_fifteen">기존 시작일</th>
					<td class="cut_forty">${AllDto.utildto.str1 }</td>
					<th class="cut_fifteen">* 시작일 변경</th>
					<td class="cut_thirty"><input type="date" name="e_start_day" id="e_start_day"></td>				
				</tr>
				<tr>
					<th class="cut_fifteen">기존 종료일</th>
					<td class="cut_forty">${AllDto.utildto.str2 }</td>
					<th class="cut_fifteen">* 종료일 변경</th>
					<td class="cut_thirty"><input type="date" name="e_end_day" id="e_end_day"></td>				
				</tr>				


	<a onclick="openPreview()" id="preview_btn">내용 미리보기</a>
</body>
</html>