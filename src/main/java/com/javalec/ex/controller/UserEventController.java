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
import com.javalec.ex.dto.E_CommentDto;
import com.javalec.ex.dto.EventDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.NoticeDto;
import com.javalec.ex.dto.ReceiverDto;
import com.javalec.ex.dto.UtilDto;
import com.javalec.ex.service.AdminCouponService;
import com.javalec.ex.service.UserCustomerService;
import com.javalec.ex.service.UserEventService;
import com.javalec.ex.service.UserMemberService;

@Controller
public class UserEventController {
	
	/*
	 * [사용자]
	 * 이벤트
	 * */
	
	String response_path="event/";
	
	@Autowired
	UserEventService eservice;
	
	//이벤트 전체 리스트 불러오기
	@RequestMapping("event")
	public String event(Model model) {
		model.addAttribute("event_list", eservice.getAllEvents());
		return response_path+"event";
	}
	
	//이벤트 1개 불러오기
	@RequestMapping("user_event_view")
	public String user_event_view(EventDto eventDto, Model model, HttpServletRequest request) {
		String e_num = request.getParameter("e_numCheck");
		String checkMode = request.getParameter("checkMode");
		if(!(e_num=="" || e_num==null)) {//비밀번호 조회하고 돌아올 경우
			eventDto.setE_num(Integer.parseInt(e_num));
			model.addAttribute("checkflag", 1);
			model.addAttribute("checkMode", checkMode);
		}
		model.addAttribute("event_info", eservice.getEventBoard(eventDto));
		model.addAttribute("ecomment_list", eservice.getTheEComments(eventDto));		
		return response_path+"user_event_view";
	}
	//댓글 비밀번호 확인하기
	@ResponseBody
	@RequestMapping("ec_pw_check")
	public int ec_pw_check(@RequestBody String pw_mnum, Model model) {
		String new_pw_num = pw_mnum.substring(0, pw_mnum.length()-1);
		System.out.println("pw_num : "+new_pw_num);
		String[] strs = new_pw_num.split("pleasegogo");
		System.out.println(strs[0]); System.out.println(strs[1]);
		String pw = strs[0];
		int m_num = Integer.parseInt(strs[1]);
		E_CommentDto e_CommentDto = new E_CommentDto();
		e_CommentDto.setEc_pw(pw);
		e_CommentDto.setM_num(m_num);
		
		int success = eservice.checkECommentPW(e_CommentDto);
		return success;
	}
	
	
	//댓글 1개 새로 등록
	@ResponseBody
	@PostMapping("ecomment_insert")
	public int ecomment_insert(E_CommentDto e_CommentDto) {
	
		int success = eservice.insertEComment(e_CommentDto);
		return success;
	}
	
	
	
}
