package com.javalec.ex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.UtilDto;
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
	
	//쿠폰 전체 리스트 불러오기
	@RequestMapping("ad_coupon_list")
	public String coupon_list(Model model) {
		model.addAttribute("coupon_list", cpservice.getAllCoupons());
		return response_path+"ad_coupon_list";
	}
	
	//쿠폰 등록 페이지 접속
	@RequestMapping("coupon_write")
	public String coupon_wirte(Model model) {
		model.addAttribute("product_list", cpservice.getAllProducts());
		return response_path+"coupon_write";
	}
	
	//쿠폰 등록
	@RequestMapping("coupon_insert")
	public String coupon_insert(CouponDto couponDto, UtilDto utilDto, 
			@RequestParam("co_select") String co_select, @RequestParam("is_product") int is_product,
			Model model) {
		System.out.println(couponDto.getCo_expiry());
		int success = 0;
		if(co_select.equals("expiry_1")&&is_product==1) {//유효기간만 설정된 상품 쿠폰 등록
			System.out.println("유효기간만 설정된 상품 쿠폰 등록");
			success = cpservice.insertExpiryProCoupon(couponDto);}
		if(co_select.equals("expiry_1")&&is_product==0) { //유효기간만 설정된 미상품 쿠폰 등록
			System.out.println("유효기간만 설정된 미상품 쿠폰 등록");
			success = cpservice.insertExpiryCoupon(couponDto);}
		if(co_select.equals("expiry_0")&&is_product==1) {//사용 시작일, 종료일 설정된 상품 쿠폰 등록
			System.out.println("사용 시작일, 종료일 설정된 상품 쿠폰 등록");
			System.out.println(couponDto.getCo_name());
			System.out.println(utilDto.getStr1());
			success = cpservice.insertDateProCoupon(couponDto, utilDto);		}
		if(co_select.equals("expiry_0")&&is_product==0) {//사용 시작일, 종료일 설정된 미상품 쿠폰 등록
			System.out.println("사용 시작일, 종료일 설정된 미상품 쿠폰 등록");
			success = cpservice.insertDateCoupon(couponDto, utilDto);	}			
		
	
		String alerttext="";
		switch(success) {
		case 0 : alerttext="alert('쿠폰을 등록하지 못했습니다. 다시 시도해 주세요.'); history.go(-1);"; break;
		case 1 : alerttext="alert('쿠폰을 등록했습니다.'); location.href='ad_coupon_list';"; break;
		}//switch
		model.addAttribute("alerttext", alerttext);
		return response_path+"coupon_write";
	}
	
}
