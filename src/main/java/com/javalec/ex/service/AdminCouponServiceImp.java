package com.javalec.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.AdminCouponDao;
import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;

@Service
public class AdminCouponServiceImp implements AdminCouponService {

	@Autowired
	AdminCouponDao admincoupondao;

	//쿠폰 전체 리스트 가져오기
	@Override
	public List<AllDto> getAllCoupons() {
		return admincoupondao.getAllCoupons();
	}
	
	
	
}
