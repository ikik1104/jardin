package com.javalec.ex.controller;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.javalec.ex.CommonUtils;
import com.javalec.ex.dto.EnjoyCoffeeDto;
import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.dto.QnrAnswerDto;
import com.javalec.ex.dto.QnrUserDto;
import com.javalec.ex.service.AdminBoardService;
import com.javalec.ex.service.ProductService;

@Controller
public class AdminBoardController {
	//연지언니랑 겹쳐서 오류날까봐 따로 만들어용
	@Autowired
	private AdminBoardService abService;
	@Autowired
	CommonUtils utils;
	

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
	public String enjoy_insert(EnjoyCoffeeDto ecDto, MultipartFile enjoy_img, Model model) throws IOException {
		ecDto.setEj_img(utils.FileUploaderCDN(enjoy_img, "enjoy/"));

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
	
	
	//포토 상품 후기
	@RequestMapping("getPhotoReview")
	public String getPhotoReveiw(Model model) {
		
		model.addAttribute("list",abService.getAllReveiw("포토")) ;
		
		return "admin/board/review_photo_list";
	}
	
	//일반 상품 후기
	@RequestMapping("getReveiw")
	public String getReveiw(Model model) {
			
		model.addAttribute("list",abService.getAllReveiw("일반")) ;
			
		return "admin/board/review_list";
	}
	

	//리뷰 노출 여부 변경
	@ResponseBody
	@RequestMapping("updateStatus")
	public int updateStatus(@RequestBody int ru_num, Model model) {
			
		return abService.updateVisility(ru_num);
	}
	
	
	//상품후기 검색기능
	@RequestMapping("getSearchReview")
	public String getSearchReview(@RequestParam HashMap<String, Object> map, Model model) {
		model.addAttribute("list",abService.getSearchReview(map)) ;
		model.addAttribute("map", map);
			
		return "admin/board/review_list";
	}
	
	//리뷰 상세보기
	@RequestMapping("getReviewDetail")
	public String getReviewDetail(@RequestParam int ru_num, Model model) {
		model.addAttribute("ruDto",abService.getReviewDetail(ru_num)) ;
			
		return "admin/board/review_view";
	}
	
	//qna-------------------------------------------------------------------------------------
	
	//qna 전체 리스트
	@RequestMapping("getQnaList")
	public String getQnaList(Model model) {
		
		model.addAttribute("list",abService.getQnaList()) ;
		System.out.println(abService.getQnaList());
		
		return "admin/board/qna_list";
	}
	
	//답글달기 창(팝업으로 이동)
	@RequestMapping("insertAnswerForm")
	public String insertAnswerForm(String qu_content,int qu_num, Model model) {
		
		model.addAttribute("dto",abService.qnaInfo(qu_num));
		
		return "admin/board/qna_insert_pop";
	}
	
	//답글달기
	@ResponseBody
	@RequestMapping("qna_answer_insert")
	public int qna_answer_insert(@RequestBody String[] values ,Model model) {
		QnrAnswerDto qaDto = new QnrAnswerDto();
		qaDto.setQu_num(Integer.parseInt(values[0]));
		qaDto.setQa_content(values[1]);
		
		return abService.qna_answer_insert(qaDto);
	}
	
	//답글 수정 form으로 이동
	@RequestMapping("updateAnswerForm")
	public String updateAnswerForm(int qu_num ,Model model) {
		
		//qu_num으로 답변정보 빼오기
		model.addAttribute("dto", abService.qna_answer_info(qu_num));
		
		return "admin/board/qna_update_pop";
	}
	
	//답글 수정하기
	@ResponseBody
	@RequestMapping("qna_answer_update")
	public int qna_answer_update(@RequestBody String[] values ,Model model) {
		QnrAnswerDto qaDto = new QnrAnswerDto();
		qaDto.setQa_num(Integer.parseInt(values[0]));
		qaDto.setQa_content(values[1]);
		
		return abService.qna_answer_update(qaDto);
	}
	
	
	//답글 삭제(답변대기상태로 돌아간)
	@ResponseBody
	@RequestMapping("qna_answer_delete")
	public int qna_answer_delete(@RequestBody int qu_num ,Model model) {
			
		return abService.qna_answer_delete(qu_num);
	}
	
	
	//질문과 답변 검색기능
	@RequestMapping("getSearchQna")
	public String getSearchQna(@RequestParam HashMap<String, Object> map, Model model) {
		model.addAttribute("list",abService.getSearchQna(map)) ;
		model.addAttribute("map", map);
			
		return "admin/board/qna_list";
	}
	
	
	
}
