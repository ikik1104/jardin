package com.javalec.ex.controller;

import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.EnjoyCoffeeDto;
import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.service.AdminBoardService;
import com.javalec.ex.service.CommunityService;
import com.javalec.ex.service.ProductService;

@Controller
public class CommunityController {
	//연지언니랑 겹쳐서 오류날까봐 따로 만들어용
	@Autowired
	private CommunityService cmService;
	@Autowired
	private AdminBoardService abService;
	
	
	//review------------------------------------------------------------------------------
	
	//main에서  community 클릭시 (후기로)
	@RequestMapping("review_list")
	public String review_list(Model model) {
		//임시~~
		return "community/comment";
	}
	

	
	//enjoy_coffee-------------------------------------------------------------------------
	
	//enjoy coffee list
	@RequestMapping("enjoy_list")
	public String enjoy_list(Model model) {
		
		model.addAttribute("list", cmService.enjoy_List()); 
		
		return "community/enjoy";
	}
	
	//enjoy coffee 상세보기
	@RequestMapping("enjoy_view")
	public String enjoy_view(int ej_num, int rownum, Model model) {
			
		cmService.enjoy_hitUp(ej_num); //조회수 증가
		model.addAttribute("enjoy", abService.enjoy_info(ej_num)); //하나의 정보
			
		return "community/enjoy_view";
	}
	
	
	
}
