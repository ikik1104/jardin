package com.javalec.ex.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.service.NonMemService;
import com.javalec.ex.service.OrderCheckService;

@Controller
public class NonMemController {

	@Autowired
	NonMemService nmService;
	@Autowired
	OrderCheckService ocService;
	
	//로그인 비회원 조회 버튼
	@RequestMapping("nonmember_ordercheck")
	public String non_ordercheck(HttpServletRequest request, Model model) {
		String order_num = request.getParameter("orderNum");
		String orderer = request.getParameter("orderName");
		System.out.println(order_num);
		List<Map<String, String>> orderlist = nmService.getAllNonOrder(order_num);
		model.addAttribute("ordersize", orderlist.size());
		model.addAttribute("orderlist", orderlist);
		model.addAttribute("orderer", orderer);
		model.addAttribute("orderNum", order_num);
		return "nonmember/ordercheck";
	}
	
	//주문상세조회 
	@RequestMapping("non_order_statement")
	public String non_order_statement(@RequestParam("ol_order_num") String ol_order_num, Model model) {
		List<Map<String, String>> plist = ocService.proInOneOrder(ol_order_num); //주문 상품 가져오기
		Map<String, String> ilist = ocService.orderInfoDetail(ol_order_num); //결제, 배송지 정보 가져오기
		List<Map<String, String>> clist = ocService.cancelInfoDetail(ol_order_num); //취소 상품 가져오기
		List<Map<String, String>> tflist = ocService.rtrfInfoDetail(ol_order_num); //반품 상품 가져오기
		model.addAttribute("plist", plist);
		model.addAttribute("ilist", ilist);
		model.addAttribute("clist", clist);
		model.addAttribute("tflist", tflist);
		return "nonmember/non_order_statement";
	}
	
	//비회원 입금완료 - 결제취소
	@RequestMapping("non_list_for_refund")
	public String list_for_refund(Model model, HttpSession session, @RequestParam("ol_order_num") String ol_order_num) {
		List<Map<String, String>> list = ocService.getOneSetOrder(ol_order_num);
		model.addAttribute("list", list);
		return "mypage/list_for_refund";
	}
	
	//반품
	@RequestMapping("non_takeback_deli")
	public String takeback_del(Model model, HttpSession session, @RequestParam("ol_order_num") String ol_order_num, @RequestParam("orderer") String orderer) {
		List<Map<String, String>> list = ocService.getOneSetOrder(ol_order_num);
		model.addAttribute("list", list);
		model.addAttribute("orderer", orderer);
		return "nonmember/non_return";
	}
	
	//개별반품 - 반품사유 페이지 열기
	@RequestMapping("non_takeback_reason")
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
		model.addAttribute("orderer", info[7]);
		return "nonmember/takeback_delivery";
	}
	
	//반품고유번호 생성 변수1
	static int j=1;
	//반품 접수
	@ResponseBody
	@RequestMapping("non_return_request")
	public int return_reqeust(@RequestBody String[] rtinfo, HttpSession session) {
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
		Date currentTime = new Date ();
		String time1 = mSimpleDateFormat.format(currentTime);
		String rt_receipt_num = "rt"+time1+"_"+j;
		//반품리스트 인서트 //0 ol_num, [1] ol_amt(반품할 수량), [2]origin_amt(원래 수량), [3]ol_price(반품시 돌려받을 예상 금액), [4]p_name, [5]origin_price(원래금액)
		int success = ocService.returnRq(Integer.parseInt(rtinfo[0]), rtinfo[1], rtinfo[2], Integer.parseInt(rtinfo[4]), rt_receipt_num, rtinfo[6], rtinfo[7], rtinfo[8]);
		//주문리스트 수량, 제품최종결제금액(ol_final_price) 업데이트
		System.out.println(rtinfo[8]+"비회원 이름");
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
	
	//반품리스트
	@RequestMapping("non_takeback_state")
	public String non_takeback_state(HttpServletRequest request, Model model) {
		String order_num = request.getParameter("orderNum");
		String orderer = request.getParameter("orderName");
		System.out.println("비회원 주문번호 : "+order_num);
		System.out.println("비회원 주문자명 : "+orderer);
		List<Map<String, String>> rtrflist = nmService.getAllClaim(order_num);
		model.addAttribute("rtrflist", rtrflist);
		model.addAttribute("orderer", orderer);
		model.addAttribute("orderNum", order_num);
		return "nonmember/takeback_state";
	}
	
	
}
