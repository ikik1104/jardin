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
import com.javalec.ex.service.CustomerService;
import com.javalec.ex.service.ProductService;

@Controller
public class CustomerController {
	//연지언니랑 겹쳐서 오류날까봐 따로 만들어용
	@Autowired
	private CustomerService csService;
	
	
	//FAQ-------------------------------------------------------------------------------------
	
	
	//faq 화면 노출 Y 리스트
	@RequestMapping("faq_List")
	public String faq_List(HttpServletRequest request, Model model) {
		//전체 검색일 때
		if(request.getParameter("f_step")==null) {
			model.addAttribute("list", csService.getFaqList()); 
		}else {// 카테고리별 검색 일 때
			model.addAttribute("list", csService.getFaq_StepList(request.getParameter("f_step"))); 
			model.addAttribute("f_step", request.getParameter("f_step")); 
		}
		return "customer/faq_all";
	}
	
	
	//main에서 	customer 클릭시 (공지사항으로)
	@RequestMapping("notice_Ulist")
	public String notice_Ulist(Model model) {
		
		return "customer/notice";
	}
	

	
	
}
