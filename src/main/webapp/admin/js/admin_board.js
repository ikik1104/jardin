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
			
		        if($('#win_lose_sign').val()=='on'){
					return chkArray;
		        }
		        
			if(confirm('일괄 삭제하시겠습니까?\n삭제한 데이터는 복구할 수 없습니다.')){
				
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
			
			if($('#mtm_content2').val()==null || $('#mtm_content2').val()==''){
				alert('내용을 입력해 주세요.');
				return false;
			}			
			
			if($('#byte_excess2').val()=='on'){
				alert('답변 최대 입력 글자 수를 초과했습니다.');
				return false;
			}
			
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
			
			if($('#mtm_content').val()==null || $('#mtm_content').val()==''){
				alert('내용을 입력해 주세요.');
				return false;
			}
			
			if($('#byte_excess').val()=='on'){
				alert('답변 최대 입력 글자 수를 초과했습니다.');
				return false;
			}
			
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
			
			if($('#notice_modify_title').val()==null || $('#notice_modify_title').val()==''){
				alert('제목을 입력해 주세요.');
				return false;
			}			
			if($('#smartEditor').val()==null || $('#smartEditor').val()==''){
				alert('내용을 입력해 주세요.');
				return false;
			}					
			
			if($('#byte_excess').val()=='on'){
				alert('제목 최대 입력 글자 수를 초과했습니다.');
				return false;
			}
			if($('#byte_excess2').val()=='on'){
				alert('내용 최대 입력 글자 수를 초과했습니다.');
				return false;
			}

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
			
			if($('#notice_content').val()==null || $('#notice_content').val()==''){
				alert('제목을 입력해 주세요.');
				return false;
			}			
			if($('#smartEditor').val()==null || $('#smartEditor').val()==''){
				alert('내용을 입력해 주세요.');
				return false;
			}			
			
			if($('#byte_excess').val()=='on'){
				alert('제목 최대 입력 글자 수를 초과했습니다.');
				return false;
			}
			
			if($('#byte_excess2').val()=='on'){
				alert('내용 최대 입력 글자 수를 초과했습니다.');
				return false;
			}
			
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
//[이벤트]------------------------------------------------------
		
		//이벤트 일괄 삭제
		function eventSomeDelete(){
			var chkArray = arrayingCheckbox();//체크박스 값 배열에 넣기
			
			if(chkArray==false){
				return false;
			}
		
            $.ajax({
                url : "event_some_delete",
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
		//이벤트글 1개 등록
		function event_insert(){
			
			if(inputform.str1.value==null || inputform.str1.value==''){
				alert('제목을 입력해 주세요.');
				return false;
			}	
			if(inputform.str2.value==null || inputform.str2.value==''){
				alert('내용을 입력해 주세요.');
				return false;
			}	
			var start = inputform.str5.value;
			var end = inputform.str6.value;
			var win = inputform.str7.value;
			if(start=='' || start==null || start==undefined){
				alert('시작 날짜를 선택해 주세요.');
				return false;
			}
			if(end=='' || end==null || end==undefined){
				alert('종료 날짜를 선택해 주세요.');
				return false;
			}
			var file= inputform.thumb_img.value;
			if(file=='' || file==null || file==undefined){
				alert('썸네일 이미지를 선택해 주세요.');
				return false;
			}
			
			
			if(win=='' || win==null || win==undefined){
				alert('당첨 발표 날짜를 선택해 주세요.');
				return false;
			}
			
			
			if($('#byte_excess').val()=='on'){
				alert('제목 최대 입력 글자 수를 초과했습니다.');
				return false;
			}
			if($('#byte_excess2').val()=='on'){
				alert('내용 최대 입력 글자 수를 초과했습니다.');
				return false;
			}
			
			inputform.submit();
			/*
			 $.ajax({
			       url: "event_insert",
			       type: "POST",
			       data:  $("#event_insert").serialize(),
			       success : function(val){
			           if(val ==1 ){//등록 성공
			        	   alert('이벤트글을 등록했습니다.');
			        	   location.href='event_list';
			           } else if(val ==0){//등록 실패
			              alert("이벤트글을 등록하지 못했습니다. 다시 시도해 주세요.");
			           }
			        },
			        error : function(){
			           alert("서버통신실패");
			        }
				  });				*/
		}			
		//당첨 취소 체크
		function back_check(ec_num){
	            $.ajax({
	                  url : "applicant_back",
	                  method : "POST",
	                  data: JSON.stringify(ec_num),
	                  dataType : "json",
	                  contentType: "application/json",
	                  success : function(val){
	                     if(val == 1){ //리턴값이 1이면 (=성공)
	                        alert("당첨취소로 처리 되었습니다.");
	                        location.reload(); //페이지 새로고침
	                     }else{ // 0이면 실패
	                        alert("당첨취소 처리 실패.");
	                     }
	                  },
	                  error : function(){
	                     alert("서버통신실패");
	                  }
	               });	
		}
		
		//당첨 체크
		function win_check(ec_num){
            $.ajax({
                url : "applicant_win",
                method : "POST",
                data: JSON.stringify(ec_num),
                dataType : "json",
                contentType: "application/json",
                success : function(val){
                   if(val == 1){ //리턴값이 1이면 (=성공)
                      alert("당첨 처리 되었습니다.");
                      location.reload(); //페이지 새로고침
                   }else{ // 0이면 실패
                      alert("당첨 처리 실패.");
                   }
                },
                error : function(){
                   alert("서버통신실패");
                }
             });				
		}		
		//선택 신청자 일괄 삭제
		function applicantSomeDelete(){
			var chkArray = arrayingCheckbox();//체크박스 값 배열에 넣기
			
			if(chkArray==false){
				return false;
			}
		
            $.ajax({
                url : "applicant_some_delete",
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
		//선택 신청자 일괄 당첨/당첨 취소
		function applicantSomeWin(){
			
			$('#win_lose_sign').val('on');
			
			var chkArray = arrayingCheckbox();//체크박스 값 배열에 넣기
			
			if(chkArray==false){
				return false;
			}
		
            $.ajax({
                url : "applicant_some_win",
                method : "POST",
                data: JSON.stringify(chkArray),
                dataType : "json",
                contentType: "application/json",
                success : function(val){
                   if(val != 0){ //성공
                      alert("일괄 당첨/당첨취소 처리 완료되었습니다.");
                     location.reload();
                   }else if(val==0){ // 0이면 실패
                      alert("일괄 당첨/당첨취소 처리 실패.");
                   }
                },
                error : function(){
                   alert("서버통신실패");
                }
             });
            
            $('#win_lose_sign').val('off');
		}
		
		//event_view에서 삭제 체크
		function event_view_del_check(e_num){
			if(confirm("해당 게시글을 삭제하시겠습니까? (삭제한 데이터는 복구할 수 없습니다.)")){
	            $.ajax({
	                  url : "event_delete",
	                  method : "POST",
	                  data: JSON.stringify(e_num),
	                  dataType : "json",
	                  contentType: "application/json",
	                  success : function(val){
	                     if(val == 1){ //리턴값이 1이면 (=성공)
	                        alert("삭제처리 완료되었습니다.");
	                        location.href="event_list"; //페이지 새로고침
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
		
		//event_view에서 댓글 삭제 확인
		function comment_del_check(ec_num){
			
			var sign = $('#applicant_comment').val();
			var str="";
			
			if(sign=='on'){
				str="신청자를";
			} else {
				str="댓글을";
			}
			
			if(confirm("해당 "+str+" 삭제하시겠습니까? (삭제한 데이터는 복구할 수 없습니다.)")){
	            $.ajax({
	                  url : "event_comment_delete",
	                  method : "POST",
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
	                  error : function(){
	                     alert("서버통신실패");
	                  }
	               });
	         }
		}		
		//event_view에서 수정할 때 수정하지 않은 항목 있을 경우 기존 값 넣어주기
		function modify_check(){
			if(inputform.e_start_day.value=="" || inputform.e_start_day.value==null){
				inputform.e_start_day.value=inputform.start.value;
			}
			if(inputform.e_end_day.value=="" || inputform.e_end_day.value==null){
				inputform.e_end_day.value=inputform.end.value;
			}				
			if(inputform.e_win_day.value=="" || inputform.e_win_day.value==null){
				inputform.e_win_day.value=inputform.win.value;
			}
			if(inputform.co_num.value=="" || inputform.co_num.value==null){
				inputform.co_num.value=inputform.coupon.value;
			}			
			inputform.submit();
		}		
		
		//event_list에서 버튼 삭제
		function event_del_check(e_num){
			if(confirm("해당 게시글을 삭제하시겠습니까? (삭제한 데이터는 복구할 수 없습니다.)")){
	            $.ajax({
	                  url : "event_delete",
	                  method : "POST",
	                  data: JSON.stringify(e_num),
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
		//event_view에서 이벤트 수정
		function event_modify(){
			inputform.submit(); 
		}
		
		
		
		
		
		
		
		