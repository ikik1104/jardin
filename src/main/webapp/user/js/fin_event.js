
//[[페이지 load되자마자 작동]]------------------------------------------------------------------------------
$(function(){

	//기본 숨김 세팅
	$('#originalReply').hide();	
	$('.originalReplyOther').hide();

});

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
		if(confirm("해당 댓글을 삭제하시겠습니까? \n(삭제한 데이터는 복구할 수 없습니다.)")){
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
	
//로그인 사용자 댓글 확인창 나타내기
function showUserOriginal(){
	$('#modifyReply').css('display','none');
	$('#pwReply').css('display','none');
	$('#originalReply').css('display','block');
	//location.href='#forUserOriginalShow';	(왠지 작동 안 함;;)
	 var offset = $("#originalReply").offset();
      $('html, body').animate({scrollTop : offset.top}, 1);
}


