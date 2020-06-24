//[공통 기능]---------------------------------------------------------

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

		//선택 1:1문의 체크박스 값 배열에 넣기
		function arrayingCheckbox(){
			
			if(confirm('선택한 게시물을 일괄 삭제하시겠습니까?\n삭제한 데이터는 복구할 수 없습니다.')){
				 var obj = $("[name=chk_ids]");
			        var chkArray = new Array(); // 배열 선언
			 
			        $('input:checkbox[name=chk_ids]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
			            chkArray.push(this.value);
			        });
			        
			        if(chkArray.length==0){
			        	//아무것도 체크 안 했을 경우
			        	alert('항목을 체크해 주세요.');
			        	return false;
			        }
			        /*
			        $('#hiddenValue').val(chkArray);
			        
			        alert($('#hiddenValue').val()); // 배열에 담긴 체크박스 값 확인
				*/
			        return chkArray;				
			} else {
				return false;
			}
			

		}
		
//[1:1문의]---------------------------------------------------------
		
//1:1문의 질문 삭제
		function user_del_check(iu_num){
			if(confirm("해당 게시글을 삭제하시겠습니까? (삭제한 데이터는 복구할 수 없습니다.)")){
	            $.ajax({
	                  url : "mtm_delete",
	                  method : "POST",
	                  data: JSON.stringify(iu_num),
	                  dataType : "json",
	                  contentType: "application/json",
	                  success : function(val){
	                     if(val == 1){ //리턴값이 1이면 (=성공)
	                        alert("삭제처리 완료되었습니다.");
	                        location.href="mtm_list"; //페이지 새로고침
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
		
		//1:1 문의 답변 삭제
		function answer_del_check(ia_num, iu_num){
			var arrNum = [ ia_num, iu_num];
			if(confirm("해당 답변을 삭제하시겠습니까? (삭제한 데이터는 복구할 수 없습니다.)")){
	            $.ajax({
	                  url : "mtm_answer_delete",
	                  method : "POST",
	                  data: JSON.stringify(arrNum),
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
	                  error : function(){
	                     alert("서버통신실패");
	                  }
	               });
	         }
		}		
		
		//1:1문의 답변 등록
		function insertAnswer(){
			 $.ajax({
			       url: "mtm_answer_write",
			       type: "POST",
			       data:  $("#write_form").serialize(),
			       success : function(val){
			           if(val ==1 ){//답변등록 성공
			        	   alert('답변을 등록했습니다.');
			        	   location.reload();
			           } else if(val ==0){//답변등록 실패
			              alert("답변을 등록하지 못했습니다. 다시 시도해 주세요.");
			           }
			        },
			        error : function(){
			           alert("서버통신실패");
			        }
				  });			
		}
		//1:1문의 답변 수정
		function modifyAnswer(){
			 $.ajax({
			       url: "mtm_answer_modify",
			       type: "POST",
			       data:  $("#modify_form").serialize(),
			       success : function(val){
			           if(val ==1 ){//답변수정 성공
			        	   alert('답변을 수정했습니다.');
			        	   location.reload();
			           } else if(val ==0){//답변수정 실패
			              alert("답변을 수정하지 못했습니다. 다시 시도해 주세요.");
			           }
			        },
			        error : function(){
			           alert("서버통신실패");
			        }
				  });			
		}		
		
		//1:1문의 선택 일괄 삭제
		function mtmSomeDelete(){
			var chkArray = arrayingCheckbox();//체크박스 값 배열에 넣기
			
			if(chkArray==false){
				return false;
			}
		
            $.ajax({
                url : "mtm_some_delete",
                method : "POST",
                data: JSON.stringify(chkArray),
                dataType : "json",
                contentType: "application/json",
                success : function(val){
                   if(val != 0){ //성공
                      alert("일괄삭제처리 완료되었습니다.");
                     location.reload();
                   }else if(val==0){ // 0이면 실패
                      alert("일괄삭제 실패.");
                   }
                },
                error : function(){
                   alert("서버통신실패");
                }
             });
		}
		
//[공지사항]--------------------------------------------------
		
		//공지사항 일괄 삭제
		function noticeSomeDelete(){
			var chkArray = arrayingCheckbox();//체크박스 값 배열에 넣기
			
			if(chkArray==false){
				return false;
			}
		
            $.ajax({
                url : "notice_some_delete",
                method : "POST",
                data: JSON.stringify(chkArray),
                dataType : "json",
                contentType: "application/json",
                success : function(val){
                   if(val != 0){ //성공
                      alert("일괄삭제처리 완료되었습니다.");
                     location.reload();
                   }else if(val==0){ // 0이면 실패
                      alert("일괄삭제 실패.");
                   }
                },
                error : function(){
                   alert("서버통신실패");
                }
             });
		}
		
		//공지사항 1개 수정 notice_modify
		function notice_modify(){
			 $.ajax({
			       url: "notice_modify",
			       type: "POST",
			       data:  $("#notice_modify").serialize(),
			       success : function(val){
			           if(val ==1 ){//수정 성공
			        	   alert('공지글을 수정했습니다.');
			        	   location.reload();
			           } else if(val ==0){//수정 실패
			              alert("공지글을 수정하지 못했습니다. 다시 시도해 주세요.");
			           }
			        },
			        error : function(){
			           alert("서버통신실패");
			        }
				  });			
		}				
		//공지글 1개 등록
		function notice_insert(){
			 $.ajax({
			       url: "notice_insert",
			       type: "POST",
			       data:  $("#notice_insert").serialize(),
			       success : function(val){
			           if(val ==1 ){//등록 성공
			        	   alert('공지글을 등록했습니다.');
			        	   location.href='notice_list';
			           } else if(val ==0){//등록 실패
			              alert("공지글을 등록하지 못했습니다. 다시 시도해 주세요.");
			           }
			        },
			        error : function(){
			           alert("서버통신실패");
			        }
				  });			
		}		
		
		
		
		