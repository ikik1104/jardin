window.onload=function(){
	 $("#email2").attr("readonly",false);
}

//비밀번호 확인
function checkPW2(){
	 var pw=joinform.m_pw.value;
	 var pw2=joinform.m_pw2.value;	 
	 
	 var yes_text=$('#pw2_yes');
	 var no_text=$('#pw2_no');
	 
	 if((pw=='' && pw2=='') || (pw==null && pw2==null)){
		 return false;
	 }
	 
	 if(pw!=pw2){
		 no_text.html('* 비밀번호가 일치하지 않습니다.');
		 yes_text.html('');
	 }
	 if(pw==pw2){
		 no_text.html('');
		 yes_text.html('* 비밀번호가 일치합니다.');
	 }
}

//우편번호 검색 창 열기
function openSearch(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        	//jQuery("#postcode1").val(data.postcode1);
			//jQuery("#postcode2").val(data.postcode2);
			jQuery("#zonecode").val(data.zonecode);
			jQuery("#address").val(data.address);
			jQuery("#address_etc").focus();
			console.log(data);
        }
    }).open();
} 

//주소2 한영 길이 제한
function addrLenCheck(){

	//실시간으로 주소2 길이 입력 체크
	
	 var str = $('#address_etc').val();
	 var len=0;
	 var cnt=0;
	 
	 if(str!=undefined && str!=null && str!=''){
	 for (var i = 0; i < str.length; i++) {
	        if (escape(str.charAt(i)).length == 6) {
	            len+=2;
	        }
	        len++;
	       if(len<=50){
	    	   cnt++;
	       }
	        
	        if(len>50){
	        	$('#address_etc').val(str.substr(0, cnt));
	        }
	        
	    }
	 }
	 
	 
}

//이름 한영 길이 제한
function nameLenCheck(){

	//실시간으로 이름 길이 입력 체크
	
	 var str = $('#m_name').val();
	 var len=0;
	 var cnt=0;
	 
	 if(str!=undefined && str!=null && str!=''){
	 for (var i = 0; i < str.length; i++) {
	        if (escape(str.charAt(i)).length == 6) {
	            len+=2;
	        }
	        len++;
	       if(len<=50){
	    	   cnt++;
	       }
	        
	        if(len>50){
	        	$('#m_name').val(str.substr(0, cnt));
	        }
	        
	    }
	 }
	 
	 
}

//이메일 select값 text input에 넣기
function inputEmail2(){
	 joinform.email2.value =  joinform.emailList.value;
	 if(joinform.emailList.value==''){
		 //직접입력 선택할 경우
		 $("#email2").attr("readonly",false);
	 } else {
		 $("#email2").attr("readonly",true);
	 }
}


//'가입하기' 눌렀을 때
function submitJoin(){
	 
	 var name=$('#m_name').val();
	 var id=joinform.m_id.value;
	 var pw=joinform.m_pw.value;
	 var pw2=joinform.m_pw2.value;	 
	 var email1=joinform.email1.value;	
	 var email2=joinform.email2.value;	
	 var m_email_ok=joinform.m_email_ok.value;	 
	 
	 
	 var m_zipcode=joinform.m_zipcode.value;	 
	 var m_address1=joinform.m_address1.value;	 
	 var m_address2=joinform.m_address2.value;	 
	 var phone1=joinform.phone1.value;	 
	 var phone2=joinform.phone2.value;	 
	 var phone3=joinform.phone3.value;	 
	 var m_sms_ok=joinform.m_sms_ok.value;	 	
	 
	 var tel1=joinform.tel1.value;	 	
	 var tel2=joinform.tel2.value;		 
	 var tel3=joinform.tel3.value;
	 
	 var birth1=joinform.birth1.value;
	 var birth2=joinform.birth2.value;
	 var birth3=joinform.birth3.value;
	 
	 var m_birth_sort=joinform.m_birth_sort.value;
	 
	 //공백 체크
	 if(name=='' || name==null || name==undefined){
		 alert('이름을 입력해 주세요.');
		 return false;
	 }
	 if(id=='' || id==null || id==undefined){
		 alert('아이디를 입력해 주세요.');
		 return false;
	 }
	 if(pw=='' || pw==null || pw==undefined){
		 alert('비밀번호를 입력해 주세요.');
		 return false;
	 }
	 if(pw2=='' || pw2==null || pw2==undefined){
		 alert('비밀번호를 확인해 주세요.');
		 return false;
	 }
	 if(pw!=pw2){
		 alert('비밀번호 확인이 올바르지 않습니다.');
		 return false;
	 }
	 if(email1=='' || email1==null || email1==undefined){
		 alert('이메일을 입력해 주세요.');
		 return false;
	 }
	 if(email2=='' || email2==null || email2==undefined){
		 alert('이메일을 입력해 주세요.');
		 return false;
	 }
	 if(m_email_ok=='' || m_email_ok==null || m_email_ok==undefined){
		 alert('이메일 수신 여부를 선택해 주세요.');
		 return false;
	 }
	 if(m_zipcode=='' || m_zipcode==null || m_zipcode==undefined){
		 alert('우편번호를 입력해 주세요.');
		 return false;
	 }
	 if(m_address1=='' || m_address1==null || m_address1==undefined){
		 alert('주소를 입력해 주세요.');
		 return false;
	 }
	 if(m_address2=='' || m_address2==null || m_address2==undefined){
		 alert('상세 주소를 입력해 주세요.');
		 return false;
	 }
	 if(phone1=='' || phone1==null || phone1==undefined){
		 alert('휴대전화를 입력해 주세요.');
		 return false;
	 }
	 if(phone2=='' || phone2==null || phone2==undefined){
		 alert('휴대전화를 입력해 주세요.');
		 return false;
	 }
	 if(phone3=='' || phone3==null || phone3==undefined){
		 alert('휴대전화를 입력해 주세요.');
		 return false;
	 }
	 
	 
	 if(m_sms_ok=='' || m_sms_ok==null || m_sms_ok==undefined){
		 alert('SMS 수신 여부를 선택해 주세요.');
		 return false;
	 }
	 if(tel1=='' || tel1==null || tel1==undefined){
		 alert('유선전화를 입력해 주세요.');
		 return false;
	 }
	 if(tel2=='' || tel2==null || tel2==undefined){
		 alert('유선전화를 입력해 주세요.');
		 return false;
	 }
	 if(tel3=='' || tel3==null || tel3==undefined){
		 alert('유선전화를 입력해 주세요.');
		 return false;
	 }
	 
	 if(birth1=='' || birth1==null || birth1==undefined){
		 alert('생년월일을 입력해 주세요.');
		 return false;
	 }
	 if(birth2=='' || birth2==null || birth2==undefined){
		 alert('생년월일을 입력해 주세요.');
		 return false;
	 }
	 if(birth3=='' || birth3==null || birth3==undefined){
		 alert('생년월일을 입력해 주세요.');
		 return false;
	 }
	 if(m_birth_sort=='' || m_birth_sort==null || m_birth_sort==undefined){
		 alert('양력/음력을 선택해 주세요.');
		 return false;
	 }	 
	 
	 var name_chk = /^[ㄱ-ㅎ가-힣]{2,18}$/; 
	 var pw_chk = /^[a-zA-Z0-9]{4,20}$/; 
	 var email1_chk = /^[a-zA-Z0-9]{5,20}$/; 
	 var email2_chk =  /^((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/
	 var phone2_chk = /^[0-9]{3,4}$/; 
	 var phone3_chk = /^[0-9]{4}$/; 
	 var tel2_chk = /^[0-9]{3,4}$/; 
	 var tel3_chk =  /^[0-9]{4}$/; 
	 
	 if(!(name_chk.test(name))){
		 alert('이름은 한글로 2~18자까지 입력해 주세요.');
		 return false;
	 }
	 if(!(pw_chk.test(pw))){
		 alert('비밀번호는 영문/숫자 혼용으로 4~20자까지 입력해 주세요.');
		 return false;
	 }
	 if(!(email1_chk.test(email1))){
		 alert('이메일 앞자리는 영문/숫자 혼용으로 5~20자까지 입력해 주세요.');
		 return false;
	 }
	 if($('#emailList').val()=='' && !(email2_chk.test(email2))){
		 //직접 입력했을 경우
		 alert("이메일 뒷자리 형식이 올바르지 않습니다.");
		 return false;
	 }
	 if(!(phone2_chk.test(phone2))){
		 alert('휴대전화 가운데 자리는 숫자로 3~4자까지 입력해 주세요.');
		 return false;
	 }
	 if(!(phone3_chk.test(phone3))){
		 alert('휴대전화 뒷자리는 숫자로 4자를 입력해 주세요.');
		 return false;
	 }
	 if(!(tel2_chk.test(tel2))){
		 alert('유선전화 가운데 자리는 숫자로 3~4자까지 입력해 주세요.');
		 return false;
	 }
	 if(!(tel3_chk.test(tel3))){
		 alert('유선전화 뒷자리는 숫자로 4자를 입력해 주세요.');
		 return false;
	 }
	 
	 //이메일값 합치기
	 var email = email1.replace(' ', '')+'@'+ email2.replace(' ', '');
	 joinform.m_email.value=email;

	 //휴대폰값 합치기
	 var phone =  phone1.replace(' ', '')+'-'+ phone2.replace(' ', '')+'-'+ phone3.replace(' ', '');
	 joinform.m_phone.value=phone;

	 //유선전화 합치기
	  var tel = tel1.replace(' ', '')+'-'+tel2.replace(' ', '')+'-'+tel3.replace(' ', '');
	 joinform.m_tel.value=tel;
	
	 //생년월일 합치기
	 var birth = birth1.replace(' ', '')+'/'+birth2.replace(' ', '')+'/'+birth3.replace(' ', '');
	 joinform.m_birth.value=birth;
	
	 joinform.submit();
	 
}

//모든 내용 지우기
function resetAll(){
	 var m_email_ok=joinform.m_email_ok.value;	 
	 
	 var m_sms_ok=joinform.m_sms_ok.value;	 	
	 
	 var m_birth_sort=joinform.m_birth_sort.value;
	 	
	 $('input').val(null);
	 $("#solar").prop("checked", true);
	 $("#sms_yes").prop("checked", true);
	 $("#receive_yes").prop("checked", true);
}









