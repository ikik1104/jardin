<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 조회/수정</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">			
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="se2/admin/js/HuskyEZCreator.js" charset="utf-8"></script> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="admin/js/admin_board.js"></script>	
        <!-- css, 기능 수정 -->
 		<link rel="stylesheet" type="text/css" href="admin/css/admin_view.css">	   
		<link rel="stylesheet" type="text/css" href="admin/css/list_button.css">   
		<link rel="stylesheet" type="text/css" href="admin/css/a_setting.css">			 		    	
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
		
		//공지글 삭제 체크 
		function del_check(no_num){
			if(confirm("해당 게시글을 삭제하시겠습니까? (삭제한 데이터는 복구할 수 없습니다.)")){
	            $.ajax({
	                  url : "notice_delete",
	                  method : "POST",
	                  data: JSON.stringify(no_num),
	                  dataType : "json",
	                  contentType: "application/json",
	                  success : function(val){
	                     if(val == 1){ //리턴값이 1이면 (=성공)
	                        alert("삭제처리 완료되었습니다.");
	                     	location.href="notice_list";
	                     }else{ // 0이면 실패
	                        alert("삭제처리 실패.");
	                     }
	                  },
	                  error : function(){
	                     alert("서버통신실패");
	                  }
	               });
	         }
		}	
		window.onload=function(){
			$('#byte_alert').hide();		
			
			 var str = $('.modify_textarea').val();
			 var len=0;
			 
			 if(str!=undefined && str!=null && str!=''){
			 for (var i = 0; i < str.length; i++) {
			        if (escape(str.charAt(i)).length == 6) {
			            len+=2;
			        }
			        len++;
			    }
			 }
			 
			$('#present_byte').html(len);
			
			$('#byte_alert2').hide();		
			
			
			 var str2 = $('.modify_textarea2').val();
			 var len2=0;
			 
			 if(str2!=undefined && str2!=null && str2!=''){
			 for (var i = 0; i < str2.length; i++) {
			        if (escape(str2.charAt(i)).length == 6) {
			            len2+=2;
			        }
			        len2++;
			    }
			 }
			$('#present_byte2').html(len2);	
			
		};		
		
		function resize(obj) {
			  
			  var str = $('.modify_textarea').val();
			    var len = 0;
			    for (var i = 0; i < str.length; i++) {
			        if (escape(str.charAt(i)).length == 6) {
			            len+=2;
			        }
			        len++;
			    }
			     if(len>85){
			    	$('#byte_alert').show();
			    	$('#byte_excess').val('on');
			     } else {
			    	 $('#byte_alert').hide();
			    	 $('#byte_excess').val('off');
			     }
			     
			  	$('#present_byte').html(len);
			  
			}
		function resize2(obj) {
			  
			  var str = $('.modify_textarea2').val();
			    var len = 0;
			    for (var i = 0; i < str.length; i++) {
			        if (escape(str.charAt(i)).length == 6) {
			            len+=2;
			        }
			        len++;
			    }
			     if(len>4000){
			    	$('#byte_alert2').show();
			    	$('#byte_excess2').val('on');
			     } else {
			    	 $('#byte_alert2').hide();
			    	 $('#byte_excess2').val('off');
			     }
			     
			  	$('#present_byte2').html(len);
			  
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
			.modify_textarea{
				overflow:hidden;
			}
			.byte_area, .byte_area2{
				text-align:right; padding-right:10px;
			}
			#byte_alert, #byte_alert2{
				color:red;
			}	
		</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1 class="notice_title">공지사항 조회/수정</h1>
			<form action="notice_modify" name="inputform" method="post" id="notice_modify">
				<div id="input_form">
					<h1>공지사항 조회/수정  <span style="font-size:15px; font-weight:normal;"> * 표시 : 수정 가능 항목</span></h1>
					<table border="1" id="notice_content">
						<tr>
							<th class="notice_th">작성자</th>
							<td>${AllDto2.admindto.ad_grade }(${AllDto2.admindto.ad_id })</td>
						</tr>
						<tr>
							<th class="notice_th">조회수</th>
							<td>${AllDto2.noticedto.no_hit }</td>
						</tr>					
						<tr>
							<th class="notice_th">등록일</th>
							<td>${AllDto2.utildto.str1 }</td>
						</tr>								
						<tr >
							<th class="notice_th"  >제목 *</th>
							<td >
							<textarea  id="notice_modify_title" class="modify_textarea" onkeyup="resize(this)" name="no_title" maxlength="85" style="overflow:hidden;margin:0; padding-top:10px; height:33px;">${AllDto2.noticedto.no_title }</textarea>
							<p class="byte_area"><span id="byte_alert">※최대 입력 글자 수를 초과했습니다. </span><span id="present_byte"></span> /85 byte</p>
							<input type="hidden" id="byte_excess" name="byte_excess">
							</td>
						</tr>									
						<tr>
							<th class="notice_th">내용 *</th>
							<td>
								<!-- 텍스트에디터로 변경?★★★★★★★★★ -->
								<textarea   class="modify_textarea2" onkeyup="resize2(this)" wrap="hard" name="no_content" id="smartEditor" style="width:100%; height: 412px;">
${AllDto2.noticedto.no_content }</textarea>	
								<p class="byte_area2"><span id="byte_alert2">※최대 입력 글자 수를 초과했습니다. </span><span id="present_byte2"></span> /4000 byte</p>							
								<input type="hidden" id="byte_excess2" name="byte_excess2">
							</td>
						</tr>
					</table>
					<input type="hidden" value=${AllDto2.noticedto.no_num } name="no_num">
					<input type="hidden" value="${UtilDto.getPage() }" id="page">
					
					<div class="detail_btn" style="width:1000px;">
						<a onclick="location.href='notice_list'">목록</a>				
						<a onclick="notice_modify()">수정</a>								
						<a onclick="del_check(${AllDto2.noticedto.no_num })">삭제</a>								
					</div>
					
				</div>
			</form>
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
