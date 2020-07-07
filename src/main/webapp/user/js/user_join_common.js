
//로그아웃
function user_logout(){
	var backpath = location.pathname;
    $.ajax({
          type : "POST",
          url : "logout",
          data : backpath,
          contentType : "application/x-www-form-urlencoded; charset=UTF-8",
          success : function(val){
             if(val ==1 ){//1이면 성공
            	 alert('로그아웃 되셨습니다.');
            	 location.reload();
             }else{ // 0이면 실패
                alert("로그아웃하지 못했습니다. 다시 시도해 주세요.");
             }
          },
          error : function(){
             alert("서버통신실패");
          }
       });		
}