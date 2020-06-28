package com.javalec.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.AdminCouponDao;
import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.UtilDto;

@Service
public class AdminCouponServiceImp implements AdminCouponService {

	@Autowired
	AdminCouponDao admincoupondao;

	//쿠폰 전체 리스트 가져오기
	public List<AllDto> getAllCoupons() {
		return admincoupondao.getAllCoupons();
	}

	//쿠폰 등록 페이지에 상품 목록 가져오기
	public List<AllDto> getAllProducts() {
		return admincoupondao.getAllProducts();
	}

	 //유효기간만 설정된 상품 쿠폰 등록
	public int insertExpiryProCoupon(CouponDto couponDto) {
		return admincoupondao.insertExpiryProCoupon(couponDto);
	}

	//유효기간만 설정된 미상품 쿠폰 등록
	public int insertExpiryCoupon(CouponDto couponDto) {
		return admincoupondao.insertExpiryCoupon(couponDto);
	}

	//사용 시작일, 종료일 설정된 상품 쿠폰 등록
	public int insertDateProCoupon(CouponDto couponDto, UtilDto utilDto) {
		return admincoupondao.insertDateProCoupon(couponDto, utilDto);
	}

	//사용 시작일, 종료일 설정된 미상품 쿠폰 등록
	public int insertDateCoupon(CouponDto couponDto, UtilDto utilDto) {
		return admincoupondao.insertDateCoupon(couponDto, utilDto);
	}

	//쿠폰 1개 불러오기
	public AllDto getCouponInfo(CouponDto couponDto) {
		return admincoupondao.getCouponInfo(couponDto);
	}

	//유효기간만 설정된 상품 쿠폰 수정
	public int modifyExpiryProCoupon(CouponDto couponDto) {
		System.out.println("유효기간 상품 쿠폰");
		return admincoupondao.modifyExpiryProCoupon(couponDto);
	}

	//유효기간만 설정된 미상품 쿠폰 수정
	public int modifyExpiryCoupon(CouponDto couponDto) {
		System.out.println("유효기간 미상품 쿠폰");
		return admincoupondao.modifyExpiryCoupon(couponDto);
	}

	//사용 시작일, 종료일 설정된 상품 쿠폰 수정
	public int modifyDateProCoupon(CouponDto couponDto, UtilDto utilDto) {
		System.out.println("기간제 상품 쿠폰");
		return admincoupondao.modifyDateProCoupon(couponDto, utilDto);
	}

	//사용 시작일, 종료일 설정된 미상품 쿠폰 수정
	public int modifyDateCoupon(CouponDto couponDto, UtilDto utilDto) {
		System.out.println("기간제 미상품 쿠폰");
		return admincoupondao.modifyDateCoupon(couponDto, utilDto);
	}

	//쿠폰 1개 삭제
	public int deleteCoupon(int co_num) {
		return admincoupondao.deleteCoupon(co_num);
	}

	//선택 쿠폰 일괄 삭제
	public int deleteSomeCoupons(int[] chkArray) {
		return admincoupondao.deleteSomeCoupons(chkArray);
	}


	
}
