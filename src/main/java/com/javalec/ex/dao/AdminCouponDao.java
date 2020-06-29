package com.javalec.ex.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.UtilDto;

@Repository
public interface AdminCouponDao {

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
	int insertDateProCoupon(@Param("couponDto") CouponDto couponDto, @Param("utilDto") UtilDto utilDto);

	//사용 시작일, 종료일 설정된 미상품 쿠폰 등록
	int insertDateCoupon(@Param("couponDto") CouponDto couponDto,@Param("utilDto")  UtilDto utilDto);

	//쿠폰 1개 불러오기
	AllDto getCouponInfo(CouponDto couponDto);

	 //유효기간만 설정된 상품 쿠폰 수정
	int modifyExpiryProCoupon(CouponDto couponDto);
	
	//유효기간만 설정된 미상품 쿠폰 수정
	int modifyExpiryCoupon(CouponDto couponDto);
	
	//사용 시작일, 종료일 설정된 상품 쿠폰 수정
	int modifyDateProCoupon(@Param("couponDto") CouponDto couponDto, @Param("utilDto") UtilDto utilDto);

	//사용 시작일, 종료일 설정된 미상품 쿠폰 수정
	int modifyDateCoupon(@Param("couponDto") CouponDto couponDto,@Param("utilDto")  UtilDto utilDto);

	//쿠폰 1개 삭제
	int deleteCoupon(int co_num);

	//선택 쿠폰 일괄 삭제
	int deleteSomeCoupons(@Param("chkArray") int[] chkArray);



	
}
