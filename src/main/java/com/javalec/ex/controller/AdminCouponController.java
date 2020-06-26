package com.javalec.ex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//쿠폰 1개 정보 불러오기
	@RequestMapping("coupon_view")
	public String coupon_view(CouponDto couponDto, Model model) {
		model.addAttribute("coupon_info", cpservice. getCouponInfo(couponDto));
		model.addAttribute("product_list", cpservice.getAllProducts());
		return response_path+"coupon_view";
	}
	
	//쿠폰 1개 수정
	@PostMapping("coupon_modify")
	public String coupon_modify(UtilDto utilDto,
			@RequestParam("co_name") String co_name, @RequestParam("co_select") String co_select,
			@RequestParam("co_expiry") String co_expiry, @RequestParam("co_type") String co_type, 
			@RequestParam("co_product") String co_product, @RequestParam("co_discount") String co_discount,
			@RequestParam("co_condition") String co_condition, @RequestParam("is_product") String is_product, 
			@RequestParam("co_num") int co_num,
			Model model) {
		CouponDto couponDto = new CouponDto();
		
		System.out.println(utilDto.getStr1());System.out.println(utilDto.getStr2());
		
		//변수 형변환, couponDto에 주입
		couponDto.setCo_name(co_name);
		
		if(!(co_expiry.equals("-"))) {
		couponDto.setCo_expiry(Integer.parseInt(co_expiry));
		}
		couponDto.setCo_type(co_type);
		couponDto.setCo_product(Integer.parseInt(co_product));
		couponDto.setCo_discount(Integer.parseInt(co_discount));
		couponDto.setCo_condition(Integer.parseInt(co_condition));
		couponDto.setCo_num(co_num);
		
		System.out.println("co_select : "+co_select);System.out.println("is_product : "+is_product);
	
		
		int success = 0;
		if(co_select.equals("expiry_1")&&!(co_product.equals("0"))) {//유효기간만 설정된 상품 쿠폰 등록
			System.out.println("유효기간만 설정된 상품 쿠폰 등록");
			success = cpservice.modifyExpiryProCoupon(couponDto);}
		if(co_select.equals("expiry_1")&&co_product.equals("0")) { //유효기간만 설정된 미상품 쿠폰 등록
			System.out.println("유효기간만 설정된 미상품 쿠폰 등록");
			success = cpservice.modifyExpiryCoupon(couponDto);}
		if(co_select.equals("expiry_0")&&!(co_product.equals("0"))) {//사용 시작일, 종료일 설정된 상품 쿠폰 등록
			System.out.println("사용 시작일, 종료일 설정된 상품 쿠폰 등록");
			System.out.println(couponDto.getCo_name());
			System.out.println(utilDto.getStr1());
			success = cpservice.modifyDateProCoupon(couponDto, utilDto);		}
		if(co_select.equals("expiry_0")&&co_product.equals("0")) {//사용 시작일, 종료일 설정된 미상품 쿠폰 등록
			System.out.println("사용 시작일, 종료일 설정된 미상품 쿠폰 등록");
			success = cpservice.modifyDateCoupon(couponDto, utilDto);	}			
		
	
		String alerttext="";
		switch(success) {
		case 0 : alerttext="alert('쿠폰을 수정하지 못했습니다. 다시 시도해 주세요.'); history.go(-1);"; break;
		case 1 : alerttext="alert('쿠폰을 수정했습니다.'); location.href='ad_coupon_list';"; break;
		}//switch
		model.addAttribute("alerttext", alerttext);
		return response_path+"coupon_view";		
	}
	
	//쿠폰 1개 삭제
	@ResponseBody
	@RequestMapping("coupon_delete")
	public int coupon_delete(@RequestBody int co_num) {
		int success = cpservice.deleteCoupon(co_num);
		return success;
	}

	
}
