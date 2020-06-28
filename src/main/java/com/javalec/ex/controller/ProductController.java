package com.javalec.ex.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.deser.impl.CreatorCandidate.Param;
import com.javalec.ex.CommonUtils;
import com.javalec.ex.dto.CartDto;
import com.javalec.ex.dto.PageDto;
import com.javalec.ex.dto.ProductDto;
import com.javalec.ex.dto.QnrUserDto;
import com.javalec.ex.dto.ReviewUserDto;
import com.javalec.ex.service.BService;
import com.javalec.ex.service.CommunityService;
import com.javalec.ex.service.MP1Service;
import com.javalec.ex.service.ProductService;

import oracle.net.aso.k;

@Controller
public class ProductController {
	@Autowired
	private ProductService pService;
	@Autowired
	CommonUtils utils;
	@Autowired
	private MP1Service mp1Service;
	

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
	public String product_insert(Model model,ProductDto pdto,MultipartFile thumb_img1, MultipartFile thumb_img2,MultipartFile thumb_img3,MultipartFile content_img)throws IOException {
		/*
		 * 이렇게 안하셔도 됩니다... dto 모양으로 받을 수 있는데 파일첨부시 넘어가는 name을 dto와 다르게 설정해서 dto로 들어가지 않도록만 설정해주세욤
		 * ex) 파라미터에 ProductDto pdto, MultipartFile img1,MultipartFile img2,... (dto에 선언된 변수 명과 겹치지 않게)로 받아서 
		 * pdto.setP_thumb_img1(utils.FileUploderCDN(img1,"폴더명"));
		 * 
		 */
		
		
		pdto.setP_thumb_img1(utils.FileUploaderCDN(thumb_img1, "product/"));
		pdto.setP_content_img(utils.FileUploaderCDN(content_img, "product/"));
		//null 가능한 이미지들
		
		if(thumb_img2.isEmpty()==false) {
			pdto.setP_thumb_img2(utils.FileUploaderCDN(thumb_img2, "product/"));
		}
		
		if(thumb_img3.isEmpty()==false) {
			pdto.setP_thumb_img3(utils.FileUploaderCDN(thumb_img3, "product/"));
		}
		
		pService.insertProduct(pdto);
		
		return "redirect:product_list";
	}
	

	/*제품 insert
	@RequestMapping("product_insert")
	public String product_insert(Model model,ProductDto pdto) {
		pService.insertProduct(pdto);
		
		return "redirect:product_list";
	}
	*/
	
	//제품 수정updateForm으로 이동
	@RequestMapping("product_updateForm")
	public String product_updateForm(Model model,int p_num) {
		
		model.addAttribute("pdto", pService.getProductInfo(p_num));
		
		return "admin/product/product_update";
	}
	
	//제품 update
	@RequestMapping("product_update")
	public String product_update(Model model,ProductDto pdto,MultipartFile thumb_img1, MultipartFile thumb_img2,MultipartFile thumb_img3,MultipartFile content_img)throws IOException {
		
			//필수로 파일이 첨부되어야 하는 이미지들
			if(thumb_img1.isEmpty()==false){ //이미지가 새로 입력이 되면
				System.out.println("썸넿1 업로드");
				pdto.setP_thumb_img1(utils.FileUploaderCDN(thumb_img1, "product/"));
			}
			//null 가능한 이미지들
			if(thumb_img2.isEmpty()==false){ //이미지가 새로 입력이 되면 & null가능 컬럼
				System.out.println("섬넬2 업로드");
				pdto.setP_thumb_img2(utils.FileUploaderCDN(thumb_img2, "product/"));
			}
			if(thumb_img3.isEmpty()==false) {
				System.out.println("섬넿 3 업로드");
				pdto.setP_thumb_img3(utils.FileUploaderCDN(thumb_img3, "product/"));
			}
			//null 가능한 이미지들
			
			if(content_img.isEmpty()==false){ //이미지가 새로 입력이 되면 & null가능 컬럼
				System.out.println("content 업로드");
				pdto.setP_content_img(utils.FileUploaderCDN(content_img, "product/"));
			}
		
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
	
	/*
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
		
		//리뷰 카운트 가져오기
		model.addAttribute("count", pService.review_count(p_num));

		//질문과 답변
		model.addAttribute("qna",pService.qunOne(p_num));
		
		return "product/detail";
	}
	*/
	//제품 상세보기 페이지로!
	@RequestMapping("product_detail")
	public String product_detail(int p_num,  Model model,HttpServletRequest request,PageDto pageDto,HttpSession session,
		@RequestParam(value = "p_page", defaultValue = "1") String p_page,
		@RequestParam(value = "b_page", defaultValue = "1") String b_page,
		@RequestParam(value = "q_page", defaultValue = "1") String q_page,
		@RequestParam(value = "initVal", defaultValue = "0") String initVal) {
		model.addAttribute("pdto", pService.getProductInfo(p_num));
		//일단은 포토랑 일반 나눠서? 따로페이징을 해야하니까!!..?
		
		//일반후기
		//일반 상품평의 수
		int basic_total = pService.pageReviewCount("일반", p_num);
		int basicPage = 4;
		if(b_page == null) { b_page = "1"; }
		pageDto = new PageDto(basic_total, Integer.parseInt(b_page), basicPage);
		model.addAttribute("basicPaging", pageDto);
		model.addAttribute("basic", pService.pageReviewList(pageDto, p_num, "일반")); 
		
		//포토 후기
		//포토 상품평의 수
		int photo_total = pService.pageReviewCount("포토", p_num);
		int photoPage = 3;
		if(p_page == null) { p_page = "1"; }
		pageDto = new PageDto(photo_total, Integer.parseInt(p_page), photoPage);
		model.addAttribute("photoPaging", pageDto);
		model.addAttribute("photo", pService.pageReviewList(pageDto, p_num, "포토")); 
		
		
		//질문과 답변
		//질문의 수
		int qna_total = pService.qnaUserCount(p_num);
		int qnaPage = 3;
		if(q_page == null) { q_page = "1"; }
		pageDto = new PageDto(qna_total, Integer.parseInt(q_page), qnaPage);
		model.addAttribute("qnaPaging", pageDto);
		model.addAttribute("qna", pService.qnaList(pageDto, p_num));
		
		
		model.addAttribute("reviewCount", (pService.pageReviewCount("포토", p_num)+pService.pageReviewCount("일반", p_num)));
		model.addAttribute("qnaCount", qna_total);
		model.addAttribute("initVal", initVal);
		
		System.out.println(session.getAttribute("userNum"));
		
		
		return "product/detail";
	}
	
	@ResponseBody
	@RequestMapping("photoPaging")
	public Map<String,Object> photoPaging(@RequestBody Map<String, String> map, Model model,HttpServletRequest request,PageDto pageDto) {
		
		System.out.println("넘어온 p_num : "+map.get("p_num"));
		System.out.println("넘어온 page : "+ map.get("page"));
		
		
		//포토
		//포토 상품평의 수
		int photo_total = pService.pageReviewCount("포토", Integer.parseInt(map.get("p_num")));
		int photoPage = 4;
		String page = map.get("page"); //열려야하는 페이지
		if(page == null) { page = "1"; }
		pageDto = new PageDto(photo_total, Integer.parseInt(page), photoPage);
		
		//map으로 넘겨보자....!
		Map<String,Object> map2 = new HashMap<String, Object>();

		map2.put("photoPaging", pageDto);
		map2.put("photo", pService.pageReviewList(pageDto, Integer.parseInt((String)map.get("p_num")), "포토"));

		return map2;
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
	public String review_insertForm(int p_num, int m_num ,Model model,HttpSession session) {
		if(session.getAttribute("userNum") == null) {return "redirect:product_detail?p_num="+p_num;}
		else {model.addAttribute("userNum", session.getAttribute("userNum"));}
		
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
	@ResponseBody
	@RequestMapping("inquiry_insert")
	public int inquiry_form(@ModelAttribute QnrUserDto quDto, Model model) {
		System.out.println(quDto.getM_num());
		
		return pService.inquiry_insert(quDto);
	}
	
	//장바구니로 이동~~~!~!!~
	@ResponseBody
	@RequestMapping("cart_insert")
	public int cart_insert(@RequestBody int[] val, HttpSession session, Model model) {
		int success=1;
		int cartChk=0;
		// 회원 장바구니 담기
		if(session.getAttribute("userNum") != null) {
			int m_num = (Integer)session.getAttribute("userNum");
			List<CartDto> cdtos = mp1Service.getAllCart(m_num);
			// 장바구니에 동일 제품 존재 시, 제품 수량만 업데이트
			if(cdtos.size()>0) {
				for(int i=0; i<cdtos.size();i++) {
					if(cdtos.get(i).getP_num()==val[0]) {
						int p_num = cdtos.get(i).getP_num();
						int p_amt = cdtos.get(i).getCa_amount()+val[1];
						mp1Service.cartUpdate(m_num, p_num, p_amt);
						cartChk=1;
						break;
					}
				}
			}
			//장바구니에 동일 제품 없으면, 새로 추가 
			if(cartChk==0) {
				CartDto cdto = new CartDto();
				cdto.setM_num(m_num);
				cdto.setP_num(val[0]);
				cdto.setCa_amount(val[1]);
				success = pService.cart_insert(cdto);
			}
		}else {
			ArrayList<String> arr = (ArrayList<String>)(session.getAttribute("nonmem_cart"));
			String value = val[0]+"_"+val[1];
			System.out.println(value);
			int sessionChk=0;
			/* arr에 아무것도 없는 경우 새로 생성 */
			if(session.getAttribute("nonmem_cart")==null) {
				arr = new ArrayList<String>();
			}else {
				for(int i=0; i<arr.size(); i++) {
					if(arr.get(i).toString().contains(val[0]+"")) {
						String[] sp = arr.get(i).split("_");
						arr.set(i, val[0]+"_"+(val[1]+Integer.parseInt(sp[1])));
						sessionChk=1;
						break;
					} // 같은 상품이 이미 장바구니에 담겨있는 경우, 개수만 업데이트
				}
			}
			if(sessionChk==0) {
				arr.add(value);
			}
			session.setAttribute("nonmem_cart", arr);
			System.out.println(session.getAttribute("nonmem_cart"));
		}
		return success;
	}
	
//	//리뷰 수정 "mypage/my_review_write"
//	@RequestMapping("updateReviewForm")
//	public String updateReviewForm( Model model) {
//		
//		//m_num 세션으로 받을지....
//		pService.inquiry_insert(quDto);
//		
//		return  "mypage/my_review_write"
//	}
//	
}
