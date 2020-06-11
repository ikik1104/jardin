package com.javalec.ex.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.ex.service.AdminMemberManagementService;

@Controller
public class AdminMemberManagementContoller {

	String response_path = "admin/member/";
	
	@Autowired
	AdminMemberManagementService managementservice;
	
	//테스트 페이지
	@RequestMapping("test")
	public String test() {
		return response_path+"test";
	}
	
	//회원 등급 전체 리스트 불러오기
	@RequestMapping("member_level_list")
	public String member_level_list(Model model) {
		model.addAttribute("member_list", managementservice.getAllLevels());
		return response_path+"member_level_list";
	}
	
	//선택한 회원 등급 일괄 변경
	@RequestMapping("member_level_change")
	public String member_level_change(HttpServletRequest request,
			@RequestParam("select_level") String select_level,
			Model model) {
		String[] id_arr = request.getParameterValues("chk_ids");
		HashMap<String, String> idmap = new HashMap<String, String>();
		
		for(int i=0; i<id_arr.length; i++) {
			idmap.put("item"+(i+1), id_arr[i]);
			System.out.println(idmap.get("item"+(i+1)));
		}
		
		int success = managementservice.modifyLevels(idmap, select_level);
		String alerttext="";
		
		if(success==0) alerttext="alert('등급을 변경하지 못했습니다. 다시 시도해 주세요.'); history.go(-1);";
		if(success>=1) alerttext="alert('등급을 변경했습니다.'); location.href='member_level_list'";
		
		model.addAttribute("alerttext", alerttext);
		return response_path+"member_level_list";
		
	}
	

}
