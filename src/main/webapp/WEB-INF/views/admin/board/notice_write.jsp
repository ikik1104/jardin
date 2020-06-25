<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 새 글 등록</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin_main.css">
		
		<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
		<script type="text/javascript" src="se2/admin/js/HuskyEZCreator.js" charset="utf-8"></script> 
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<!-- css. 기능 수정 -->
		<link rel="stylesheet" type="text/css" href="admin/css/admin_view.css">	
		<link rel="stylesheet" type="text/css" href="admin/css/a_setting.css">	
        <script type="text/javascript" src="admin/js/admin_board.js"></script>		
				
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
		
		//공지글을 등록/수정하면 다시 이 페이지로 돌아와 alert을 띄움
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
			#byte_alert, #byte_alert2{
				color:red;
			}			
			.byte_area, .byte_area2{
				text-align:right; padding-right:10px;
			}
		</style>
	</head>
	<body>
	<jsp:include page="../nav/admin_header.jsp"/>
	<jsp:include page="../nav/board_nav.jsp"/>
	<section>
		<h1>공지사항 등록</h1>
			<form action="notice_insert" name="inputform" method="post" id="notice_insert" >
				<div id="input_form">
					<h1>공지사항 작성</h1>
					<table border="1" style="margin-top:10px; width:1000px;">
						<tr>
							<th class="notice_th">작성자</th>
							<td>${adminGrade }(${adminId })</td>
						</tr>
						<tr>
							<th class="notice_th">제목</th>
							<td><input id="notice_content" maxlength="85" class="modify_textarea" onkeyup="resize(this)" type="text" name="str2" style="border:none; background:inherit; height:40; font-size:15px; padding:3px 0; width:800px;">
							<p class="byte_area"><span id="byte_alert">※최대 입력 글자 수를 초과했습니다. </span><span id="present_byte"></span> /85 byte</p>
							<input type="hidden" id="byte_excess" name="byte_excess">
							</td>
						</tr>									
						<tr>
							<th class="notice_th">내용</th>
							<td>
								<!-- 텍스트에디터로 변경?★★★★★★★★★ -->
								<textarea class="modify_textarea2" onkeyup="resize2(this)" name="str3" id="smartEditor" style="width:100%; height: 412px;"></textarea>
							<p class="byte_area2"><span id="byte_alert2">※최대 입력 글자 수를 초과했습니다. </span><span id="present_byte2"></span> /4000 byte</p>
							<input type="hidden" id="byte_excess2" name="byte_excess2">
							</td>
						</tr>
					</table>
					
					<div class="detail_btn" style="width:1000px;">
						<a onclick="location.href='notice_list'">목록</a>				
						<a onclick="notice_insert()">등록</a>														
					</div>					
					
					<input type="hidden" value="${adminNum }" name="str1">					
				</div>
			</form>
	</section>
	</body>
</html>
<script type="text/javascript" src = "admin/js/notice_write.js"></script>
