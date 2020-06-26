package com.javalec.ex.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
import com.javalec.ex.dto.RefundDto;
import com.javalec.ex.dto.RefundSetDto;
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
		if(session.getAttribute("userNum") == null) {return "redirect:login";}//세션체크
		
		String m_id = (String) session.getAttribute("userID");//페이징, 주문리스트 가져오기에 m_id를 넘겨줘야 하므로 세션에서 가져옴 
		int total = ocService.countOrder(m_id);//m_id 회원의 주문 개수 
		int cntPerPage = 10; // 한 페이지당 최대 노출 주문개수
		String page = request.getParameter("page"); //현재페이지..(목적 페이지)
		if(page == null) { page = "1"; } //page 가 null이면 무조건 1페이지로 세팅
		pageDto = new PageDto(total, Integer.parseInt(page), cntPerPage, 1); // 페이징 처리
		List<Map<String, String>> orderlist = ocService.getAllOrder(m_id, pageDto);
		model.addAttribute("paging", pageDto); //페이지 담기
		model.addAttribute("orderlist", orderlist); //주문리스트 담기
		
		
		return "mypage/ordercheck";
	}
	
	//입금대기중 - 취소
	@ResponseBody
	@RequestMapping("cancel_order")
	public Map<String, Object> cancel_order(@RequestBody String ol_order_num) {
		int success = ocService.deleteOrder(ol_order_num);//주문테이블지우기
		int success2 = ocService.deleteOrderCou(ol_order_num);
		int success3 = ocService.deleteOrderRec(ol_order_num);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);
		map.put("success2", success2);
		map.put("success3", success3);
		return map;
	}
	
	//입금완료 - 결제취소
	@RequestMapping("list_for_refund")
	public String list_for_refund(Model model, HttpSession session, @RequestParam("ol_order_num") String ol_order_num) {
		if(session.getAttribute("userNum") == null) {return "redirect:login";}//세션체크
		List<Map<String, String>> list = ocService.getOneSetOrder(ol_order_num);
		model.addAttribute("list", list);
		return "mypage/list_for_refund";
	}
	
	//환불고유번호 생성 변수1
	public static int i=1;
	

	//환불, 결제취소 접수
	@RequestMapping("refund_request")
	public String refund_request(RefundSetDto refundSetDto, HttpServletRequest request, HttpSession session) {
		// 환불고유번호 생성 변수2 (RF_RECEIPT_NUM)
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
		Date currentTime = new Date ();
		String time1 = mSimpleDateFormat.format(currentTime);
		String rf_receipt_num = "rf"+time1+"_"+i;
		String m_id = (String) session.getAttribute("userID");
		
//		 indexArra request.getParameterValues("index");
		//배열 랭스만큼  포문 돌리고  그 배열 값을 i 자리에 넣어서 처리하면 되지 않을까?
		
		//관건은..리퀘스트로 과연 index 를 배열로 받아오느냐 아니냐..
		//선택한 상품 객체의 인덱스를 배열로 넘겨받기
		String[] indexArray = request.getParameterValues("index");
		for(int i=0; i<indexArray.length; i++) {
			int ol_num = refundSetDto.getRefundDto().get(Integer.parseInt(indexArray[i])).getOl_num();
			int rf_price = refundSetDto.getRefundDto().get(Integer.parseInt(indexArray[i])).getRf_price();
			String p_name = refundSetDto.getRefundDto().get(Integer.parseInt(indexArray[i])).getP_name();
			String ol_order_num = refundSetDto.getRefundDto().get(Integer.parseInt(indexArray[i])).getOl_order_num();
			ocService.refundRequest(rf_receipt_num, ol_num, rf_price, ol_order_num, p_name, m_id); //환불 테이블에 insert
			ocService.updateOrderStatus(ol_num, 0); // 주문리스트에서 상태 반품/취소으로 변경
		}
		//중첩 커맨드 객체에 담아서 데이터 가져오기
//		for(int i=0; i<refundSetDto.getRefundDto().size(); i++) {
//			int ol_num = refundSetDto.getRefundDto().get(i).getOl_num();
//			int rf_price = refundSetDto.getRefundDto().get(i).getRf_price();
//			String p_name = refundSetDto.getRefundDto().get(i).getP_name();
//			System.out.println(p_name);
//			String ol_order_num = refundSetDto.getRefundDto().get(i).getOl_order_num();
//			System.out.println(ol_order_num);
//			ocService.refundRequest(rf_receipt_num, ol_num, rf_price, ol_order_num, p_name, m_id); //환불 테이블에 insert
//			ocService.updateOrderStatus(ol_num, 0); // 주문리스트에서 상태 반품/취소으로 변경
//		}
		i+=1;
		return "mypage/refund_request_success";
	}
	
	//반품
	@RequestMapping("takeback_deli")
	public String takeback_del(Model model, HttpSession session, HttpServletRequest request, @RequestParam("ol_order_num") String ol_order_num) {
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
		model.addAttribute("ol_order_num", info[6]);
		return "mypage/takeback_delivery";
	}
	
	//반품고유번호 생성 변수1
	static int j=1;
	//반품 접수
	@ResponseBody
	@RequestMapping("return_request")
	public int return_reqeust(@RequestBody String[] rtinfo, HttpSession session) {
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
		Date currentTime = new Date ();
		String time1 = mSimpleDateFormat.format(currentTime);
		String rt_receipt_num = "rt"+time1+"_"+j;
		String m_id = (String) session.getAttribute("userID");
		//반품리스트 인서트 //0 ol_num, [1] ol_amt(반품할 수량), [2]origin_amt(원래 수량), [3]ol_price(반품시 돌려받을 예상 금액), [4]p_name, [5]origin_price(원래금액)
		int success = ocService.returnRq(Integer.parseInt(rtinfo[0]), rtinfo[1], rtinfo[2], Integer.parseInt(rtinfo[4]), rt_receipt_num, rtinfo[6], rtinfo[7], m_id);
		//주문리스트 수량, 제품최종결제금액(ol_final_price) 업데이트
		System.out.println(rtinfo[6]+"이건 오더넘");
		System.out.println(rtinfo[7]+"이건 피넴");
		int ol_amt = Integer.parseInt(rtinfo[3]) - Integer.parseInt(rtinfo[1]);
		int ol_price = Integer.parseInt(rtinfo[5]) - Integer.parseInt(rtinfo[4]);
		if(ol_amt == 0) {
			ocService.updateOrderStatus(Integer.parseInt(rtinfo[0]), ol_amt);//전체 수량 반품이면 오더리스트에서 삭제
		} else {
			ocService.updateOrderAmount(rtinfo[0], ol_amt, ol_price); //일부 수량 반품이면 기존 orderlist_tb에서 수량과 결제금액을 차감시킨다(update)
		}
		j+=1;
		return success;
	}
	
	//배송완료 상태에서 리뷰작성 버튼 클릭 시 - 구매확정 유도(구매확정 후 리뷰작성 가능)
	@RequestMapping("my_review_alert")
	public String my_review_alert(HttpServletRequest request, HttpSession session, Model model) {
		if(session.getAttribute("userNum") == null) {return "redirect:login";}//세션체크
		String ol_order_num = request.getParameter("ol_order_num");
		model.addAttribute("ol_order_num", ol_order_num);
		return "mypage/my_review_alert";
	}
	
	//해당 주문건의 리뷰 가능 리스트
	@RequestMapping("my_review_list")
	public String my_review_list(HttpServletRequest request, HttpSession session, Model model) {
		if(session.getAttribute("userNum") == null) {return "redirect:login";}//세션체크
		String ol_order_num = request.getParameter("ol_order_num");
		System.out.println("오더넘버 " + ol_order_num );
		ocService.updateStatus(ol_order_num, "구매확정"); //주문리스트에서 해당 주문 ol_status 구매확정으로 변경
		//리뷰 작성 가능 상품들 가져오기(해당 주문건(ol_order_num)에 속한 주문상품(ol_num)이 review_user_tb에 있는지 확인해서 없는 경우만 가져옴 - 리뷰 유저테이블에 ol_num이 있으면 그 ol_num에 대해서는 이미 리뷰를 작성했다는 뜻이므로)
		List<Map<String, String>> list = ocService.reviewReadyList(ol_order_num); 
		//리뷰 작성 완료 상품들 가져오기(해당 주문건(ol_order_num)에 속한 주문상품(ol_num)이 review_user_tb에 있는지 확인해서 있는 경우만 가져옴)
		List<Map<String, String>> list2 = ocService.reviewEndList(ol_order_num); 
		model.addAttribute("list", list);
		model.addAttribute("listEnd", list2);
		return "mypage/my_review_list";
	}
	
	//구매확정
	@RequestMapping("decide_buying")
	public String decide_buying(@RequestParam("ol_order_num") String ol_order_num, @RequestParam("page")String page, @RequestParam("orderer")String orderer) {
		ocService.updateStatus(ol_order_num, "구매확정"); //주문리스트에서 해당 주문 ol_status 구매확정으로 변경
		return "redirect:"+page+"?orderNum="+ol_order_num+"&orderName="+orderer;
	}
	
	//리뷰가능 리스티에서 '작성하기' 버튼 클릭시 작성폼으로 이동시키는 메서드
	@RequestMapping("my_review_write")
	public String my_review_write(HttpSession session, @RequestParam("p_num") String p_num, @RequestParam("p_name") String p_name, @RequestParam("ol_num") String ol_num, @RequestParam("ol_order_num") String ol_order_num, Model model) {
		model.addAttribute("m_num", session.getAttribute("userNum"));
		model.addAttribute("p_num", p_num);
		model.addAttribute("p_name", p_name);
		model.addAttribute("ol_num", ol_num);
		System.out.println("리뷰롸잍 : "+ol_order_num);
		model.addAttribute("ol_order_num", ol_order_num);
		return "mypage/my_review_write";
	}
	
	//리뷰등록하기 **리뷰 등록시 주문 고유번호도 같이 등록시켜야함
	@RequestMapping("my_review_insert")
	public String my_review_insert(ReviewUserDto reviewUserDto, @RequestParam("ol_order_num") String ol_order_num, @RequestParam String ol_num, MultipartFile ru_img_file, HttpSession session, Model model) throws Exception {
		System.out.println("리뷰인써트 : "+ol_order_num);
		
		reviewUserDto.setM_num((Integer)session.getAttribute("userNum")); //dto에 회원고유번호 넣기
		reviewUserDto.setOl_num(Integer.parseInt(ol_num)); //dto에 ol_num 값 넣기
		int check = ocService.review_insert(ru_img_file, reviewUserDto); //리뷰 등록 메소드(파일첨부는 서비스에 넘겨서 구현)
		pService.update_score(reviewUserDto.getP_num()); //제품의 스코어 업데이트(홍익구현 pservice 가져다씀)
		System.out.println("들어왔는지23");
		return "redirect:my_review_list?ol_order_num="+ol_order_num; //리뷰가능리스트로 리다이렉트시키기
	}
//	//리뷰등록하기 **리뷰 등록시 주문 고유번호도 같이 등록시켜야함
//	@RequestMapping("my_review_insert")
//	public String my_review_insert(ReviewUserDto reviewUserDto, HttpServletRequest request, MultipartFile ru_img_file, HttpSession session, Model model) throws Exception {
//		String ol_order_num = request.getParameter("ol_order_num");
//		String ol_num = request.getParameter("ol_num");
//		System.out.println("리뷰인써트 : "+ol_order_num);
//		
//		reviewUserDto.setM_num((Integer)session.getAttribute("userNum")); //dto에 회원고유번호 넣기
//		reviewUserDto.setOl_num(Integer.parseInt(ol_num)); //dto에 ol_num 값 넣기
//		int check = ocService.review_insert(ru_img_file, reviewUserDto); //리뷰 등록 메소드(파일첨부는 서비스에 넘겨서 구현)
//		pService.update_score(reviewUserDto.getP_num()); //제품의 스코어 업데이트(홍익구현 pservice 가져다씀)
//		System.out.println("들어왔는지23");
//		return "redirect:my_review_list?ol_order_num="+ol_order_num; //리뷰가능리스트로 리다이렉트시키기
//	}

	//반품 리스트페이지 열기
	@RequestMapping("takeback_state")
	public String takeback_state(HttpSession session, HttpServletRequest request, PageDto pageDto, Model model) {
		if(session.getAttribute("userNum") == null) {return "redirect:login";}//세션체크
		
		String m_id = (String) session.getAttribute("userID");//페이징, 주문리스트 가져오기에 m_id를 넘겨줘야 하므로 세션에서 가져옴 
		int total = ocService.countReturnRefund(m_id);//m_id 회원의 주문 개수 &&
		int cntPerPage = 10; // 한 페이지당 최대 노출 주문개수
		String page = request.getParameter("page"); //현재페이지..(목적 페이지)
		if(page == null) { page = "1"; } //page 가 null이면 무조건 1페이지로 세팅
		pageDto = new PageDto(total, Integer.parseInt(page), cntPerPage, 1); // 페이징 처리
		List<Map<String, String>> rtrflist = ocService.getAllRtrf(m_id, pageDto);
		model.addAttribute("paging", pageDto); //페이지 담기
		model.addAttribute("rtrflist", rtrflist); //주문리스트 담기
		
		return "mypage/takeback_state";
	}
	
	//주문상세조회 
	@RequestMapping("my_order_statement")
	public String my_order_statement(@RequestParam("ol_order_num") String ol_order_num, Model model) {
		List<Map<String, String>> plist = ocService.proInOneOrder(ol_order_num); //주문 상품 가져오기
		Map<String, String> ilist = ocService.orderInfoDetail(ol_order_num); //결제, 배송지 정보 가져오기
		List<Map<String, String>> clist = ocService.cancelInfoDetail(ol_order_num); //취소 상품 가져오기
		List<Map<String, String>> tflist = ocService.rtrfInfoDetail(ol_order_num); //반품 상품 가져오기
		model.addAttribute("plist", plist);
		model.addAttribute("ilist", ilist);
		model.addAttribute("clist", clist);
		model.addAttribute("tflist", tflist);
		return "mypage/my_order_statement";
	}
	
	
	//마이페이지 정보 요약 인클루드 부분 
	@ResponseBody
	@RequestMapping("shortInfo")
	public Map<String, Object> shortInfo(HttpSession session, Model model) {
		String m_id = (String)session.getAttribute("userID");
		Map<String, Object> infolist = ocService.getShortInfo(m_id); 
		infolist.get("COUCOUNT");
		model.addAttribute("infolist", infolist);
		return infolist;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
