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
import com.javalec.ex.dto.CartDto;
import com.javalec.ex.dto.ProductDto;
import com.javalec.ex.dto.QnrUserDto;
import com.javalec.ex.dto.ReviewUserDto;
import com.javalec.ex.service.BService;
import com.javalec.ex.service.ProductService;

import oracle.net.aso.k;

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
		String p_step2 = null;
		
		if(request.getParameter("p_step2")==null) {
			model.addAttribute("product", pService.getU_ProductAllList(p_step1));
		}else {
			p_step2 = request.getParameter("p_step2");
			model.addAttribute("product", pService.getU_ProductList(p_step2));
		}
		
		model.addAttribute("p_step1", p_step1);
		model.addAttribute("p_step2", p_step2);
		
		return "product/list";
	}
	
	//제품 하나 상세보기
	@RequestMapping("product_detail")
	public String product_detail(int p_num,  Model model) {
		model.addAttribute("pdto", pService.getProductInfo(p_num));
		//일단은 포토랑 일반 나눠서? 따로페이징을 해야하니까!!..?
		
		//일반후기
		Map<String, Object> basic = new HashMap<>();
		basic.put("ru_type", "일반");
		basic.put("p_num", p_num);
		model.addAttribute("review", pService.getUserReview(basic));
		System.out.println(pService.getUserReview(basic));
		
		//포토후기
		Map<String, Object> photo = new HashMap<>();
		photo.put("ru_type", "포토");
		photo.put("p_num", p_num);
		model.addAttribute("photo", pService.getUserReview(photo));
		System.out.println(pService.getUserReview(photo));
		
		//리뷰 카운트 가져오기
		model.addAttribute("count", pService.review_count(p_num));

		//질문과 답변
		model.addAttribute("qna",pService.qunOne(p_num));
		System.out.println(pService.qunOne(p_num));
		
		return "product/detail";
	}
	
//	메인에서 제품 검색
	@RequestMapping("main_search")
	public String main_search(String keyword,  Model model) {
		
		model.addAttribute("list", pService.searchProduct(keyword));
		model.addAttribute("keyword", keyword);
		
		return "product/search";
	}
	
	//메인에서 제품 검색 정렬
	@RequestMapping("search_sort")
	public String search_sort(String keyword, String sort,  Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("sort", sort);
		
		model.addAttribute("list", pService.search_sort(map));
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		
		return "product/search";
	}
	
	//리뷰--------------------------------------------
	
	//☆★☆★☆★☆★☆★☆★☆★☆★ 리뷰 입력폼으로 20/06/10 임시 ☆★☆★☆★☆★☆★☆★☆★☆★
	@RequestMapping("review_insertForm")
	public String review_insertForm(int p_num, int m_num ,Model model) {
		
		//유저의 정보는 세션에서 가져오고..
		//해당 제품의 정보는 가져와여한다.
		model.addAttribute("pdto", pService.getProductInfo(p_num));
		model.addAttribute("m_num", m_num);
		
		return "product/photo";
	}
	
	//☆★☆★☆★☆★☆★☆★☆★☆★ 리뷰 입력폼으로 20/06/10 임시 ☆★☆★☆★☆★☆★☆★☆★☆★
	@RequestMapping("review_insert")
	public String review_insert(ReviewUserDto ruDto,Model model) {
		
		int chk = pService.review_insert(ruDto);
		//제품의 스코어 업데이트
		pService.update_score(ruDto.getP_num());
		
		return "product/photo";
	}

	
	//문의하기 form으로 이동
	@RequestMapping("inquiry_form")
	public String inquiry_form(int p_num, Model model) {
		
		//m_num 세션으로 받을지....
//		model.addAttribute("m_num", m_num);
		model.addAttribute("p_num", p_num);
		
		return "product/inquiry";
	}
	
	//문의하기 insert
	@RequestMapping("inquiry_insert")
	public String inquiry_form(QnrUserDto quDto, Model model) {
		
		//m_num 세션으로 받을지....
		pService.inquiry_insert(quDto);
		
		return "product/inquiry";
	}
	
	//장바구니로 이동~~~!~!!~
	@ResponseBody
	@RequestMapping("cart_insert")
	public int cart_insert(@RequestBody int[] val, Model model) {
		CartDto cdto = new CartDto();
		cdto.setCa_amount(val[0]);
		cdto.setP_num(val[1]);
		
		return pService.cart_insert(cdto);
	}
	
	
}
