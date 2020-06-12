package com.javalec.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.AllDto;

@Repository
public interface AdminCouponDao {

	/*
	 * [관리자]
	 * 쿠폰
	 * */
	
	//쿠폰 전체 리스트 가져오기
	List<AllDto> getAllCoupons();
	
}
