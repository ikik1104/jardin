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
		
		model.addAttribute("event_info", eservice.getEventBoard(eventDto));
		model.addAttribute("ecomment_list", eservice.getTheEComments(eventDto));		
		return response_path+"user_event_view";
	}
	//댓글 비밀번호 확인하기
	@ResponseBody
	@PostMapping("ec_pw_check")
	public int ec_pw_check(E_CommentDto e_CommentDto, @RequestBody String mode, Model model) {
		String[] trims = mode.split("mode=");//m_num=2&mode=otherOriginal&e_num=24+&ec_pw=1234
		String[] trims2 = trims[1].split("&");//otherOriginal&e_num=24+&ec_pw=1234
		String return_mode = trims2[0];//otherOriginal
		
		int success = eservice.checkECommentPW(e_CommentDto);
		
		if(success==1) {
			switch(return_mode) {
			case "otherOriginal" : success=-1; break;
			case "myOriginal" : success=-2; break;
			case "myModify" : success=-3; break;		
			}
		} else {
			
		}
		System.out.println(success);
		return success;
	}
	
	
	//댓글 1개 새로 등록
	@ResponseBody
	@PostMapping("ecomment_insert")
	public int ecomment_insert(E_CommentDto e_CommentDto) {
	System.out.println("들어옴");
		int success = eservice.insertEComment(e_CommentDto);
		System.out.println("나감");
		System.out.println(success);
		return success;
	}
	
	
	
}
