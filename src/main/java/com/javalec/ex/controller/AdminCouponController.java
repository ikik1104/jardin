package com.javalec.ex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.service.AdminCouponService;

@Controller
public class AdminCouponController {
	
	/*
	 * [관리자]
	 * (프로모션)쿠폰
	 * */
	
	String response_path="admin/promotion/";
	
	@Autowired
	AdminCouponService cpservice;
	
	@RequestMapping("ad_coupon_list")
	public String coupon_list(Model model) {
		model.addAttribute("coupon_list", cpservice.getAllCoupons());
		return response_path+"ad_coupon_list";
	}

}
