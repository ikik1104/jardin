<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<form action="ecomment_insert" method="post" name="ecomment_insert" id="insertform">
					<input type="hidden" value="${event_info.eventdto.e_num } " name="e_num" id="e_num">
					<input type="hidden" value="${userNum } " name="userNum" id="userNum">	
					<div class="replyWrite">
						<ul>
							<li class="in">
								<p class="txt">총 <span class="orange">${event_info.utildto.str4 }</span> 개의 댓글이 달려있습니다.</p>
								<p class="password">비밀번호&nbsp;&nbsp;<input type="password" class="replynum" name="ec_pw" id="ec_pw_check" onclick="checkComment()"/></p>
								<textarea class="replyType" name="ec_content" id="ec_content" onclick="checkComment()"></textarea>
							</li>
							<li class="btn"><a class="replyBtn" >등록</a></li>
						</ul>
						<p class="ntic">※ 댓글을 등록하시면 자동으로 이벤트 신청이 완료됩니다.</p>
					</div>
		</form>







</body>
</html>
