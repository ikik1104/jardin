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
	

}
