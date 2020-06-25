<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이벤트 조회/수정</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="se2/admin/js/HuskyEZCreator.js" charset="utf-8"></script> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <!-- css, 기능 수정 -->
 		<link rel="stylesheet" type="text/css" href="admin/css/admin_view.css">	 
        <script type="text/javascript" src="admin/js/admin_board.js"></script>
		<link rel="stylesheet" type="text/css" href="admin/css/list_button.css">          			
		<script type="text/javascript" src="user/js/event_view.js"></script>
		
		<!-- 페이지 로딩시 초기화 --> 
		<script>
	
		$(document).ready(function(){
				nhn.husky.EZCreator.createInIFrame({ 
					oAppRef: editor, 
					elPlaceHolder: 'txtContent', 
					sSkinURI: '/plugin/smarteditor2/SmartEditor2Skin.html', 
					fCreator: 'createSEditor2' 
					}); 
				}); 

		function date_chk2(){
			var start = inputform.e_start_day.value;
			var end = inputform.e_end_day.value;
			
			var date1 = new Date();
			var start_date = new Date(start);
			var end_date = new Date(end);
			if(end_date.getTime()<date1.getTime()){
				alert("종료일은 오늘 날짜 이후 or 시작일 이후의 날짜를 선택해주세요.");
				inputform.e_end_day.value ="";
				return false;
			}
			if(end_date.getTime()<start_date.getTime()){
				alert("시작일 이후의 날짜를 선택해주세요.");
				inputform.e_end_day.value ="";
				return false;
			}
		}
		
		function search() {
			//ajax 구현 해서 바로 검색결과 띄워주기
			
		}
		
		//구현 끝~! ㅋㅋ
		function search_date(val){
			var start = document.getElementById("e_start_day");
			var end = document.getElementById("e_end_day");
			
			var today = new Date();
			var date = new Date();
			
			if(val == "today"){
				start.valueAsDate = today;
				end.valueAsDate = today;
			}else if(val == "all"){
				start.valueAsDate = null;
				end.valueAsDate = null;
			}else if(val == "7day"){
				var weekDate = today.getTime() - (7 * 24 * 60 * 60 * 1000);
				date.setTime(weekDate);				
				start.valueAsDate = date;
				end.valueAsDate = today;
			}else if(val == "15day"){
				var weekDate = today.getTime() - (15 * 24 * 60 * 60 * 1000);
				date.setTime(weekDate);				
				start.valueAsDate = date;
				end.valueAsDate = today;
			}else if(val == "1month"){
				date.setMonth(date.getMonth() - 1);
				start.valueAsDate = date;
				end.valueAsDate = today;
			}else if(val == "3month"){
				date.setMonth(date.getMonth() - 3);
				start.valueAsDate = date;
				end.valueAsDate = today;
			}
			
			
		}

		//이벤트글을 등록/수정하면 다시 이 페이지로 돌아와 alert을 띄움
		window.onload=function(){
			${alerttext}
		}
		

		
		</script>
		<style type="text/css">
			#input_form{
			margin: 20px;	
			}
			table {
				 min-width: 1000px; 
			}
			table tr td:NTH-OF-TYPE(1) {
				width: 100px;
				height: 30px;
			}
			#btn_div{
			 text-align: center;
			}
			table th{
				width:15%;
			}
			.bold_tr{
				font-weight:bold;
			}
			.comment_part{
				background:white; border-top:none; padding:10px 0; padding-left:10px;
			}
			#comment_btn_area{
				border-bottom:none; 
			}
			.cut{
			width:320px; overflow:hidden; text-overflow:ellipsis;
			white-space:nowrap;
			}			
			.cut_forty{
			width:270px;
			}
			.cut_fifteen{
			width:140px; 
			}
			.cut_thirty{
			width:270px;
			}
			#layerWrap, #none_layerWrap {/*.modal*/
        	margin:auto auto;
            display: none; /* Hidden by default */
            position: fixed; 
            z-index: 2; /* Sit on top */
            left: 500px;
            top: 100px;
            width: 800px; /* Full width 100%*/
            height: 800px; /* Full height 100%*/
            overflow: scroll; /* Enable scroll if needed */
            background-color: white;
            padding-bottom:100px;
            padding-top:10px;
        }    
		#backbody{
			display:none;
			width:100%; height:100%;
			position:fixed;
            z-index: 1; /* Sit on top */		
             background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */           
		}
		
		</style>
	
	</head>
		<!-- 모달창 띄울 때 화면 어둡게 하는 효과 -->
	<div  id="backbody" onclick="closePreview()"></div>
	<!-- 이미지 있는 미리보기 창 -->
	<div id="layerWrap">
	</div>	
	<!-- 이미지 없는 미리보기 창 -->
	<div id="none_layerWrap">
	</div>		
	
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section style="padding-bottom:300px;">
	<!-- 미리보기 창 띄울 때 필요한 값 -->
	<input type="hidden" value="${AllDto.eventdto.e_thumb_img }" id="original_thumb_forPreview">
	<input type="hidden" value="${AllDto.eventdto.e_content_img }" id="original_content_forPreview">	
	<input  type="hidden" id="origin_start" value="${AllDto.utildto.str1 }">
	<input  type="hidden" id="origin_end" value="${AllDto.utildto.str2 }">	

		<h1>이벤트 조회/수정 </h1>
	<form runat="server" action="event_modify" name="inputform" method="post"  enctype="multipart/form-data" >		
		<!-- 수정하지 않은 항목에 넣어줄 값들 -->
		<input type="hidden" name="start" value=${AllDto.utildto.str1 }>
		<input type="hidden" name="end" value=${AllDto.utildto.str2 }>
		<input type="hidden" name="win" value=${AllDto.utildto.str3 }>		
		<input type="hidden" name="coupon" value=${AllDto.eventdto.co_num }>		
		<input type="hidden" name="title" value=${AllDto.eventdto.e_title }>		
		<input type="hidden" name="content" value=${AllDto.eventdto.e_content }>		
		<input type="hidden" name="original_thumb" value=${AllDto.eventdto.e_thumb_img }>		
		<input type="hidden" name="original_content" value=${AllDto.eventdto.e_content_img }>	

		<div  id="input_form">
			<h1>게시글 조회/수정  <span style="font-size:15px; font-weight:normal;"> * 표시 : 수정 가능 항목</h1>
			<table border="1" style="margin-top:10px; width:1000px; margin-bottom:10px; font-size:15px;">
				<tr>
					<th class="cut_fifteen">번호</th>
					<td class="cut_forty">${AllDto.eventdto.e_num }</td>
					<th class="cut_fifteen">작성자</th>
					<td class="cut_thirty">${AllDto.admindto.ad_grade }(${AllDto.admindto.ad_id })</td>
				</tr>
				<tr>
					<th class="cut_fifteen">등록일</th>
					<td colspan="3">${AllDto.utildto.str5 }</td>
				</tr>							
				<tr>
					<th  class="cut_fifteen">* 제목</th>
					<td colspan="3"><textarea id="e_title" name="e_title" style="border:none; background:inherit; height:40; font-size:15px; padding:3px 0;">${AllDto.eventdto.e_title }</textarea></td>
				</tr>

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
				<tr>
					<th class="cut_fifteen">기존 당첨자 발표일</th>
					<td class="cut_forty">${AllDto.utildto.str3 }</td>
					<th class="cut_fifteen">* 발표일 변경</th>
					<td class="cut_thirty"><input type="date" name="e_win_day"></td>				
				</tr>				
				<tr>
					<th class="cut_fifteen">진행 상태</th>
					<td colspan="3">${AllDto.utildto.str4 }</td>				
				</tr>					
				<tr>
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
					<th class="cut_fifteen">쿠폰번호</th>
					<td class="cut_forty">${AllDto.eventdto.co_num }</td>
					<th class="cut_fifteen">쿠폰명</th>
					<td class="cut_thirty"><p class="cut">${AllDto.coupondto.co_name }</p></td>				
				</tr>		
				<tr>
					<th class="cut_fifteen">* 쿠폰 변경</th><!-- 여기 쿠폰 가져오기 -->
					<td colspan="3">
							<select name="co_num"> <!-- model에 쿠폰 리스트 같이 보내서 ${coupon.name} , ${coupon.seq}사용 -->
								<option value="0">쿠폰없음</option>
								<c:forEach var="coupondtos" items="${CouponDtos }">
									<option value="${coupondtos.coupondto.co_num}">${coupondtos.coupondto.co_name}</option>
								</c:forEach>
							</select>		
					</td>			
				</tr>							
				</c:if>			
				<c:if test="${AllDto.eventdto.co_num==0 }"><!-- 기존에 쿠폰이 없을 경우 -->
				<tr>
					<th class="cut_fifteen">쿠폰번호</th>
					<td class="cut_forty">-</td>
					<th class="cut_fifteen">쿠폰명</th>
					<td class="cut_thirty">-</td>				
				</tr>		
				<tr>
					<th class="cut_fifteen">* 쿠폰 등록</th><!-- 여기 쿠폰 가져오기 -->
					<td colspan="3">
							<select name="co_num"> <!-- model에 쿠폰 리스트 같이 보내서 ${coupon.name} , ${coupon.seq}사용 -->
								<option value="0">쿠폰없음</option>
								<c:forEach var="coupondtos" items="${CouponDtos }">
									<option value="${coupondtos.coupondto.co_num}">${coupondtos.coupondto.co_name}</option>
								</c:forEach>
							</select>			
					</td>			
				</tr>							
				</c:if>							
				<tr>
					<td colspan="4">
						<!-- 텍스트에디터로 변경?★★★★★★★★★ -->
						<textarea wrap="hard" name="e_content" id="smartEditor" style="width:100%; height: 412px;" onkeyup="change_img()">
${AllDto.eventdto.e_content }</textarea>								
					</td>
				</tr>
			</table>
			<input type="hidden" value=${AllDto.eventdto.e_num } name="e_num">
			<div class="detail_btn" style="width:1000px;">
				<a onclick="openPreview()" id="preview_btn">내용 미리보기</a>				
				<a onclick="location.href='event_list'">목록</a>				
				<a onclick="event_modify()">수정</a>				
				<a  onclick="event_view_del_check(${AllDto.eventdto.e_num })">삭제</a>														
			</div>					
		</div>
		
		
	</form>
		
		<div style="margin-left:20px;">
			<h1>신청자 댓글</h1>	
			<div class="detail_btn" style="width:1000px; text-align:left; margin-bottom:10px;">
				<a onclick="location.href='event_applicants'" >전체 신청자 리스트</a>																	
			</div>		
				<table border="1" style="margin-top:10px; width:1000px; margin-bottom:10px; font-size:15px;" id="comment_table">
						<c:if test="${ECDtos.size() == 0 }">
							<tr>
								<td>신청자 댓글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${ECDtos.size() != 0 }">
							<c:forEach var="ecdtos" items="${ECDtos }">
								<tr class="bold_tr">
									<td style="background:#d6dce7; padding-top:10px;" > ${ecdtos.memberdto.m_id }  [등록일 : ${ ecdtos.utildto.str1} / 비밀번호 : ${ecdtos.e_commentdto.ec_pw }]
									<button style="float:right; margin-right:20px;" type="button" onclick="comment_del_check(${ecdtos.e_commentdto.ec_num})">삭제</button>							
									</td>						
								</tr>			
								<tr >
									<td style="background:white;"  class="comment_part" id="comment_btn_area">${ecdtos.e_commentdto.ec_content }</td>		
								</tr>	
							</c:forEach>
						</c:if>					
				</table>	
		</div>			
			
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
