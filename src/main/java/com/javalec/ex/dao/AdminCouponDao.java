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
	
	List<AllDto> getAllCoupons();
	
}
