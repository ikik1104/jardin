package com.javalec.ex.service;

import java.util.List;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;

public interface AdminCouponService {

	/*
	 * [관리자]
	 * 쿠폰
	 * */
	
	//쿠폰 전체 리스트 가져오기
	List<AllDto> getAllCoupons();
}
