package com.javalec.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.ex.dto.ProductDto;
import com.javalec.ex.service.BService;
import com.javalec.ex.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService pService;

	//제품 전체 리스트
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
	
	
}
