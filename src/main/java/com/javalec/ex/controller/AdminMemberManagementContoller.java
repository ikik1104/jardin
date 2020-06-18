package com.javalec.ex.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.LevelDto;
import com.javalec.ex.service.AdminMemberManagementService;

@Controller
public class AdminMemberManagementContoller {
	
	/*
	 * [관리자]
	 * 등급
	 * */

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
	
	//등급 전체 리스트 가져오기
	@RequestMapping("member_level_management")
	public String member_level_management(Model model) {
		model.addAttribute("level_list", managementservice.getAllLevelSorts());
		return response_path+"member_level_management";
	}
	
	//등급 추가 페이지 접속
	@RequestMapping("level_write")
	public String level_write(Model model) {
		model.addAttribute("level_list", managementservice.getAllLevelSorts());
		return response_path+"level_write";
	}
	
	//새 등급 1개 추가
	@RequestMapping("level_insert")
	public String level_insert(LevelDto levelDto, 
			@RequestParam("directOrder") int directOrder,
			Model model) {
		if(levelDto.getLv_order()==-99) levelDto.setLv_order(directOrder);//등급순서를 직접 입력할 경우
		
		int success = managementservice.insertLevel(levelDto);
		String alerttext="";
		if(success==0) alerttext="alert('등급을 추가하지 못했습니다. 다시 시도해 주세요.'); history.go(-1);";
		if(success>=1) alerttext="alert('등급을 추가했습니다.'); location.href='member_level_management'";	
		model.addAttribute("alerttext", alerttext);		
		return response_path+"level_write";
	}
	
	//등급 1개 조회
	@RequestMapping("level_view")
	public String level_view(LevelDto levelDto, Model model) {
		
		model.addAttribute("level_info", managementservice.getLevelInfo(levelDto));
		model.addAttribute("level_list", managementservice.getAllLevelSorts());		
		return response_path+"level_view";
	}
	
	//등급 1개 삭제
	@ResponseBody
	@RequestMapping("level_delete")
	public int level_delete(@RequestBody int lv_num) {
		int success = managementservice.deleteLevel(lv_num);
		return success;
	}
	
	//등급 1개 수정
	@RequestMapping("level_modify")
	public String level_modify(LevelDto levelDto, 
			@RequestParam("directOrder") int directOrder,
			@RequestParam("defaultOrder") int defaultOrder,
			Model model) {
		//수정 안 한 항목 있는지 체크
		switch(levelDto.getLv_order()) {
		case -1 : levelDto.setLv_order(defaultOrder);  break;
		case -99 : levelDto.setLv_order(directOrder); break;
		}
		
		int success = managementservice.modifyLevel(levelDto);
		String alerttext="";
		if(success==0) alerttext="alert('등급을 수정하지 못했습니다. 다시 시도해 주세요.'); history.go(-1);";
		if(success>=1) alerttext="alert('등급을 수정했습니다.'); location.href='level_view?lv_num="+levelDto.getLv_num()+"'";	
		model.addAttribute("alerttext", alerttext);		
		return response_path+"level_view";
	}

}
