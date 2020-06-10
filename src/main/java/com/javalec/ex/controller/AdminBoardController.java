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
import com.javalec.ex.service.ProductService;

@Controller
public class AdminBoardController {
	//연지언니랑 겹쳐서 오류날까봐 따로 만들어용
	@Autowired
	private AdminBoardService abService;
	

	//관리자---------------------------------------
	
	
	//faq--------------------------------------------------------------
	//faq 작성 Form 이동
	@RequestMapping("faq_insertForm")
	public String faq_insertForm(Model model) {
		
		return "admin/board/faq_write";
	}
	
	//faq 작성
	@RequestMapping("faq_insert")
	public String faq_insert(FaqDto fdto, Model model) {
		
		abService.insertFaq(fdto);
		
		return "redirect:faq_allList";
	}
	
	//faq 수정 Form 이동
	@RequestMapping("faq_updateForm")
	public String faq_updateForm(int f_num, Model model) {
		
		model.addAttribute("faq", abService.faqInfo(f_num));
		
		return "admin/board/faq_update";
	}
	
	//faq 수정
	@RequestMapping("faq_update")
	public String faq_update(FaqDto fdto, Model model) {
			
		abService.updateFaq(fdto);
		
		return "redirect:faq_allList";
	}
		
		
	//faq 완전삭제
	@ResponseBody
	@RequestMapping("faq_delete")
	public int faq_delete(@RequestBody int f_num, Model model) {
		
		return abService.deleteFaq(f_num);
	}
	
	//faq 노출여부 변경
	@ResponseBody
	@RequestMapping("faq_delUpdate")
	public int faq_delUpdate(@RequestBody int f_num, Model model) {
		
		return abService.updateFaqDelflag(f_num);
	}
	
	//faq 전체 리스트
	@RequestMapping("faq_allList")
	public String faq_allList(Model model) {
		
		model.addAttribute("list",abService.getAllFaqList());
		
		return "admin/board/faq_list";
	}
	
	//faq 검색기능
	@RequestMapping("getSearchFaq")
	public String getSearchFaq(@RequestParam HashMap<String, Object> map, Model model) {
		model.addAttribute("list",abService.getSearchFaq(map)) ;
		model.addAttribute("map", map);
			
		return "admin/board/faq_list";
	}
	
	//enjoy coffee --------------------------------------------------------------
	
	//enjoy coffee 작성 form으로 이동
	@RequestMapping("enjoy_insertForm")
	public String enjoy_insertForm(Model model) {
		
		return "admin/board/enjoy_coffee_write";
	}
	
	
	//enjoy coffee insert
	@RequestMapping("enjoy_insert")
	public String enjoy_insert(EnjoyCoffeeDto ecDto, Model model) {
		
		abService.enjoy_insert(ecDto);
		
		return "redirect:enjoy_allList";
	}
	
	//enjoy coffee 수정 form으로 이동
	@RequestMapping("enjoy_updateForm")
	public String enjoy_updateForm(int ej_num, Model model) {
		
		model.addAttribute("enjoy", abService.enjoy_info(ej_num)) ;
		
		return "admin/board/enjoy_coffee_update";
	}
	
	
	//enjoy coffee update
	@RequestMapping("enjoy_update")
	public String enjoy_update(EnjoyCoffeeDto ecDto, Model model) {
		
		int result = abService.enjoy_update(ecDto);
		
		System.out.println(result);
		
		return "redirect:enjoy_allList";
	}
	
	
	//enjoy coffee 완전 삭제
	@ResponseBody
	@RequestMapping("enjoy_delete")
	public int enjoy_delete(@RequestBody int ej_num, Model model) {
		
		
		return abService.enjoy_delete(ej_num);
	}
	
	
	//enjoy coffee 전체 리스트(관리자)
	@RequestMapping("enjoy_allList")
	public String enjoy_allList( Model model) {
		
		model.addAttribute("enjoy_coffee", abService.enjoy_allList());
		
		return "admin/board/enjoy_coffee_list";
	}
	
	
	//enjoy coffee 한개의 정보 (상세보기, 수정에 쓰임)
	@RequestMapping("enjoy_info")
	public String enjoy_info(int ej_num, Model model) {
		
		abService.enjoy_info(ej_num);
		
		return "admin/board/enjoy_coffee_write";
	}
	
	//enjoy coffee 검색기능
	@RequestMapping("getSearchEnjoy")
	public String getSearchEnjoy(@RequestParam HashMap<String, Object> map, Model model) {
		model.addAttribute("enjoy_coffee",abService.getSearchEnjoy(map)) ;
		model.addAttribute("map", map);
		
		return "admin/board/enjoy_coffee_list";
	}
	
	
	//유저----------------------------------------
	//faq 화면 노출 Y 리스트
	@RequestMapping("faq_List")
	public String faq_List(HttpServletRequest request, Model model) {
			
		//전체 검색일 때
		if(request.getParameter("f_step")==null) {
			model.addAttribute("list", abService.getFaqList()); 
		}else {// 카테고리별 검색 일 때
			model.addAttribute("list", abService.getFaq_StepList(request.getParameter("f_step"))); 
			model.addAttribute("f_step", request.getParameter("f_step")); 
		}
		
		return "customer/faq";
	}
	
	
	//main에서 	customer 클릭시 (공지사항으로)
	@RequestMapping("notice_Ulist")
	public String notice_Ulist(Model model) {
		
		return "customer/notice";
	}
	
	//main에서  community 클릭시 (후기로)
	@RequestMapping("review_list")
	public String review_list(Model model) {
		//임시~~
		return "community/comment";
	}
	

	//community enjoycoffee list
	@RequestMapping("enjoy_list")
	public String enjoy_list(Model model) {
		
		model.addAttribute("list", abService.enjoy_List()); 
		
		return "community/enjoy";
	}
	
	
	
}
