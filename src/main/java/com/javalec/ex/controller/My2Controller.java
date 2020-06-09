package com.javalec.ex.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.PageDto;
import com.javalec.ex.service.ChangeInfoService;
import com.javalec.ex.service.LeaveService;
import com.javalec.ex.service.MtmService;
import com.javalec.ex.service.SessionService;

@Controller
public class My2Controller {
	@Autowired
	private MtmService mtmService;
	@Autowired
	private SessionService sessionService;
	@Autowired
	private ChangeInfoService changeInfoService;
	@Autowired
	private LeaveService leaveService;
	
	//로그인 세션용 임시 - 추후 삭제 요망
	@RequestMapping("login")
	public String inquiry_test(HttpSession session) {
		session.setAttribute("userID","Hong1");
		String m_id = (String)session.getAttribute("userID");
		session.setAttribute("userNum", sessionService.getMnum(m_id));
		return "mypage/inquiry_test";
	}
	
	//로그아웃용 임시 - 추후 삭제 요망
	@RequestMapping("logout")
	public String inquiry_test2(HttpSession session) {
		session.invalidate();
		return "home";
	}
	
	//1:1문의 리스트 페이지
	@RequestMapping("inquiry")
	public String inquiry(PageDto pageDto, HttpServletRequest request, Model model, HttpSession session) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		
		int m_num = (Integer)session.getAttribute("userNum"); //회원 아이디 변수에 담기
		
		int total = mtmService.countInquiry(m_num);
		int cntPerPage = 10;
		String page = request.getParameter("page"); //열려야하는 페이지
		if(page == null) { page = "1"; }
		
		pageDto = new PageDto(total, Integer.parseInt(page), cntPerPage);
		
		model.addAttribute("paging", pageDto);
		model.addAttribute("inquiry", mtmService.getAllInquiry(m_num, pageDto));
		return "mypage/inquiry";
	}
	
	//1:1문의 리스트 페이지 : 검색
	@RequestMapping("inq_search")
	public String inq_search(PageDto pageDto, HttpServletRequest request, Model model, HttpSession session) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		
		int m_num = (Integer)session.getAttribute("userNum"); //회원 아이디 변수에 담기
		
		String option = request.getParameter("search_category"); //검색옵션값 가져오기
		String search = request.getParameter("search_input"); //검색어 가져오기
		int total = mtmService.countSearchInquiry(m_num, option, search); //검색대상글개수
		
		int cntPerPage = 10; //페이지당 게시글 수
		String page = request.getParameter("page"); //열려야하는 페이지
		if(page == null) { page = "1"; } // 열려야하는 페이지 값이 없으면 1로 세팅
		
		pageDto = new PageDto(total, Integer.parseInt(page), cntPerPage); //페이지 객체가져오기
		
		model.addAttribute("paging", pageDto); //페이지 객체 담기
		model.addAttribute("inquiry", mtmService.getSearchInquiry(m_num, pageDto, option, search)); //검색결과 list 담기
		return "mypage/inquiry";
	}
	
	//1:1문의 뷰 페이지
	@RequestMapping("inquiry_view")
	public String inquiry_view(HttpServletRequest request, Model model, HttpSession session) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		
		int m_num = Integer.parseInt(request.getParameter("m_num"));
		int iu_num = Integer.parseInt(request.getParameter("iu_num"));
		int rownum = Integer.parseInt(request.getParameter("rownum"));
		
		model.addAttribute("rownum", rownum);
		model.addAttribute("inq_view", mtmService.getOneInquiry(iu_num)); //질문글 불러오기
		model.addAttribute("ans_view", mtmService.getOneAnswer(iu_num)); //답변글 불러오기
		model.addAttribute("pre_title", mtmService.getPreTitle(m_num, rownum)); //이전글 제목 불러오기
		model.addAttribute("next_title", mtmService.getNextTitle(m_num, rownum)); //다음글 제목 불러오기
		return "mypage/inquiry_view";
	}
	
	//1:1문의 작성 페이지
	@RequestMapping("inquiry_write")
	public String inquiry_write(Model model, HttpSession session) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크끝
		return "mypage/inquiry_write";
	}
	
	//1:1문의 작성 후 등록
	@RequestMapping("inquiry_write_regi")
	public String inquiry_write_regi(MtmUserDto mtmUserDto, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		if(session.getAttribute("userNum") == null) {return "home";} //세션체크 끝
		mtmService.insertInquiry(mtmUserDto);
		return "redirect:inquiry";
	}
	
	//1:1문의 수정 보기
	@RequestMapping("inquiry_modify")
	public String inquiry_modify(HttpServletRequest request, Model model, HttpSession session) {
		if(session.getAttribute("userNum") == null) { return "home";} //세션체크
		int iu_num = Integer.parseInt(request.getParameter("iu_num"));
		int rownum = Integer.parseInt(request.getParameter("rownum"));
		model.addAttribute("modi_view", mtmService.modifyView(iu_num));
		model.addAttribute("iu_num", iu_num);
		model.addAttribute("rownum", rownum);
		return "mypage/inquiry_modify";
	}
	
	//1:1문의 수정 등록
	@RequestMapping("inquiry_modi_regi")
	public String inquiry_modi_regi(MtmUserDto mtmUserDto, HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("userNum") == null) { return "home";} //세션체크
		int m_num = Integer.parseInt(request.getParameter("m_num"));
		int iu_num = Integer.parseInt(request.getParameter("iu_num"));
		int rownum = Integer.parseInt(request.getParameter("rownum"));
		mtmService.modifyInquiry(mtmUserDto);
		return "redirect:inquiry_view?m_num=" + m_num + "&iu_num=" + iu_num + "&rownum=" + rownum;
	}
	
	//1:1문의 삭제
	@ResponseBody
	@RequestMapping("inquiry_delete")
	public int inquiry_delete(@RequestBody int iu_num) {
		int success = mtmService.deleteInquiry(iu_num);
		return success;
	}
	
	//회원정보수정 수정 양식 보기
	@RequestMapping("change_info")
	public String change_info(HttpSession session, Model model, HttpServletRequest request) {
		if(session.getAttribute("userNum") == null) { return "home";} //세션체크
		int m_num = (Integer) session.getAttribute("userNum");
		
		MemberDto memberDto = changeInfoService.getOneInfo(m_num);

		//email 분리
		String email = memberDto.getM_email();
		int index = email.indexOf("@");
		model.addAttribute("email_id", email.substring(0, index));
		model.addAttribute("email_domain", email.substring(index+1));
		
		//휴대전화번호 분리
		String phoneSet = memberDto.getM_phone();
		String[] phone = phoneSet.split("-");
		for(int i=0; i<phone.length; i++) {
			model.addAttribute("phone"+(i+1), phone[i]);
		}
		
		//유션전화 분리
		String telSet = memberDto.getM_tel();
		String[] tel = telSet.split("-");
		for(int i=0; i<tel.length; i++) {
			model.addAttribute("tel"+(i+1), tel[i]);
		}
		
		//생년월일 분리
		String birthSet = memberDto.getM_birth();
		String[] birth = birthSet.split("/");
		for(int i=0; i<birth.length; i++) {
			model.addAttribute("birth"+(i+1), birth[i]);
			System.out.println(birth[i]);
		}
		model.addAttribute("info_view", memberDto);
		return "mypage/change_info";
	}
	
	//비밀번호변경 모달창 열기
	@RequestMapping("password_change")
	public String password_change(HttpServletRequest request, Model model) {
		model.addAttribute("m_id", request.getParameter("m_id"));
		return "mypage/password_change";
	}
	
	//기존 비밀번호 일치 체크
	@ResponseBody
	@RequestMapping("pw_check")
	public int pw_check(HttpServletRequest request) {
		String m_id = request.getParameter("m_id");
		String pw_ori = request.getParameter("pw_ori");
		String pw_new = request.getParameter("pw_new");
		int success = changeInfoService.pwChange(pw_new, m_id, pw_ori);
		return success;
	}
	
	//우편번호창 열기
	@RequestMapping("zip_open")
	public String zip_open() {
		return "member/zip";
	}
	
	//회원정보 수정 완료시키기
	@ResponseBody
	@RequestMapping("submit_change_info")
	public int submit_change_info(MemberDto memberDto, Model model) {
		int success=changeInfoService.infoChange(memberDto);
		return success;
	}

	//회원탈퇴 페이지 열기
	@RequestMapping("get_leave")
	public String get_leave(HttpSession session, Model model) {
		if(session.getAttribute("userNum") == null) { return "home";} //세션체크
		return "mypage/get_leave";
	}
	
	//회원탈퇴하기
	@ResponseBody
	@RequestMapping("leave_success")
	public int leave_success(MemberDto memberDto) {
		int success = leaveService.memberLeave(memberDto);
		return success;
	}
	
	
	
	
	
	
	
	
}
