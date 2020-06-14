package com.javalec.ex.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javalec.ex.dto.PageDto;
import com.javalec.ex.dto.ReviewUserDto;
import com.javalec.ex.service.OrderCheckService;
import com.javalec.ex.service.ProductService;

@Controller
public class MyOrderController {

	@Autowired
	private OrderCheckService ocService;
	@Autowired
	private ProductService pService;
	
	//전체 주문리스트 불러오기
	@RequestMapping("ordercheck")
	public String ordercheck(PageDto pageDto, HttpSession session, HttpServletRequest request, Model model) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		
		String m_id = (String) session.getAttribute("userID");//페이징, 주문리스트 가져오기에 m_id를 넘겨줘야 하므로 세션에서 가져옴 
		int total = ocService.countOrder(m_id);//m_id 회원의 주문 개수 
		int cntPerPage = 10; // 한 페이지당 최대 노출 주문개수
		String page = request.getParameter("page"); //현재페이지..(목적 페이지)
		if(page == null) { page = "1"; } //page 가 null이면 무조건 1페이지로 세팅
		pageDto = new PageDto(total, Integer.parseInt(page), cntPerPage); // 페이징 처리
		List<Map<String, String>> orderlist = ocService.getAllOrder(m_id, pageDto);
		model.addAttribute("paging", pageDto); //페이지 담기
		model.addAttribute("orderlist", orderlist); //주문리스트 담기
		
		return "mypage/ordercheck";
	}
	
	//입금대기중 - 취소
	@ResponseBody
	@RequestMapping("cancel_order")
	public int cancel_order(@RequestBody int ol_order_num) {
		int success = ocService.deleteOrder(ol_order_num);
		return success;
	}
	
//	//입금완료 - 취소
//	@ResponseBody
//	@RequestMapping("refund_req")
//	public int refund_req(@RequestBody int ol_order_num) {
//		int success = ocService.requestRefund(ol_order_num);
//		return success;
//	}
	
	//반품
	@RequestMapping("takeback_deli")
	public String takeback_del(Model model, HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		int ol_order_num = Integer.parseInt(request.getParameter("ol_order_num"));
		List<Map<String, String>> list = ocService.getOneSetOrder(ol_order_num);
		model.addAttribute("list", list);
		return "mypage/return";
	}
	
	//개별반품 - 반품사유 페이지 열기
	@RequestMapping("takeback_reason")
	public String takeback_reaon(@RequestParam String array, Model model, HttpServletRequest request) {
		String[] info = array.split(",");
		// json&ajax로 배열을 넘기면 알아서 배열로 받아지지만 그냥 파라미터로 배열 넘기면 스트링으로 배열값들이 합쳐진다. 때문에 ','를 기준으로 split해서 배열로 쪼개줘야함
		model.addAttribute("ol_num", info[0]);
		model.addAttribute("rt_amt", info[1]);
		model.addAttribute("origin_amt", info[2]);
		model.addAttribute("ol_price", info[3]);
		model.addAttribute("p_name", info[4]);
		model.addAttribute("origin_price", info[5]);
		return "mypage/takeback_delivery";
	}
	
	//반품 접수
	@ResponseBody
	@RequestMapping("return_request")
	public int return_reqeust(@RequestBody String[] rtinfo) {
		//반품리스트 인서트
		int success = ocService.returnRq(rtinfo[0], rtinfo[1], rtinfo[2]);
		//주문리스트 수량, 제품최종결제금액(ol_final_price) 업데이트
		int ol_amt = Integer.parseInt(rtinfo[3]) - Integer.parseInt(rtinfo[1]);
		int ol_price = Integer.parseInt(rtinfo[5]) - Integer.parseInt(rtinfo[4]);
		System.out.println(ol_amt);
		if(ol_amt == 0) {
			ocService.deleteOrderOne(rtinfo[0]);//전체 수량 반품이면 해당 상품을 삭제 시킨다(delete)
		} else {
			ocService.updateOrderAmount(rtinfo[0], ol_amt, ol_price); //일부 수량 반품이면 기존 orderlist_tb에서 수량을 차감시킨다(update)
		}
		return success;
	}
	
	//배송완료 상태에서 리뷰작성 버튼 클릭 시 - 구매확정 유도(구매확정 후 리뷰작성 가능)
	@RequestMapping("my_review_alert")
	public String my_review_alert(HttpServletRequest request, HttpSession session, Model model) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		int ol_order_num = Integer.parseInt(request.getParameter("ol_order_num"));
		model.addAttribute("ol_order_num", ol_order_num);//해당 주문건을 구매 확정시킴
		return "mypage/my_review_alert";
	}
	
	//해당 주문건의 리뷰 가능 리스트
	@RequestMapping("my_review_list")
	public String my_review_list(HttpServletRequest request, HttpSession session, Model model) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		String ol_order_num = request.getParameter("ol_order_num");
		String order_status = "구매확정";
		ocService.updateStatus(ol_order_num, order_status); //주문리스트에서 해당 주문 ol_status 구매확정으로 변경
		//리뷰 작성 가능 상품들 가져오기(해당 주문건(ol_order_num)에 속한 주문상품(ol_num)이 review_user_tb에 있는지 확인해서 없는 경우만 가져옴 - 리뷰 유저테이블에 ol_num이 있으면 그 ol_num에 대해서는 이미 리뷰를 작성했다는 뜻이므로)
		List<Map<String, String>> list = ocService.reviewReadyList(ol_order_num); 
		model.addAttribute("list", list);
		return "mypage/my_review_list";
	}
	
	//리뷰가능 리스티에서 '작성하기' 버튼 클릭시 작성폼으로 이동시키는 메서드
	@RequestMapping("my_review_write")
	public String my_review_write(HttpSession session, @RequestParam("p_num") String p_num, @RequestParam("p_name") String p_name, @RequestParam("ol_num") String ol_num, @RequestParam("ol_order_num") String ol_order_num, Model model) {
		model.addAttribute("m_num", session.getAttribute("userNum"));
		model.addAttribute("p_num", p_num);
		model.addAttribute("p_name", p_name);
		model.addAttribute("ol_num", ol_num);
		model.addAttribute("ol_order_num", ol_order_num);
		return "mypage/my_review_write";
	}
	
	//리뷰등록하기 **리뷰 등록시 주문 고유번호도 같이 등록시켜야함
	@RequestMapping("my_review_insert")
	public String my_review_insert(ReviewUserDto reviewUserDto, @RequestParam("ol_order_num") String ol_order_num, @RequestParam String ol_num, MultipartFile ru_img_file, HttpSession session, Model model) throws Exception {
		reviewUserDto.setM_num((Integer)session.getAttribute("userNum")); //dto에 회원고유번호 넣기
		reviewUserDto.setOl_num(Integer.parseInt(ol_num)); //dto에 ol_num 값 넣기
		ocService.review_insert(ru_img_file, reviewUserDto); //리뷰 등록 메소드(파일첨부는 서비스에 넘겨서 구현)
		pService.update_score(reviewUserDto.getP_num()); //제품의 스코어 업데이트(홍익구현 pservice 가져다)
		return "redirect:my_review_list?ol_order_num="+ol_order_num; //리뷰가능리스트로 리다이렉트시키기
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
