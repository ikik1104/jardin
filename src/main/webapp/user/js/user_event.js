
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
		var e_num=ecomment_insert.e_num.value;//이벤트 고유 번호
		var m_num = pwInputForm.m_num.value;//조회하려는 사람의 회원 고유번호
		
		var ec_pw_input = pwInputForm.ec_pw.value;//사용자가 입력한 비밀번호값
		var ec_pw_trim =ec_pw_input.replace(' ', '');//공백제거
		
		pwInputForm.ec_pw.value=ec_pw_trim;//비밀번호 입력 form에 공백제거한 비밀번호 값 넣어주기
		pwInputForm.e_num.value=e_num;
		
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
		           }
		        },
		        error : function(){
		           alert("서버통신실패");
		        }
			  });			
	}     



//[[로그인 사용자 기능]]------------------------------------------------------------------------------

//로그인 사용자 댓글 수정창 나타내기
function showUserModify(){
	$('#originalReply').hide();	
	$('#pwReply').hide();
	$('#modifyReply').show();	
	location.href='#modifyReply';
}
//로그인 사용자 댓글 확인창 나타내기
function showUserOriginal(){
	$('#modifyReply').hide();	
	$('#pwReply').hide();
	$('#originalReply').show();	
	location.href='#originalReply';	
}



//로그인 사용자가 새 댓글 등록
function submitComment(){
	 alert('작동');
	
	 $.ajax({
       url: "ecomment_insert",
       type: "POST",
       data:  $("#insertform").serialize(),
       success : function(val){
           if(val ==1 ){//1이면 성공
           alert('성공');                      	    
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
	   		 if(confirm('로그인이 필요합니다. 로그인 페이지로 이동할까요?')){
	   			 location.href='login?backpath=user_event_view?e_num='+ecomment_insert.e_num.value;
	   		 } else {
	   			 //댓글 등록창 막아 버리기
	   				$( 'input#ec_pw' ).css('readonly','readonly');
	   				$( '#ec_content' ).css('readonly','readonly');
	   		 }
	   	 }
    }



