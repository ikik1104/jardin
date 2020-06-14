package com.javalec.ex.service;

import java.util.List;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.UtilDto;

public interface AdminCouponService {

	/*
	 * [관리자]
	 * 쿠폰
	 * */
	
	//쿠폰 전체 리스트 가져오기
	List<AllDto> getAllCoupons();

	//쿠폰 등록 페이지에 상품 목록 가져오기
	List<AllDto> getAllProducts();

	//유효기간만 설정된 상품 쿠폰 등록
	int insertExpiryProCoupon(CouponDto couponDto);

	//유효기간만 설정된 미상품 쿠폰 등록
	int insertExpiryCoupon(CouponDto couponDto);	
	
	//사용 시작일, 종료일 설정된 상품 쿠폰 등록
	int insertDateProCoupon(CouponDto couponDto, UtilDto utilDto);
	
	//사용 시작일, 종료일 설정된 미상품 쿠폰 등록
	int insertDateCoupon(CouponDto couponDto, UtilDto utilDto);
}
