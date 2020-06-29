package com.javalec.ex.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.NonmemberCartDto;
import com.javalec.ex.service.PayService;

@Controller
public class PayController {

	@Autowired
	private PayService payService;
	
	// 주문/결제 페이지로 장바구니에 포함된 제품 전체 정보 & 회원 정보  불러오기 
	@RequestMapping("payment")
	public String payment(HttpServletRequest request, Model model, HttpSession session) {
		String page= "";
		
		if(session.getAttribute("userNum") != null) { 
		
			int m_num = (Integer)session.getAttribute("userNum");
			
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
			System.out.println(payService.getAllCart1(m_num).size());
			model.addAttribute("cartlist", payService.getAllCart1(m_num));
			model.addAttribute("memDto", memberDto);
			model.addAttribute("p_couponCount", payService.p_couponCount(m_num));
			model.addAttribute("c_couponCount", payService.c_couponCount(m_num));
			model.addAttribute("d_couponCount", payService.d_couponCount(m_num));
			model.addAttribute("cartCoupon", payService.getCartCou(m_num));
			model.addAttribute("deliveryCoupon", payService.getDeliveryCou(m_num));
			
			page= "payment/payment";
		}else {
				session.removeAttribute("nonmem_buyNow");
				List<String> arr = (ArrayList<String>)session.getAttribute("nonmem_cartbuy");
				List<NonmemberCartDto> ncDtos = new ArrayList<NonmemberCartDto>();
				for(int i=0; i<arr.size(); i++) {
					String[] sp = arr.get(i).split("_");
					int p_num = Integer.parseInt(sp[0]);
					int p_amt = Integer.parseInt(sp[1]);
					NonmemberCartDto ncDto = new NonmemberCartDto();
					ncDto.setP_amt(p_amt);
					ncDto.setpDto(payService.getProductInfo(p_num));
					ncDtos.add(ncDto);
				}
				model.addAttribute("cartlist", ncDtos);
				model.addAttribute("cCount", ncDtos.size());
			page = "nonmember/payment";
		}
		
		return page;
	}
	
	@RequestMapping("buynow_payment")
	public String buynow_payment(HttpServletRequest request, Model model, HttpSession session) {
		String page= "";
		
		if(session.getAttribute("userNum") != null) { 
		
			int m_num = (Integer)session.getAttribute("userNum");
			
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
			
			page= "payment/payment";
		}else {
			session.removeAttribute("nonmem_cartbuy");
			List<String> arr = (ArrayList<String>)session.getAttribute("nonmem_buyNow");
			List<NonmemberCartDto> ncDtos = new ArrayList<NonmemberCartDto>();
			System.out.println(arr.get(0));
			for(int i=0; i<arr.size(); i++) {
				String[] sp = arr.get(i).split("_");
				int p_num = Integer.parseInt(sp[0]);
				int p_amt = Integer.parseInt(sp[1]);
				NonmemberCartDto ncDto = new NonmemberCartDto();
				ncDto.setP_amt(p_amt);
				ncDto.setpDto(payService.getProductInfo(p_num));
				ncDtos.add(ncDto);
			}
			model.addAttribute("cartlist", ncDtos);
			model.addAttribute("cCount", ncDtos.size());
			page = "nonmember/payment";
		}
		return page;
	}
	
	// 쿠폰 정보 불러오기 (자식창 용)
	@RequestMapping("coupon_list")
	public String coupon_list(HttpServletRequest request, Model model, HttpSession session) {
		if(session.getAttribute("userNum") == null) {return "home";}//세션체크
		
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
	
	
	
}
