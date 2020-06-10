package com.javalec.ex.controller;

import java.sql.Date;
import java.sql.Timestamp;
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

import com.fasterxml.jackson.databind.deser.impl.CreatorCandidate.Param;
import com.javalec.ex.dto.ProductDto;
import com.javalec.ex.service.BService;
import com.javalec.ex.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService pService;

	//admin 제품 전체 리스트
	@RequestMapping("product_list")
	public String product_list(Model model) {
		model.addAttribute("list", pService.getAllPList());
		
		return "admin/product/product_list";
	}
	
	//제품 입력insertForm 으로 이동
	@RequestMapping("product_insertForm")
	public String product_insertForm(Model model) {
		
		return "admin/product/product_write";
	}

	//제품 insert
	@RequestMapping("product_insert")
	public String product_insert(Model model,ProductDto pdto) {
		pService.insertProduct(pdto);
		
		return "redirect:product_list";
	}
	
	//제품 수정updateForm으로 이동
	@RequestMapping("product_updateForm")
	public String product_updateForm(Model model,int p_num) {
		
		model.addAttribute("pdto", pService.getProductInfo(p_num));
		
		return "admin/product/product_update";
	}
	
	//제품 update
	@RequestMapping("product_update")
	public String product_update(Model model,ProductDto pdto) {
		
		pService.updateProduct(pdto);
		
		return "redirect:product_list";
	}	
	
	//제품 삭제처리
	@ResponseBody
	@RequestMapping("product_delete")
	public int product_delete(@RequestBody int p_num, Model model,ProductDto pdto) {
			
		int success= pService.deleteProduct(p_num);
			
		return success;
	}
	
	//삭제된 제품 리스트
	@RequestMapping("product_delList")
	public String product_delList(Model model) {
		
		model.addAttribute("list", pService.getDelPList());
		
		return "admin/product/product_del_list";
	}
	
	//제품 복구처리
	@ResponseBody
	@RequestMapping("product_back")
	public int product_back(@RequestBody int p_num, Model model,ProductDto pdto) {
			
		int success= pService.backProduct(p_num);
			
		return success;
	}
	
	
	//(검색) 검색한 리스트
	@RequestMapping("product_searchList")
	public String product_searchList(@RequestParam HashMap<String, String> map , Model model) {
		
		model.addAttribute("list", pService.getSearchList(map));
		model.addAttribute("map", map);
		
		return "admin/product/product_list";
	}
		
	//user 유저 ------------------------------------------
	
	//쟈뎅 제품뿌리기
	@RequestMapping("u_product_list")
	public String user_product_list(HttpServletRequest request ,  Model model) {
		String p_step1 = request.getParameter("p_step1");
		String p_step2;
		
		if(request.getParameter("p_step2")==null) {
			model.addAttribute("product", pService.getU_ProductAllList(p_step1));
		}else {
			p_step2 = request.getParameter("p_step2");
			model.addAttribute("product", pService.getU_ProductList(p_step2));
		}
		
		model.addAttribute("p_step1", p_step1);
		
		return "product/list";
	}
	
	//제품 하나 상세보기
	@RequestMapping("product_detail")
	public String product_detail(int p_num,  Model model) {

		model.addAttribute("pdto", pService.getProductInfo(p_num));
		
		return "product/detail";
	}
	
	
	
	
}
