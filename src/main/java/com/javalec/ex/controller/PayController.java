package com.javalec.ex.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.OrderListDto;
import com.javalec.ex.dto.OrderlistCouDto;
import com.javalec.ex.dto.ReceiverDto;
import com.javalec.ex.service.ChangeInfoService;
import com.javalec.ex.service.PayService;

@Controller
public class PayController {

	@Autowired
	PayService payService;
	
	// 주문/결제 페이지로 장바구니에 포함된 제품 전체 정보 & 회원 정보  불러오기 
	@RequestMapping("payment")
	public String payment(HttpServletRequest request, Model model) {
		
		int m_num = Integer.parseInt(request.getParameter("m_num"));
		
		MemberDto memberDto = payService.getMemInfo1(m_num);
				
		//email 분리
		String email = memberDto.getM_email();
		int index = email.indexOf("@");
		model.addAttribute("email_id", email.substring(0, index));
		model.addAttribute("email_domain", email.substring(index+1));
		
		//휴대전화번호 분리
		String phoneSet = memberDto.getM_phone();
		String[] phone = phoneSet.split("-");
		for(int i=0; i<phone.length; i++) {
			model.addAttribute("phone"+(i+1), phone[i]);
		}
		
		//유션전화 분리
		String telSet = memberDto.getM_tel();
		String[] tel = telSet.split("-");
		for(int i=0; i<tel.length; i++) {
			model.addAttribute("tel"+(i+1), tel[i]);
		}
		
		model.addAttribute("cartlist", payService.getAllCart1(m_num));
		model.addAttribute("memDto", memberDto);
		model.addAttribute("p_couponCount", payService.p_couponCount(m_num));
		model.addAttribute("c_couponCount", payService.c_couponCount(m_num));
		model.addAttribute("d_couponCount", payService.d_couponCount(m_num));
		model.addAttribute("cartCoupon", payService.getCartCou(m_num));
		model.addAttribute("deliveryCoupon", payService.getDeliveryCou(m_num));
		
		return "payment/payment";
	}
	
	// 쿠폰 정보 불러오기 (자식창 용)
	@RequestMapping("coupon_list")
	public String coupon_list(HttpServletRequest request, Model model) {
		
		int m_num = Integer.parseInt(request.getParameter("m_num"));
		
		model.addAttribute("cartlist", payService.getAllCart1(m_num));
		model.addAttribute("memDto", payService.getMemInfo1(m_num));
		model.addAttribute("couponlist", payService.getAllCou(m_num));
		
		return "payment/coupon_list";
	}

	// 주문자 회원정보 수정 
	@ResponseBody
	@RequestMapping("changeInfo")
	public int changeInfo(MemberDto memberDto, Model model) {
		int success=payService.changeInfo(memberDto);
		return success;
	}
	
	// 주문번호 생성 변수1
	static int i=1;
	
	@RequestMapping("submit_order")
	public String sumbit_order(OrderListDto orderListDto, ReceiverDto reDto, OrderlistCouDto orderCouDto, HttpServletRequest request, Model model) {
		
		String[] productNum = request.getParameterValues("productNum");
		String[] productAmt = request.getParameterValues("productAmt");
		
		// 주문번호 생성 변수2 (ol_order_num)
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
		Date currentTime = new Date ();
		String time1 = mSimpleDateFormat.format(currentTime);
		String ol_order_num = time1+i;
		
		// 주문리스트 등록
		for(int j=0; j<productNum.length; j++) {
			
			int p_num = Integer.parseInt(productNum[j]);
			int ol_amt = Integer.parseInt(productAmt[j]);
			OrderListDto olDto = new OrderListDto();
			olDto = orderListDto;
			olDto.setOl_order_num(ol_order_num);
			olDto.setP_num(p_num);
			olDto.setOl_amt(ol_amt);
			olDto.setCo_num(11);
			payService.insertOrderList(olDto);
		}
		
		// 주문자,수취자 정보 등록
//		String email_id = request.getParameter("email_id");
//		String email_domain = request.getParameter("email_domain");
//		String m_email = email_id+"@"+email_domain;
//		String phone1 = request.getParameter("phone1");
//		String phone2= request.getParameter("phone2");
//		String phone3= request.getParameter("phone3");
//		String m_phone = phone1+"-"+phone2+"-"+phone3;
//		String tel1 = request.getParameter("tel1");
//		String tel2= request.getParameter("tel2");
//		String tel3= request.getParameter("tel3");
//		String m_tel = tel1+"-"+tel2+"-"+tel3;
//		
//		String re_phone1 = request.getParameter("re_phone1");
//		String re_phone2= request.getParameter("re_phone2");
//		String re_phone3= request.getParameter("re_phone3");
//		String re_phone = re_phone1+"-"+re_phone2+"-"+re_phone3;
//		String re_tel1 = request.getParameter("re_tel1");
//		String re_tel2= request.getParameter("re_tel2");
//		String re_tel3= request.getParameter("re_tel3");
//		String re_tel = re_tel1+"-"+re_tel2+"-"+re_tel3;
//		
//		
//		reDto.setOl_order_num(ol_order_num);
//		reDto.setM_email(m_email);
//		reDto.setM_phone(m_phone);
//		reDto.setM_tel(m_tel);
//		reDto.setRe_phone(re_phone);
//		reDto.setRe_tel(re_tel);
//		
//		payService.insertOrReInfo(reDto);
		
		
		i +=1;
		
		return "payment/order_confirmation";
	}
	
}
