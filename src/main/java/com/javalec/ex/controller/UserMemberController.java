package com.javalec.ex.controller;

import java.sql.JDBCType;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.annotation.ModelMethodProcessor;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.OrderListDto;
import com.javalec.ex.dto.ReceiverDto;
import com.javalec.ex.dto.UtilDto;
import com.javalec.ex.service.AdminCouponService;
import com.javalec.ex.service.NonMemService;
import com.javalec.ex.service.UserMemberService;

@Controller
public class UserMemberController {
	
	/*
	 * [사용자]
	 * 회원
	 * */
	
	String response_path="member/";
	
	@Autowired
	UserMemberService mservice;
	@Autowired
	NonMemService nmService;
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	//로그인 페이지 접속
	@RequestMapping("login")
	public String login(Model model, HttpServletRequest request) {
		String backpath = request.getParameter("backpath");
		
		if(backpath!=null && !(backpath.equals(""))) {
			//경로값 넘겼을 때 경로값에서 맨 앞의 '/' 제거

			if(backpath.indexOf("/")==0) {
				backpath=backpath.substring(1, backpath.length()-1);
			}
		}
		
		   if(backpath==null || backpath==""){
			//경로값을 안 넘겼을 경우
			model.addAttribute("backpath", null);
		   } else  if(backpath!=null && backpath!=""){
			   //경로값 넘겼을 경우
			   model.addAttribute("backpath", backpath);
		   }
		
		return response_path+"login";
	}
	
	//로그아웃
	@ResponseBody
	@RequestMapping("logout")
	public int login(HttpSession session ) {
		int success = 0;		
		//회원 로그아웃
		if(session.getAttribute("userNum")!=null ) {	
			session.removeAttribute("userNum");
			session.removeAttribute("userID");
			//로그아웃 잘 됐는지 확인
			if(session.getAttribute("userNum")==null ) {
				if(session.getAttribute("userID")==null ) {
					success=1;
				}
			}			
		}
		
		//비회원 로그아웃
		if(session.getAttribute("orderNum")!=null ) {	
			session.removeAttribute("orderNum");
			session.removeAttribute("orderName");
			//로그아웃 잘 됐는지 확인
			if(session.getAttribute("orderNum")==null ) {
				if(session.getAttribute("orderName")==null ) {
					success=1;
				}
			}					
		}		
		
		return success;
	}
	
	
	//회원 로그인
	@ResponseBody
	@PostMapping("member_login")
	public int member_login(MemberDto memberDto, HttpSession session, HttpServletRequest request, Model model) {
		int success=-99; 
		String backpath = request.getParameter("backpath");
		
		AllDto alldto_fromDB =  mservice.memberLogin(memberDto);
		
		if(!(alldto_fromDB.getMemberdto().getM_id().equals("-"))) {
			if(!(alldto_fromDB.getMemberdto().getM_pw().equals("-"))) {
				//id, pw 둘다 일치
				success=1;
			} else {
				//pw 불일치
				success=-1;
			}
		}
		
		if(success== 1) { 
			System.out.println("id, pw 둘다 일치"); 
			session.setAttribute("userID", alldto_fromDB.getMemberdto().getM_id()); 
			session.setAttribute("userNum", alldto_fromDB.getMemberdto().getM_num()); 
			if(session.getAttribute("orderNum")!=null || session.getAttribute("orderName")!=null) {
				//비회원으로 로그인 되어 있을 경우 비회원 자동 로그아웃
				session.removeAttribute("orderNum");
				session.removeAttribute("orderName");			
			}
			
			if(backpath==null || backpath.equals("")) {
				//돌아갈 경로 지정 안 했을 경우
			} else if(backpath!=null && backpath!="") {
				//돌아갈 경로 지정했을 경우
				success=-2;			
			}
		}
		
		return success;
		

	}
	
//	//(임시)비회원 주문조회 페이지 링크
//	@RequestMapping("nonmember_ordercheck")
//	public String nonmember_ordercheck() {
//		return "nonmember/ordercheck";
//	}
	
	//비회원 주문조회 로그인
	@ResponseBody
	@PostMapping("nonmember_login")
	public Map<String, Object> nonmember_login(OrderListDto orderListDto, HttpSession session, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();	
		int check = nmService.nonMemLog(orderListDto);
		int check2 = nmService.nonMemLog2(orderListDto);
		int success = 0;
		if(check == 1) {
			success=1; //이름, 주문번호 일치 하고 주문목록 있음
			map.put("orderNum", orderListDto.getOl_order_num());
			map.put("orderName", orderListDto.getOl_orderer_id());
		} else if(check2 != 0) {
			success=0; //이름, 주문번호 일치하고 주문목록 없음, 반품이나 취소목록 있음
			map.put("orderNum", orderListDto.getOl_order_num());
			map.put("orderName", orderListDto.getOl_orderer_id());
		} else {
			success = -1; //이름, 주문번호 없거나 불일치
		}
		map.put("success", success);
		return map;
	}
	
//	//비회원 주문조회 로그인
//	@ResponseBody
//	@PostMapping("nonmember_login")
//	public int nonmember_login(ReceiverDto receiverDto, HttpSession session, Model model) {
//		int success=-99; String alerttext="";
//		ReceiverDto dto_db = mservice.nonmemberLogin(receiverDto);
//		if(!(dto_db.getOl_order_num().equals("-"))) {
//			//주문번호 일치
//			if(!(dto_db.getM_name().equals("-"))) {
//				//주문번호, 주문자명 모두 일치
//				success=1;
//			} else {
//				//주문번호 일치, 주문자명 불일치
//				success=-1;
//			}
//		}
//		
//		if(success==1) { 
//			System.out.println("주문자명, 주문번호 둘다 일치"); 
//			alerttext="location.href='nonmember_ordercheck';";
//			session.setAttribute("orderName", dto_db.getM_name());
//			session.setAttribute("orderNum", dto_db.getOl_order_num());
//		}
//		model.addAttribute("alerttext", alerttext);
//		
//		return success;
//	}
	
	//회원가입 실명확인 페이지 접속
	@RequestMapping("step01")
	public String step01() {
		return response_path+"step01";
	}
	
	//회원가입 약관동의 페이지 접속
	@RequestMapping("step02")
	public String step02() {
		return response_path+"step02";
	}	
	
	//회원가입 양식 페이지 접속
	@RequestMapping("step03")
	public String step03() {
		return response_path+"step03";
	}		
	
	//회원가입
	@PostMapping("member_join")
	public String member_join(MemberDto memberDto, Model model) {
		System.out.println("들어옴");
		int success = mservice.memberJoin(memberDto);
		String alerttext="";
		if(success==0) alerttext="alert('회원가입에 실패했습니다. 다시 시도해 주세요.'); history.go(-1);"; 
		if(success>=1) alerttext="alert('회원가입 되었습니다.'); location.href='step04';"; 		
		model.addAttribute("alerttext", alerttext);	
		System.out.println("나감");
		return response_path+"step03";
	}
	
	//회원가입 완료 페이지 접속
	@RequestMapping("step04")
	public String step04() {
		return response_path+"step04";
	}
	
	//아이디/비밀번호 찾기 페이지 접속
	@RequestMapping("idsearch")
	public String idsearch() {
		return response_path+"idsearch";
	}
	
	//아이디 찾기
	@PostMapping("search_id")
	public String search_id(MemberDto memberDto, Model model) {
		String alerttext=""; String realpath="";
		MemberDto meminfo = mservice.searchID(memberDto);
		if(meminfo.getM_id().equals("-")) {
			//일치하는 아이디 없는 경우
			alerttext="alert('일치하는 아이디가 없습니다. 다시 시도해 주세요.'); history.go(-1);";
			realpath=response_path+"idsearch";
		} else {
			//일치하는 아이디 찾았을 경우
			
//20.07.03 홍익 메일링 수정 중 ---------------------------------------
			String id = meminfo.getM_id();
			String email = memberDto.getM_email();
			
			/*
			 * 
			 * 1. pom.xml에 메일 관련 추가 확인
			 * 2. root-context 메일 전송관련 bean추가
			 * 3. controller 메일관련 @Autowired 추가
			 * 4. 하단에 메일 내용 html넣어둔 메소드 있어요~
			 * 
			 * */
			
			 try {                                                       
			        MimeMessage message = mailSender.createMimeMessage();
			        MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			        messageHelper.setTo(email);//보낼 메일주소
			        messageHelper.setSubject("[JARDIN] 쟈뎅 아이디찾기  "); //메일 제목/
			        messageHelper.setText(mail_text_id(id),true);  //메일내용 true가 있어야 html이라고 인식해준데영~~
			        
			        mailSender.send(message); //보낸다.
		        } catch(Exception e){
		        	System.out.println("에러났거든???");
		            System.out.println(e);
		        }
			 
//20.07.03 홍익 메일링 수정 중 ---------------------------------------
			
			realpath="redirect:idsearch_success";
		}
		model.addAttribute("alerttext", alerttext);
		model.addAttribute("m_id", meminfo.getM_id());
		
		return realpath;
	}
	
	//회원가입 시 아이디 중복 체크
	@ResponseBody
	@PostMapping("check_id")
	public int check_id(MemberDto memberDto, Model model) {
		System.out.println(memberDto.getM_id());
		int success=0;
		AllDto alldto = mservice.checkID(memberDto);
		System.out.println(alldto.getMemberdto().getM_id());
		if(alldto.getMemberdto().getM_id().equals(memberDto.getM_id())) {
			//일치하는 아이디 있는 경우
			success=0;
		} else {
			//일치하는 아이디 없을 경우
			success=1;
		}
		System.out.println(success);
		return success;
	}
	
	//비밀번호 찾기
	@PostMapping("search_pw")
	public String search_pw(MemberDto memberDto, Model model) {
		String alerttext=""; String realpath="";
		MemberDto meminfo = mservice.searchPW(memberDto);
		if(meminfo.getM_pw().equals("-")) {
			//일치하는 비밀번호 없는 경우
			alerttext="alert('정보와 일치하는 비밀번호가 없습니다. 다시 시도해 주세요.'); history.go(-1);";
			realpath=response_path+"idsearch";
		} else {
			//일치하는 비밀번호 찾았을 경우
			// 임시 비번번호 (랜덤) 20.07.03 홍익 메일링 수정중-------------------------------------------------------
			 String password = "";
			  for(int i = 0; i < 8; i++){
			   //char upperStr = (char)(Math.random() * 26 + 65);
			   char lowerStr = (char)(Math.random() * 26 + 97);
			   if(i%2 == 0){
			    password += (int)(Math.random() * 10);
			   }else{
			    password += lowerStr;
			   }
			  }
			  System.out.println("*** 만들어진 임시 비밀번호 = "+password);
			 
			  try {                                                       
			        MimeMessage message = mailSender.createMimeMessage();
			        MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			        messageHelper.setTo(memberDto.getM_email());//보낼 메일주소
			        messageHelper.setSubject("[JARDIN] 쟈뎅 임시 비밀번호를 발송해 드립니다.  "); //메일 제목
			        messageHelper.setText(mail_text_pw(password),true);  //메일내용 true가 있어야 html이라고 인식해준데영~~
			        
			        memberDto.setM_pw(password);
			        System.out.println(memberDto.getM_pw());
			        System.out.println(memberDto.getM_id());
			        
			        mailSender.send(message); //보낸다.
			        mservice.updateMailPw(memberDto); //임시 비밀번호로 비밀번호를 변경한다. (아 where num말고 where id로 회원 찾아서 수정함..)
		        } catch(Exception e){
		        	System.out.println("에러났거든???");
		            System.out.println(e);
		        }
			 
			  
			 // 임시번호를 메일로 전송하고 나서 임시번호로 비밀번로를 update해줘야 함
			  
			  
			  
			  
			  
			  
			 //임시 비번번호 (랜덤) 20.07.03 홍익 메일링 수정중-------------------------------------------------------
			
			
			realpath="redirect:pwsearch_success";
			
		}
		model.addAttribute("alerttext", alerttext);
		model.addAttribute("m_pw", meminfo.getM_pw());
		return realpath;
		
		
		 
	}	
	
	//아이디 찾기 성공 페이지 접속
	@RequestMapping("idsearch_success")
	public String idsearch_success(HttpServletRequest request, Model model) {
		model.addAttribute("m_id", request.getParameter("m_id"));
		return response_path+"idsearch_success";
	}
	
	//비밀번호 찾기 성공 페이지 접속
	@RequestMapping("pwsearch_success")
	public String pwsearch_success(HttpServletRequest request, Model model) {
		model.addAttribute("m_pw", request.getParameter("m_pw"));
		return response_path+"pwsearch_success";
	}

	//아이디 중복확인 창
	@RequestMapping("idcheck")
	public String idcheck() {
		return response_path+"idcheck";
	}
	
	
	//아이디 찾기 메일content
	public String mail_text_id (String id) {
		String aa = "";
		
        aa += "<html><body bgcolor='#FFFFFF' leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' style='margin:0 auto; padding:0; font:normal 12px/1.5 돋움;'>";
        aa += "<table width='700' cellpadding='0' cellspacing='0' align='center'>";
		aa += "<tr><td style='width:700px;height:175px;padding:0;margin:0;vertical-align:top;font-size:0;line-height:0;'>";
		aa += "<img src='https://res.cloudinary.com/hongik/image/upload/v1593758746/mail/img_email_top_jtuwwr.jpg' alt='JARDIN' />";			
		aa += "</td></tr><tr><td style='width:700px;height:78px;padding:0;margin:0;vertical-align:top;'>";
		aa += "<p style='width:620px;margin:50px 0 40px 38px;text-align:center;font-size:0;line-height:0;'><img src='https://res.cloudinary.com/hongik/image/upload/v1593758723/mail/img_txt_id01_pzivzf.jpg' alt='원두커피의 名家, JARDIN 문의하신 회원님 ID를 발송해 드립니다.' /></p>";
		aa += "</td></tr><tr><td style='width:700px;height:179px;padding:0;margin:0;vertical-align:top;'>";
		aa += "<table width='618';height='177' cellpadding='0' cellspacing='0' align='center' style='margin:0 0 0 40px;border:1px #d9d9d9 solid;'><tr>";
		aa += "	<td style='width:618px;height:177px;padding:0;margin:0;vertical-align:top;font-size:0;line-height:0;background:#f9f9f9;'>";
		aa += "	<p style='width:620px;margin:30px 0 0 0;padding:0;text-align:center;'><img src='https://res.cloudinary.com/hongik/image/upload/v1593758724/mail/img_txt_id02_tnqbuz.jpg' alt='쟈뎅샵에서 ID찾기를 요청하셨습니다.' /></p>";
		aa += "	<p style='width:620px;margin:30px 0 0 0;padding:0;text-align:center;color:#666666;font-size:12px;line-height:1;'><strong>ID : <span style='color:#f7703c;line-height:1;'>"+id+"</span></strong></p>";
		aa += "	<p style='width:620px;margin:30px 0 0 0;padding:0;text-align:center;color:#888888;font-size:12px;line-height:1.4;'>쟈뎅샵에서는 고객님께 보다 나은 서비스를 제공하기 위해 항상 노력하고 있습니다.<br/>앞으로 많은 관심 부탁드립니다.</p>";
		aa += "	</td></tr></table></td></tr><tr>";
		aa += "<td style='width:700px;height:120px;padding:0;margin:0;vertical-align:top;'>";
		aa += "<p style='width:700px;margin:30px 0 50px 0;text-align:center;'><a href='http://localhost:8181/ex/login'><img src='https://res.cloudinary.com/hongik/image/upload/v1593758722/mail/btn_jardin_fxt7y5.jpg' alt='JARDIN 바로가기' /></a></p>";
		aa += "</td></tr><tr><td style='width:700px;height:50px;padding:0;vertical-align:top;font-size:0;line-height:0;text-align:center;'>";
		aa += "	<img src='https://res.cloudinary.com/hongik/image/upload/v1593758724/mail/img_email_bottom_pd9yuq.jpg' alt='' />";
		aa += "	</td></tr><tr><td style='width:700px;height:140px;padding:0;margin:0;vertical-align:top;background-color:#5a524c;'>";
		aa += "	<p style='width:620px;margin:20px 0 0 40px;padding:0;text-align:center;line-height:1.5;color:#b2aeac;'>메일수신을 원치 않으시는 분은 로그인 후. <span style='color:#ffffff'>메일 수신 여부</span>를 변경해주시기 바랍니다.<br/>IF YOU DO NOT WISH TO RECEIVE EMAILS FROM US, PLEASE LOG-IN AND UPDATE<br/> YOUR MEMBERSHIP INFORMATION.</p>";
		aa += "	<p style='width:620px;margin:15px 0 0 40px;padding:0;text-align:center;line-height:1.5;color:#b2aeac;'><span style='color:#ffffff'>본 메일에 관한 문의사항은 사이트 내 고객센터를 이용해주시기 바랍니다.</span><br/>COPYRIGHT ©  2014 JARDIN ALL RIGHTS RESERVED.</p>";
		aa += "</td></tr></table></div></body></html>";
		return aa;
	}
	
	public String mail_text_pw (String pw) {
		String aa = "";
		
		aa += "<body bgcolor='#FFFFFF' leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' style='margin:0; padding:0; font:normal 12px/1.5 돋움;'>";
		aa += "<table width='700' cellpadding='0' cellspacing='0' align='center'>";
		aa += "<tr><td style='width:700px;height:175px;padding:0;margin:0;vertical-align:top;font-size:0;line-height:0;'>";
		aa += "<img src='https://res.cloudinary.com/hongik/image/upload/v1593758746/mail/img_email_top_jtuwwr.jpg' alt='JARDIN' />";			
		aa += "</td></tr><tr><td style='width:700px;height:78px;padding:0;margin:0;vertical-align:top;'>";
		aa += "<p style='width:620px;margin:50px 0 40px 38px;text-align:center;font-size:0;line-height:0;'><img src='https://res.cloudinary.com/hongik/image/upload/v1593758726/mail/img_txt_password01_t5yfyo.jpg' alt='원두커피의 名家, JARDIN 임시 비밀번호가 발급되었습니다.' /></p>";
		aa += "</td></tr><tr><td style='width:700px;height:196px;padding:0;margin:0;vertical-align:top;'>";
		aa += "<table width='618' height='194' cellpadding='0' cellspacing='0' align='center' style='margin:0 0 0 40px;border:1px #d9d9d9 solid;'>";
		aa += "<tr><td style='width:618px;height:194px;padding:0;margin:0;vertical-align:top;font-size:0;line-height:0;background:#f9f9f9;'>";
		aa += "<p style='width:620px;margin:30px 0 0 0;padding:0;text-align:center;'><img src='https://res.cloudinary.com/hongik/image/upload/v1593758727/mail/img_txt_password02_lps7rj.jpg' alt='JARDIN에서 비밀번호 찾기를 요청하셨습니다.' /></p>";
		aa += "<p style='width:620px;margin:10px 0 0 0;padding:0;text-align:center;color:#888888;font-size:12px;line-height:1;'>아래의 PASSWORD는 임시 PASSWORD이므로 홈페이지 로그인 후 다시 수정해 주십시오.</p>";
		aa += "<p style='width:620px;margin:28px 0 0 0;padding:0;text-align:center;color:#666666;font-size:12px;line-height:1;'><strong>임시 패스워드 : <span style='color:#f7703c;line-height:1;'>"+pw+"</span></strong></p>";
		aa += "<p style='width:620px;margin:30px 0 0 0;padding:0;text-align:center;color:#888888;font-size:12px;line-height:1.4;'>쟈뎅샵에서는 고객님께 보다 나은 서비스를 제공하기 위해 항상 노력하고 있습니다.<br/>앞으로 많은 관심 부탁드립니다.</p>";
		aa += "</td></tr></table></td></tr><tr><td style='width:700px;height:120px;padding:0;margin:0;vertical-align:top;'>";
		aa += "<p style='width:700px;margin:30px 0 50px 0;text-align:center;'><a href='#'><img src='https://res.cloudinary.com/hongik/image/upload/v1593758722/mail/btn_jardin_fxt7y5.jpg' alt='JARDIN 바로가기' /></a></p>";
		aa += "</td></tr><tr><td style='width:700px;height:50px;padding:0;vertical-align:top;font-size:0;line-height:0;text-align:center;'>";
		aa += "<img src='https://res.cloudinary.com/hongik/image/upload/v1593758724/mail/img_email_bottom_pd9yuq.jpg' alt='' />";
		aa += "</td></tr><tr><td style='width:700px;height:140px;padding:0;margin:0;vertical-align:top;background-color:#5a524c;'>";
		aa += "<p style='width:620px;margin:20px 0 0 40px;padding:0;text-align:center;line-height:1.5;color:#b2aeac;'>메일수신을 원치 않으시는 분은 로그인 후. <span style='color:#ffffff'>메일 수신 여부</span>를 변경해주시기 바랍니다.<br/>IF YOU DO NOT WISH TO RECEIVE EMAILS FROM US, PLEASE LOG-IN AND UPDATE<br/> YOUR MEMBERSHIP INFORMATION.</p>";
		aa += "<p style='width:620px;margin:15px 0 0 40px;padding:0;text-align:center;line-height:1.5;color:#b2aeac;'><span style='color:#ffffff'>본 메일에 관한 문의사항은 사이트 내 고객센터를 이용해주시기 바랍니다.</span><br/>COPYRIGHT ©  2014 JARDIN ALL RIGHTS RESERVED.</p>";
		aa += "</td></tr></table></div></body>";
		
		return aa;
	}
	
}
