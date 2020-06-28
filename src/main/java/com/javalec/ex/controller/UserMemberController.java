package com.javalec.ex.controller;

import java.sql.JDBCType;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
		int success = mservice.memberJoin(memberDto);
		String alerttext="";
		if(success==0) alerttext="alert('회원가입에 실패했습니다. 다시 시도해 주세요.'); history.go(-1);"; 
		if(success>=1) alerttext="alert('회원가입 되었습니다.'); location.href='step04';"; 		
		model.addAttribute("alerttext", alerttext);	
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
	
}
