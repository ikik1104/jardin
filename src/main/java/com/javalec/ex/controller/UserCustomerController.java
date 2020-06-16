package com.javalec.ex.controller;

import java.sql.JDBCType;
import java.util.List;

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
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.NoticeDto;
import com.javalec.ex.dto.ReceiverDto;
import com.javalec.ex.dto.UtilDto;
import com.javalec.ex.service.AdminCouponService;
import com.javalec.ex.service.UserCustomerService;
import com.javalec.ex.service.UserMemberService;

@Controller
public class UserCustomerController {
	
	/*
	 * [사용자]
	 * 고객센터
	 * */
	
	String response_path="customer/";
	
	@Autowired
	UserCustomerService cservice;
	
	//임시 로그인
	@RequestMapping("temptempLogin")
	public String temptempLogin() {
		return response_path+"temptempLogin";
	}
	
	//임시 로그아웃
	@RequestMapping("sessionDelete")
	public String sessionDelete() {
		return response_path+"sessionDelete";
	}
	
	//공지사항 리스트 불러오기
	@RequestMapping("notice")
	public String notice(Model model) {
		model.addAttribute("notice_list", cservice.getAllNoticeBoards());
		return response_path+"notice";
	}
	
	//공지사항 1개 불러오기
	@RequestMapping("user_notice_view")
	public String user_notice_view(NoticeDto noticeDto, Model model) {
		String realpath=""; String alerttext="";
		AllDto dtoDB =  cservice.getNoticeBoard(noticeDto);
		if(dtoDB.getNoticedto().getNo_hit()<0) {
			//조회수 올리기 실패했을 경우
			realpath=response_path+"notice";
			alerttext="alert('공지글을 불러오지 못했습니다. 다시 시도해 주세요.'); history.go(-1);";
		} else {
			//성공적으로 불러옴
			realpath=response_path+"notice_view";
		}
		model.addAttribute("alerttext", alerttext);		
		model.addAttribute("notice_info", dtoDB);
		return realpath;
	}
	//1:1문의 작성 페이지 접속
	@RequestMapping("inquiryform")
	public String inquiryform(HttpSession session, Model model) {
		String userNum = (String)session.getAttribute("userID");
		String alerttext=""; String realpath="";
		if(userNum==null) {
			//로그인 안 되어 있을 경우
			System.out.println(userNum);
			alerttext="alert('로그인이 필요한 페이지입니다. 로그인 페이지로 이동합니다.');";
			realpath="member/login";
			model.addAttribute("alerttext", alerttext);
		} else {
			//로그인 되어 있을 경우
			realpath=response_path+"inquiryform";
		}
		return realpath;
	}
	/*
	//사용자 1:1문의 작성
	@PostMapping("insert_inquiry")
	public String insert_inquiry(MtmUserDto mtmUserDto, HttpSession session) {
		String userNum = (String)session.getAttribute("userNum");		
		mtmUserDto.setM_num(Integer.parseInt(userNum));
		int success = cservice.insertUserInquiry(mtmUserDto);
		String alerttext="";
		if(success==0) {
			alerttext="alert('문의글을 등록하지 못했습니다. 다시 시도해 주세요.'); history.go(-1);";
		} else {
			alerttext="alert(‘1:1문의글이 등록되었습니다. 답변은 MyPage - 1:1 문의에서 확인하실 수 있습니다.’); location.href='main';";
		}
		return response_path+"inquiryform";
	}*/
}
