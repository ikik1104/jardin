package com.javalec.ex.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.service.AdminBoardService;
import com.javalec.ex.service.ProductService;

@Controller
public class AdminBoardController {
	//연지언니랑 겹쳐서 오류날까봐 따로 만들어용
	@Autowired
	private AdminBoardService abService;
	

	//관리자---------------------------------------
	
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
	
	
	//유저----------------------------------------
	//faq 화면 노출 Y 리스트
	@RequestMapping("faq_List")
	public String faq_List(Model model) {
			
		abService.getFaqList();	
		
		return "admin/board/product_list";
	}
	
}
