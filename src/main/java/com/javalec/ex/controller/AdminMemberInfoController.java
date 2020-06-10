package com.javalec.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.service.ADBService;
import com.javalec.ex.service.AdminMemberInfoService;

@Controller
public class AdminMemberInfoController {

	/*
	 * [관리자]
	 * 회원정보
	 * */
	
	String response_path = "admin/member/";//보내는 경로

	@Autowired
	private AdminMemberInfoService infoservice;	
	
	//회원 전체 리스트 불러오기
	@RequestMapping("member_list")
	public String member_list(Model model) {
		model.addAttribute("member_list", infoservice.getAllMembers());
		return response_path+"member_list";
	}
	
	//회원 1명 정보 불러오기
	@RequestMapping("member_view")
	public String member_view(MemberDto memberDto, Model model) {
		model.addAttribute("member_info", infoservice.getMember(memberDto));
		return response_path+"member_view";
	}
	
	//회원 1명 정보 수정
	@PostMapping("member_modify")
	public String member_modify(MemberDto memberDto,
			@RequestParam("pw") String pw, @RequestParam("level") String level,
			Model model
			) {
	
		int success = infoservice.modifyMember(memberDto);
		String alerttext="";
		switch(success) {
		case 0 : alerttext="alert('회원정보를 수정하지 못했습니다. 다시 시도해 주세요.'); history.go(-1);"; break;
		case 1 : alerttext="alert('회원정보을 수정했습니다.'); location.href='member_view?m_num="+memberDto.getM_num()+"';"; break;
		}
		model.addAttribute("alerttext", alerttext);		
		return response_path+"member_view";
		
	}

	
}
