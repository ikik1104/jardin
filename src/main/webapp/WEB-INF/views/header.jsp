<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<script type="text/javascript" src="user/js/common.js"></script>
  <!-- 헤더 -->  
    <div id="header">
		
		<div id="snbBox">
			<h1><img src="user/images/txt/logo.gif" alt="JARDIN SHOP" /></h1>
			<div id="quickmenu">
				<div id="mnaviOpen"><img src="user/images/btn/btn_mnavi.gif" width="33" height="31" alt="메뉴열기" /></div>
				<div id="mnaviClose"><img src="user/images/btn/btn_mnavi_close.gif" width="44" height="43" alt="메뉴닫기" /></div>
				<ul>
					<li><a href="event">EVENT</a></li>
					<li><a href="notice_Ulist">CUSTOMER</a></li>
					<li><a href="review_list?ru_type=일반">COMMUNITY</a></li>
				</ul>
			</div>
			<div id="snb">
				<ul>
					<c:if test="${userID==null }"><!-- 회원 로그인 안 되어 있을 때 -->
						<li><a href="login"  style="cursor:pointer;">LOGIN</a></li>
					</c:if>
					<c:if test="${userID!=null }"><!-- 회원 로그인 되어 있을 때 -->
						<li><a onclick="user_logout()" style="cursor:pointer;">LOGOUT</a></li>						
					</c:if>
					<li><a href="#">JOIN</a></li>
					<li><a href="#">MY PAGE</a></li>
					<li><a href="#">CART</a></li>
				</ul>
				<form action="main_search" method="get" name="search">
					<div id="search">
						<input type="text" class="searchType" name="keyword" />
						<input type="image" src="user/images/btn/btn_main_search.gif" width="23" height="20" alt="검색하기" />
					</div>
				</form>
			</div>
		</div>
	</div>
    
<!-- GNB -->
	<div id="gnb">
		
		<div id="top">
			<ul>
				<li class="brand t1"><a href="#" id="topNavi1">JARDIN’s BRAND</a>
				</li>
				<li class="t2"><a href="u_product_list?p_step1=원두" id="topNavi2">원두</a>
					<ul id="topSubm2">
						<li><a href="u_product_list?p_step1=원두&p_step2=클래스">클래스</a></li>
						<li><a href="u_product_list?p_step1=원두&p_step2=바리스타">바리스타</a></li>
						<li><a href="u_product_list?p_step1=원두&p_step2=마스터즈">마스터즈</a></li>
						<li><a href="u_product_list?p_step1=원두&p_step2=쟈뎅">쟈뎅</a></li>
					</ul>
				</li>
				<li class="t1"><a href="u_product_list?p_step1=인스턴트 커피" id="topNavi3">인스턴트커피</a>
					<ul id="topSubm3">
						<li><a href="u_product_list?p_step1=인스턴트 커피&p_step2=카페모리">카페모리</a></li>
						<li><a href="u_product_list?p_step1=인스턴트 커피&p_step2=에스프레소 스틱">에스프레소 스틱</a></li>
					</ul>
				</li>
				<li class="t2"><a href="u_product_list?p_step1=차" id="topNavi4">차</a>
					<ul id="topSubm4">
						<li><a href="u_product_list?p_step1=차&p_step2=아워티(티백)">아워티(티백)</a></li>
					</ul>
				</li>
				<li class="t1"><a href="u_product_list?p_step1=음료/커피/티"id="topNavi5">음료/커피/티</a>
					<ul id="topSubm5">
						<li><a href="u_product_list?p_step1=음료/커피/티&p_step2=시그니처">시그니처</a></li>
						<li><a href="u_product_list?p_step1=음료/커피/티&p_step2=카페리얼">카페리얼</a></li>
						<li><a href="u_product_list?p_step1=음료/커피/티&p_step2=아워티(음료)">아워티(음료)</a></li>
					</ul>
				</li>
				<li class="t2"><a href="u_product_list?p_step1=선물세트" id="topNavi6">선물세트</a>
					<ul id="topSubm6">
						<li><a href="u_product_list?p_step1=선물세트&p_step2=선물세트">선물세트</a></li>
						<li><a href="u_product_list?p_step1=선물세트&p_step2=DIY선물세트">DIY선물세트</a></li>
					</ul>
				</li>
				<li class="t1"><a href="u_product_list?p_step1=브랜드관" id="topNavi7">브랜드관</a>
					<ul id="topSubm6">
						<li><a href="u_product_list?p_step1=브랜드관&p_step2=GS">GS</a></li>
						<li><a href="u_product_list?p_step1=브랜드관&p_step2=투썸">투썸</a></li>
						<li><a href="u_product_list?p_step1=브랜드관&p_step2=드롭탑">드롭탑</a></li>
						<li><a href="u_product_list?p_step1=브랜드관&p_step2=요거프레소">요거프레소</a></li>
					</ul>
				</li>
				<li class="t2"><a href="u_product_list?p_step1=용품" id="topNavi8">용품</a>
					<ul id="topSubm6">
						<li><a href="u_product_list?p_step2=용품&p_step2=커피용품">커피용품</a></li>
					</ul>
				</li>
			</ul>
		</div>

		<script type="text/javascript">initTopMenu();</script>
	</div>
	<!-- //GNB -->