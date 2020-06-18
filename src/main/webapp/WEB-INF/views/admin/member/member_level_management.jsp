<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<jsp:useBean id="sysdate" class="java.util.Date"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 등급 관리</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		<script type="text/javascript" src="admin/js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="admin/js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="admin/js/prefixfree.dynamic-dom.min.js"></script>
		<style type="text/css">
			
			#search_form table{
				text-align: left;
				margin-bottom: 50px;
			}
			
			#search_form table tr:NTH-LAST-CHILD(1){
				text-align: center;
			}
			
			#event_list img{
				width: 400px;
				height: 250px;
			}
			#search_date td button{
				border: 1px solid black;
				padding: 4px;
			}
		</style>
		<script type="text/javascript">

	//회원등급 수정 시 뜨는 메시지
	window.onload=function(){
		${alerttext}
	}
	//체크박스 전체 선택/해제
	$(document).ready(function(){
		$("#check_all").click(function(){
			
			if($("input:checkbox[id='check_all']").is(":checked")==true){
				$("input:checkbox[name='chk_ids']").prop("checked", true);
			}else{
				$("input:checkbox[name='chk_ids']").prop("checked", false);
			}
			
		});
		
	});

	//등급 삭제 체크
	function del_check(lv_num){
		if(confirm("해당 등급을 삭제 하시겠습니까? \n(삭제한 데이터는 복구할 수 없습니다.)")){
            $.ajax({
                  url : "level_delete",
                  method : "POST",
                  data: JSON.stringify(lv_num),
                  dataType : "json",
                  contentType: "application/json",
                  success : function(val){
                     if(val == 1){ //리턴값이 1이면 (=성공)
                        alert("삭제를 완료했습니다.");
                        location.href='member_level_management'; //페이지 새로고침
                     }else{ // 0이면 실패
                        alert("삭제 실패.");
                     }
                  },
                  error : function(){
                     alert("서버통신실패");
                  }
               });
         }
	}		

</script>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>회원 등급 관리</h1>
		<div id="main_list">
			<div id="main_user_list">
				<h2>회원 등급 검색</h2>
				<div class="list_count">임시로 놔두기(총 게시물 수 등등 표시?)</div>
				<div>
					<button onclick="location.href='level_write'">새 등급 추가</button>
				</div>
			
				<div>
				
					<table border="1" id="event_list">
						<tr>
							<th><input type="checkbox" id="check_all" ></th>
							<th>등급순서</th>
							<th>등급명</th>
							<th>회원수</th>
							<th>등급 분류 기준</th><!-- orderlistdto -->						
							<th>등급 분류 금액</th>
							<th>등급혜택</th>
							<th>등록일</th>	
							<th>수정/삭제</th>
						</tr>
						<c:forEach var="level_list" items="${level_list }">
						<tr>
							<td><input type="checkbox"  name="chk_ids" value="${level_list.leveldto.lv_num  }"></td>
							<td>${level_list.leveldto.lv_order }</td>
							<td>
								<a href="level_view?lv_num=${level_list.leveldto.lv_num }">
									${level_list.leveldto.lv_name }
								</a>
							</td>
							<td>${level_list.utildto.temp_int }</td>
							<td>${level_list.leveldto.lv_des }</td>
							<td>${level_list.leveldto.lv_sort_money }</td>
							<td>${level_list.leveldto.lv_benefit }</td>		
							<td>${level_list.leveldto.lv_date }</td>	
							<td>
								<button type="button" onclick="location.href='level_view?lv_num=${level_list.leveldto.lv_num}'">
									수정
								</button>
								<button type="button" onclick="del_check(${level_list.leveldto.lv_num})">삭제</button>
							</td>							
						</tr>
						</c:forEach>
					</table>
					
					<div>				
						<button>선택 삭제</button>
					</div>
				
				</div>
			</div>
				</div>
	</section>
	</body>
</html>