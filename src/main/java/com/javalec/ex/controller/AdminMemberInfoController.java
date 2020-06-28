package com.javalec.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		System.out.println(memberDto.getM_num());
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
	
	//회원 1명 탈퇴 처리
	@ResponseBody
	@RequestMapping("member_delete")
	public int member_delete(@RequestBody int m_num) {
		int success = infoservice.deleteMember(m_num);
		return success;
	}

	//휴면 회원 전체 리스트 불러오기(회원 일괄 휴면<->가입 전환 포함)
	@RequestMapping("member_sleep_list")
	public String member_sleep_list(Model model) {
		model.addAttribute("member_list", infoservice.getAllSleepMembers());
		return response_path+"member_sleep_list";
	}
	//휴면 회원 정보 1개 보기
	@RequestMapping("member_sleep_view")
	public String member_sleep_view(MemberDto memberDto, Model model) {
		model.addAttribute("member_info", infoservice.getSleepMember(memberDto));
		return response_path+"member_sleep_view";
	}
	
	//탈퇴 회원 전체 리스트 불러오기
	@RequestMapping("member_left_list")
	public String member_left_list(Model model) {
		model.addAttribute("member_list", infoservice.getLeftMembers());
		return response_path+"member_left_list";
	}
	
	//탈퇴 회원 정보 1개 불러오기
	@RequestMapping("member_left_view")
	public String member_left_view(MemberDto memberDto ,Model model) {
		model.addAttribute("member_info", infoservice.getLeftMember(memberDto));
		return response_path+"member_left_view";
	}
	
	//탈퇴 회원 1명 영구 삭제
	@ResponseBody
	@RequestMapping("member_forever_delete")
	public int member_forever_delete(@RequestBody int m_num) {
		int success=infoservice.deleteForeverMember(m_num);
		return success;
	}
	
	//선택 회원 일괄 탈퇴처리
	@ResponseBody
	@RequestMapping("mem_some_delete")
	public int mem_some_delete(@RequestBody int[] chkArray) {
		int success = infoservice.deleteSomeMems(chkArray);
		return success;
	}	
	//선택 탈퇴 회원 일괄 영구삭제
	@ResponseBody
	@RequestMapping("mem_some_forever_delete")
	public int mem_some_forever_delete(@RequestBody int[] chkArray) {
		int success = infoservice.deleteSomeForeverMems(chkArray);
		return success;
	}		
}
