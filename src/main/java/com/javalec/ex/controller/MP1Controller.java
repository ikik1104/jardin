package com.javalec.ex.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.ex.service.MP1Service;

@Controller
public class MP1Controller {

	@Autowired
	MP1Service mp1Service;
	
	@RequestMapping("cart")
	public String cart(HttpServletRequest request, Model model) {
		
		int m_num = Integer.parseInt(request.getParameter("m_num"));
		
//		if(session.getAttribute("m_num")==null) {
//			return "member/login";
//		}
		model.addAttribute("coupon", mp1Service.getCouponCount(m_num));
		model.addAttribute("memDto", mp1Service.getMemInfo(m_num));
		model.addAttribute("order", mp1Service.getOrderCount(m_num));
		model.addAttribute("cartlist", mp1Service.getAllCart(m_num));
		
		return "mypage/cart";
	}
}
