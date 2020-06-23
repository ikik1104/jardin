package com.javalec.ex.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.ex.dto.OrderListDto;
import com.javalec.ex.dto.OrderlistCouDto;
import com.javalec.ex.service.MP1Service;
import com.javalec.ex.service.OrderConfirmService;
import com.javalec.ex.service.PayService;


@Controller
public class OrderConfirmController {

	@Autowired
	private MP1Service mp1Service;
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private OrderConfirmService orderConfirmService;

	
	// 주문번호 생성 변수1
		static int i=1;
		
		@RequestMapping("submit_order")
		public String sumbit_order(OrderListDto orderListDto, @RequestParam HashMap<String, String> map,  OrderlistCouDto orderCouDto, HttpServletRequest request, HttpSession session, Model model) {
			
			if(session.getAttribute("userNum") != null) { 
				
				int m_num = (Integer)session.getAttribute("userNum");
			
			String[] productNum = request.getParameterValues("productNum");
			String[] productAmt = request.getParameterValues("productAmt");
			String[] productCou = request.getParameterValues("productCou");
			
			// 주문번호 생성 변수2 (ol_order_num)
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
			Date currentTime = new Date ();
			String time1 = mSimpleDateFormat.format(currentTime);
			String ol_order_num = time1+"_"+i;
			
			// 주문리스트 등록
			for(int j=0; j<productNum.length; j++) {
				
				int p_num = Integer.parseInt(productNum[j]);
				int ol_amt = Integer.parseInt(productAmt[j]);
				int ci_num = Integer.parseInt(productCou[j]);
				OrderListDto olDto = new OrderListDto();
				olDto = orderListDto;
				olDto.setOl_order_num(ol_order_num);
				olDto.setP_num(p_num);
				olDto.setOl_amt(ol_amt);
				olDto.setCo_num(ci_num);
				
				if(ci_num==0) {
					payService.insertOrderList2(olDto);
				}else {
					payService.insertOrderList(olDto);
				}
			}
			
			// 주문자,수취자 정보 등록
			map.put("ol_order_num", ol_order_num);
			payService.insertOrReInfo(map);
			
			// 주문쿠폰적용 테이블 등록
			orderCouDto.setOl_order_num(ol_order_num);
			payService.insertOrderListCou(orderCouDto);
			
			// 사용한 제품 쿠폰 사용 날짜 업데이트
			for(int j=0; j<productCou.length; j++) {
				map.put("pcou", productCou[j]);
				payService.updateProdutCou(map);
			}
			
			// 사용한 장바구니 쿠폰, 배송비무료 쿠폰 사용 날짜 업데이트
			payService.updateUsedCou(orderCouDto);

			// 사용 포인트 차감
			int point = Integer.parseInt(request.getParameter("point"));
			int m_num = Integer.parseInt(request.getParameter("m_num"));
			payService.subUsedPoint(point, m_num);
			
			// 장바구니에서 주문한 제품 삭제
			for(int j=0; j<productNum.length; j++) {
				int p_num = Integer.parseInt(productNum[j]);
				payService.deleteCart(m_num, p_num);
			}
			
			//  payment_cart_tb 비우기
			mp1Service.delPaymentCart(m_num);
			
			// 사용 포인트 내역 등록
			String po_name = ol_order_num+"-제품구매";
			payService.insertUsedPoint(m_num, point, po_name);
			
			i +=1;
			
			model.addAttribute("orderlist", orderConfirmService.getOderList(ol_order_num));
			model.addAttribute("orderInfo", orderConfirmService.getOrReInfo(ol_order_num));
			model.addAttribute("coupon_point", orderConfirmService.getOrderlistCou(ol_order_num));
			
			return  "payment/order_confirmation";
		}
	
}
