
//[[페이지 load되자마자 작동]]------------------------------------------------------------------------------
$(function(){
	//로그인 사용자가 이미 댓글을 달았으면 댓글창 숨김
	
	if(document.getElementById('banSign').value=='ban'){
		$('.replyWrite').hide();
		$('.replyBan').show();		
	} else {
		$('.replyBan').hide();			
	}

	//기본 숨김 세팅
	$('#modifyReply').hide();
	$('#originalReply').hide();	
	$('.originalReplyOther').hide();
	


});
	//로그인 사용자 댓글 있으면 댓글 입력창 숨기라는 신호
	function banSign(){
		$( 'input#banSign' ).val( 'ban' );		
	}

//[[공통 기능]]------------------------------------------------------------------------------

	/*
	//(ajax랑 작동 안 됨)비밀번호 모달창에서 엔터 치면 폼 자동 제출
	function enterkey(){
		
		var key = event.keyCode;
		
		if (key == 13) {
			submitCheck();
		} 
	}
*/
	
	//쿠폰 다운로드 유효성 검사
	function checkDownload(){
		
	}
	
	//쿠폰 다운로드
	function coupon_download(){
		
		
		var m_num= $('#cp_mNum').val();
		var co_num= $('#cp_coNum').val();		
		var co_expiry= $('#cp_expiry').val();		
		var co_start_day= $('#cp_startDay').val();		
		var co_end_day= $('#cp_endDay').val();	
		
		if(m_num==null || m_num==""){
			if(confirm('로그인 사용자만 이용 가능합니다. \n 로그인 페이지로 이동하시겠습니까?')){
				location.href='login?backpath=user_event_view?e_num='+ecomment_insert.e_num.value;
			} else {
				return false;
			}
		}
		
		$.ajax({
			type:'post',
			url:'coupon_download',
			dataType:'json',
			data:JSON.stringify({m_num:m_num, co_num:co_num, co_expiry:co_expiry, co_start_day:co_start_day, co_end_day:co_end_day}),
			contentType: "application/json; charset=UTF-8",
			success:function(val){
				if(val==1){//다운로드 성공 시 
					if(confirm('쿠폰을 다운로드 했습니다.  \n 확인 페이지로 이동할까요?')){
						location.href='mycoupon?m_num='+m_num;
					} else {
						
					}					 
				} else if(val!=1){//다운로드 실패 시
					alert('쿠폰을 다운로드 하지 못했습니다. 다시 시도해 주세요.');
				}
			},
			error:function(){
				alert('서버 통신 실패');
			}
		});
	}

   //다른 사람 댓글 확인창 띄우기
	function showOtherOriginal(m_num){
		   	 $('.pwReplyOther'+m_num).hide();   			        		   
		   	 $('#originalReplyOther'+m_num).show();    	
		   	 location.href='#originalReplyOther'+m_num;	
	 }
	
	//비밀번호창 띄우기
	function openPW(m_num, mode){
		$('#layerWrap').css('display','block');
		$('#backbody').css('display','block');	
		pwInputForm.m_num.value=m_num;//비밀번호 입력창에 조회하려는 댓글 회원 고유번호 주입
		pwInputForm.mode.value=mode;//myModify/myOriginal/otherOriginal
		pwInputForm.ec_pw.focus();
	}	
	
	//비밀번호 입력창 떴을 때 바깥 클릭하면 비번창 종료
	$('#backbody').click(function(){
		$('#layerWrap').css('display','none');	
		$('#backbody').css('display','none');		
	});


	//비밀번호창 닫기
	function closePW(){
		$('#layerWrap').css('display','none');	
		$('#backbody').css('display','none');	
	}
	//비밀번호 체크
	function submitCheck(){
		var mode = pwInputForm.mode.value;//myOriginal, myModify, otherOriginal
		//var e_num=ecomment_insert.e_num.value;//이벤트 고유 번호
		var m_num = pwInputForm.m_num.value;//조회하려는 사람의 회원 고유번호
		
		var ec_pw_input = pwInputForm.ec_pw.value;//사용자가 입력한 비밀번호값
		var ec_pw_trim =ec_pw_input.replace(' ', '');//공백제거

		pwInputForm.ec_pw.value=ec_pw_trim;//비밀번호 입력 form에 공백제거한 비밀번호 값 넣어주기
		//pwInputForm.e_num.value=24;//e_num;
		
		 $.ajax({
		       url: "ec_pw_check",
		       type: "POST",
		       data:  $("#pwInputForm").serialize(),
		       success : function(val){
		    	   closePW();//비밀번호 창 닫기
		           if(val ==-1 ){//otherOriginal
		        	   showOtherOriginal(m_num);		
		           } else if(val ==-2){//myOriginal
		        	   showUserOriginal();	
		           }else if(val ==-3){//myModify
		        	   showUserModify();		
		           } else if(val==0){ // 0이면 실패
		              alert("비밀번호가 일치하지 않습니다. 다시 시도해 주세요.");
		              openPW(m_num, mode);
		           }
		        },
		        error : function(){
		           alert("서버통신실패");
		        }
			  });			
	}     



//[[로그인 사용자 기능]]------------------------------------------------------------------------------

//회원 로그인 사용자 댓글 1개 삭제
	function user_del_check(ec_num){
		if(confirm("해당 댓글을 삭제하시겠습니까? \n(삭제한 데이터는 복구할 수 없으며, 이벤트 신청이 취소됩니다.)")){
			$.ajax({
                  url : "user_ecomment_delete",
                  type : "POST",
                  data: JSON.stringify(ec_num),
                  dataType : "json",
                  contentType: "application/json",
                  success : function(val){
                     if(val == 1){ //리턴값이 1이면 (=성공)
                        alert("삭제처리 완료되었습니다.");
                        location.reload();
                     }else{ // 0이면 실패
                        alert("삭제처리 실패.");
                     }
                  },
                  error: function(jqXHR, exception) {
                	  alert('서버 통신 실패');
                      if (jqXHR.status === 0) {
                          alert('Not connect.\n Verify Network.');
                      } 
                      else if (jqXHR.status == 400) {
                          alert('Server understood the request, but request content was invalid. [400]');
                      } 
                      else if (jqXHR.status == 401) {
                          alert('Unauthorized access. [401]');
                      } 
                      else if (jqXHR.status == 403) {
                          alert('Forbidden resource can not be accessed. [403]');
                      } 
                      else if (jqXHR.status == 404) {
                          alert('Requested page not found. [404]');
                      } 
                      else if (jqXHR.status == 500) {
                          alert('Internal server error. [500]');
                      } 
                      else if (jqXHR.status == 503) {
                          alert('Service unavailable. [503]');
                      } 
                      else if (exception === 'parsererror') {
                          alert('Requested JSON parse failed. [Failed]');
                      } 
                      else if (exception === 'timeout') {
                          alert('Time out error. [Timeout]');
                      } 
                      else if (exception === 'abort') {
                          alert('Ajax request aborted. [Aborted]');
                      } 
                      else {
                          alert('Uncaught Error.n' + jqXHR.responseText);
                      }
                  }
               });
         }
	}
	
//로그인 사용자 댓글 수정창 나타내기
function showUserModify(){
	$('#originalReply').hide();	
	$('#pwReply').hide();
	$('#modifyReply').show();	
	location.href='#modifyReply';
}
//로그인 사용자 댓글 확인창 나타내기
function showUserOriginal(){
	$('#modifyReply').css('display','none');
	$('#pwReply').css('display','none');
	$('#originalReply').css('display','block');
	//location.href='#forUserOriginalShow';	(왠지 작동 안 함;;)
	 var offset = $("#originalReply").offset();
      $('html, body').animate({scrollTop : offset.top}, 1);
}


//회원 로그인 사용자 댓글 수정
function submitUserModify(){
	
	//비밀번호, 내용 유효성 검사
	if(modify_ecomment.ec_pw.value=="" || modify_ecomment.ec_pw.value==null){
		alert('비밀번호를 입력하세요.');
		modify_ecomment.ec_pw.focus();
		 var offset = $("#modifyReply").offset();
	      $('html, body').animate({scrollTop : offset.top}, 1);
	      return false;
	} 
	if($('#modifyContent').val()=="" || $('#modifyContent').val()==null){
			alert('내용을 입력해 주세요.');
			$('#modifyContent').focus();		
			 var offset = $("#modifyReply").offset();
		     $('html, body').animate({scrollTop : offset.top},1);
		     return false;
	}

	
	//비밀번호, 내용 공백제거
	modify_ecomment.ec_pw.value = modify_ecomment.ec_pw.value.replace(' ', '');
	$('#modifyContent').html( $('#modifyContent').html().replace(' ',''));
	
	 $.ajax({
	       url: "modify_ecomment",
	       type: "POST",
	       data:  $("#modify_ecomment").serialize(),
	       success : function(data){
	    	   alert(data);
	           if(data ==null ){//실패
	        	  alert('댓글을 수정하지 못했습니다. 다시 시도해 주세요.');	
	           } else if(data !=null){//성공
	        	   //리로드 하지 않고 숨겨진 댓글창의 내용만 수정
	        	   alert('댓글을 수정했습니다.');
	        	    $('#originalContent').html(data);
	        	    $('#modifyContent').html(data);	     
	        	    showUserOriginal();
	           }
	        },
	        error : function(){
	           alert("서버통신실패");
	        }
		  });			
}



//로그인 사용자가 새 댓글 등록
function submitComment(){
	
	//비밀번호, 내용 공백 체크
	if($('#ec_pw_check').val()=="" || $('#ec_pw_check').val()==null){
		alert('비밀번호를 입력해 주세요.');
		ecomment_insert.ec_pw.value.focus();
		return false;
	}
	if($('#insert_ec_content').val()=="" || $('#insert_ec_content').val()==null){
		alert('내용을 입력해 주세요.');
		$('#insert_ec_content').val().focus();
		return false;
	}	
	
	
	 $.ajax({
       url: "ecomment_insert",
       type: "POST",
       data:  $("#insertform").serialize(),
       success : function(val){
           if(val ==1 ){//1이면 성공
           alert('댓글을 등록했습니다.');                      	    
           location.reload();
           }else{ // 0이면 실패
              alert("비밀번호가 일치하지 않습니다. 다시 시도해 주세요.");
           }
        },
        error : function(){
           alert("서버통신실패");
        }

	  });		
	
}

	
//[[로그아웃 사용자 기능]]------------------------------------------------------------------------------
	
    //로그인 안 했는데 댓글 등록창 누르면 로그인하라고 얘기
    function checkComment(){
	    var userID = document.getElementById('userID').value;
	  
	   	 if(userID==null || userID==""){
	   		 if(confirm('회원 로그인이 필요합니다. 로그인 페이지로 이동할까요?')){
	   			 location.href='login?backpath=user_event_view?e_num='+ecomment_insert.e_num.value;
	   		 } else {
	   			 //댓글 등록창 막아 버리기
	   				$( 'input#ec_pw_check' ).attr("readonly",true); 
	   				$( '#insert_ec_content' ).attr("readonly",true); 
	   		 }
	   	 }
    }



