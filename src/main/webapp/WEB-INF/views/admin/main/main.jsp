<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/admin_main.css">
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/main_nav.jsp"/>
	<section>
		<h1>관리자 메인</h1>
		<div id="main_list">
			<div id="main_user_list">
				<h2>신규가입회원 5건 목록</h2>
				<div class="list_count">총회원수 2,221명 중 차단 0명, 탈퇴 : 34명</div>
				<div>
					<table border="1">
						<tr>
							<th>회원 아이디</th>
							<th>이름</th>
							<th>이메일</th>
							<th>주소</th>
							<th>휴대전화</th>
							<th>생년월일</th>
							<th>성별</th>
							<th>뉴스레터 수신여부</th>
							<th>SMS 수신여부</th>
						</tr>
						<tr>
							<td class="table_left">hh123</td>
							<td class="table_left">김홍익</td>
							<td class="table_left">hh@HH.123</td>
							<td>(123-456) 가산 제이플라츠</td>
							<td>010-3038-8146</td>
							<td>1996.11.04</td>
							<td>여성</td>
							<td>아니오</td>
							<td>예</td>
						</tr>
						<tr>
							<td class="table_left">hh123</td>
							<td class="table_left">김홍익</td>
							<td class="table_left">hh@HH.123</td>
							<td>(123-456) 가산 제이플라츠</td>
							<td>010-3038-8146</td>
							<td>1996.11.04</td>
							<td>여성</td>
							<td>아니오</td>
							<td>예</td>
						</tr>
						<tr>
							<td class="table_left">hh123</td>
							<td class="table_left">김홍익</td>
							<td class="table_left">hh@HH.123</td>
							<td>(123-456) 가산 제이플라츠</td>
							<td>010-3038-8146</td>
							<td>1996.11.04</td>
							<td>여성</td>
							<td>아니오</td>
							<td>예</td>
						</tr>
						<tr>
							<td class="table_left">hh123</td>
							<td class="table_left">김홍익</td>
							<td class="table_left">hh@HH.123</td>
							<td>(123-456) 가산 제이플라츠</td>
							<td>010-3038-8146</td>
							<td>1996.11.04</td>
							<td>여성</td>
							<td>아니오</td>
							<td>예</td>
						</tr>
						<tr>
							<td class="table_left">hh123</td>
							<td class="table_left">김홍익</td>
							<td class="table_left">hh@HH.123</td>
							<td>(123-456) 가산 제이플라츠</td>
							<td>010-3038-8146</td>
							<td>1996.11.04</td>
							<td>여성</td>
							<td>아니오</td>	
							<td>예</td>
						</tr>
					</table>
					<div class="detail_btn">
						<a href="#">회원 전체보기</a>
					</div>
				</div>
			</div>
			<div id="main_notice_list">
				<h2>최근게시물</h2>
				<div>
					<table border="1">
						<tr>
							<th>그룹</th>
							<th>게시판</th>
							<th>제목</th>
							<th>이름</th>
							<th>일시</th>
						</tr>
						<tr>
							<td>쇼핑몰</td>
							<td>자유게시판</td>
							<td>안녕하세요</td>
							<td>김홍익</td>
							<td>2020.03.19</td>
						</tr>
						<tr>
							<td>쇼핑몰</td>
							<td>자유게시판</td>
							<td>안녕하세요</td>
							<td>김홍익</td>
							<td>2020.03.19</td>
						</tr>
						<tr>
							<td>쇼핑몰</td>
							<td>자유게시판</td>
							<td>안녕하세요</td>
							<td>김홍익</td>
							<td>2020.03.19</td>
						</tr>
						<tr>
							<td>쇼핑몰</td>
							<td>자유게시판</td>
							<td>안녕하세요</td>
							<td>김홍익</td>
							<td>2020.03.19</td>
						</tr>
						<tr>
							<td>쇼핑몰</td>
							<td>자유게시판</td>
							<td>안녕하세요</td>
							<td>김홍익</td>
							<td>2020.03.19</td>
						</tr>
					</table>
					<div class="detail_btn">
						<a href="#">최근게시물 전체보기</a>
					</div>
				</div>
			</div>
			<div id="main_event_list">
				<h2>신규가입회원 5건 목록</h2>
				<div class="list_count">전체 8,772 건 중 5건 목록</div>
				<div>
					<table border="1">
						<tr>
							<th>회원 아이디</th>
							<th>이름</th>
							<th>일시</th>
							<th>포인트내용</th>
							<th>적립포인트</th>
							<th>누적포인트</th>
						</tr>
						<tr>
							<td class="table_left">hh123</td>
							<td class="table_left">김홍익</td>
							<td>2020.03.18</td>
							<td>자유게시판 2324 글쓰기</td>
							<td>100</td>
							<td>800</td>
						</tr>
						<tr>
							<td class="table_left">hh123</td>
							<td class="table_left">김홍익</td>
							<td>2020.03.18</td>
							<td>자유게시판 2324 글쓰기</td>
							<td>100</td>
							<td>800</td>
						</tr>
						<tr>
							<td class="table_left">hh123</td>
							<td class="table_left">김홍익</td>
							<td>2020.03.18</td>
							<td>자유게시판 2324 글쓰기</td>
							<td>100</td>
							<td>800</td>
						</tr>
						<tr>
							<td class="table_left">hh123</td>
							<td class="table_left">김홍익</td>
							<td>2020.03.18</td>
							<td>자유게시판 2324 글쓰기</td>
							<td>100</td>
							<td>800</td>
						</tr>
						<tr>
							<td class="table_left">hh123</td>
							<td class="table_left">김홍익</td>
							<td>2020.03.18</td>
							<td>자유게시판 2324 글쓰기</td>
							<td>100</td>
							<td>800</td>
						</tr>
					</table>
					<div class="detail_btn">
						<a href="#">포인트내역 전체보기</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	</body>
</html>