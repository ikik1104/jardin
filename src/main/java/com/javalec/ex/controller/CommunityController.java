package com.javalec.ex.controller;

import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.EnjoyCoffeeDto;
import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.dto.PageDto;
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
	
	
	//enjoy_coffee   -------------------------------------------------------------------------
	
	//enjoy coffee list
	@RequestMapping("enjoy_list")
	public String enjoy_list(PageDto pageDto, HttpServletRequest request, Model model) {
		
		//유저에게 보여줄 상품평 리스트
		int total = cmService.countEnjoy();
		
		int cntPerPage = 4;
		String page = request.getParameter("page"); //열려야하는 페이지
		if(page == null) { page = "1"; }
		
		pageDto = new PageDto(total, Integer.parseInt(page), cntPerPage);
		
		model.addAttribute("paging", pageDto);
		
		model.addAttribute("list", cmService.enjoy_List(pageDto)); 
		
		return "community/enjoy";
	}
	
	//enjoy coffee 상세보기
	@RequestMapping("enjoy_view")
	public String enjoy_view(int ej_num, int rownum,int page,HttpSession session, Model model) {
			
		System.out.println("rownum"+rownum);
		model.addAttribute("userNum", session.getAttribute("userNum"));//세션체크
		cmService.enjoy_hitUp(ej_num); //조회수 증가
		model.addAttribute("page", page); //현재 페이지(목록으로 버튼때문에)
		model.addAttribute("rownum", rownum);
		model.addAttribute("enjoy", abService.enjoy_info(ej_num)); //하나의 정보
		model.addAttribute("pre_title", cmService.getEnjoyPreTitle(rownum)); //이전글 제목 불러오기
		model.addAttribute("next_title", cmService.getEnjoyNextTitle(rownum)); //다음글 제목 불러오기

		return "community/enjoy_view";
	}
	
	//review   ------------------------------------------------------------------------------
	
	//main에서  community 클릭시 (후기로)
	@RequestMapping("review_list")
	public String review_list(PageDto pageDto,String ru_type ,HttpServletRequest request, Model model) {
		System.out.println(ru_type);
		
		if(ru_type.equals("photo") || ru_type.equals("포토")) {
			//유저에게 보여줄 상품평 리스트
			int total = cmService.countReview("포토");
			
			int cntPerPage = 10;
			String page = request.getParameter("page"); //열려야하는 페이지
			if(page == null) { page = "1"; }
			
			pageDto = new PageDto(total, Integer.parseInt(page), cntPerPage);
			
			model.addAttribute("paging", pageDto);
			model.addAttribute("list", cmService.review_list("포토",pageDto));
			//유저에게 보여줄 상품평 리스트
			model.addAttribute("type", "photo");
		}else {
			//유저에게 보여줄 상품평 리스트
			int total = cmService.countReview("일반");
			
			int cntPerPage = 10;
			String page = request.getParameter("page"); //열려야하는 페이지
			if(page == null) { page = "1"; }
			
			pageDto = new PageDto(total, Integer.parseInt(page), cntPerPage);
			
			model.addAttribute("paging", pageDto);
			model.addAttribute("list", cmService.review_list("일반",pageDto));
			model.addAttribute("type", "basic");
		}
		
		
		return "community/comment";
	}
	
	
	//리뷰 상세보기
	@RequestMapping("review_detail")
	public String review_detail(int rownum,int ru_num,int page,String ru_type,Model model,HttpSession session) {
		System.out.println("넘어온 rownum = "+rownum);
		//유저에게 보여줄 리뷰의 정보 (댓글까지 같이 가져옴)
		
		
		model.addAttribute("userNum", session.getAttribute("userNum"));//세션체크
		cmService.review_hit(ru_num);
		model.addAttribute("page", page); //현재 페이지(목록으로 버튼때문에)
		model.addAttribute("rownum", rownum);
		model.addAttribute("dto", cmService.review_detail(ru_num)); 
		model.addAttribute("pre_title", cmService.getPreTitle(ru_type, rownum)); //이전글 제목 불러오기
		model.addAttribute("next_title", cmService.getNextTitle(ru_type, rownum)); //다음글 제목 불러오기
			
		return "community/comment_view";
	}
	
	//리뷰 삭제하기
	@ResponseBody
	@RequestMapping("delReview")
	public int delReview(@RequestBody int ru_num,Model model) {
		
		return cmService.delReview(ru_num);
	}
	
	//리뷰 수정 폼으로 이동 (팝업창)
	@RequestMapping("updateReviewForm")
	public String updateReviewForm(int ru_num,Model model) {
		
		//리뷰 하나의 정보 가져오기
		model.addAttribute("dto", cmService.review_detail(ru_num));
			
		return "product/updateReviewForm";
	}
	
	
}
