package com.javalec.ex.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.ex.service.MP1Service;

@Controller
public class NonmeberController {

	@Autowired
	MP1Service mp1Service;
	
	@RequestMapping("nonmember_buyNow")
	public String nonmember_buyNow(HttpServletRequest request, HttpSession session) {
		String page = "";
		int p_num = Integer.parseInt(request.getParameter("p_num"));
		int p_amt = Integer.parseInt(request.getParameter("ca_amount"));
		
		if(session.getAttribute("userNum") != null) {
			int m_num = (Integer)session.getAttribute("userNum");
			// payment_cart_tb 비우기
			mp1Service.delPaymentCart(m_num);
			// 장바구니 업데이트 
			mp1Service.cartUpdate(m_num, p_num, p_amt);
			// 주문하기로 넘어가는 제품 payment_cart_tb에 삽입 
			mp1Service.paymentCart(m_num, p_num, p_amt);
			
			page= "payment";
		}else if(session.isNew()) {
			session.setAttribute("nonmemId", session.getId());
			if(session.getAttribute("cart") == null) {
				HashMap<Integer, Object> map = new HashMap<Integer, Object>();
				map.put(p_num, p_amt);
			}else {
				map.put(p_num, p_amt);
			}
		}
			
		return page;	
	}
	
}
