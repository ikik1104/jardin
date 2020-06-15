package com.javalec.ex.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.CartDto;
import com.javalec.ex.dto.Cou_IssueDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.OrderListDto;
import com.javalec.ex.dto.OrderlistCouDto;
import com.javalec.ex.dto.ReceiverDto;

@Repository
public interface PayDao {
	
	// 회원 정보 불러오기
	MemberDto getMemInfo1(int m_num);

	// 주문 예정 list 불러오기
	List<CartDto> getAllCart1(int m_num);
	
	// 회원 보유 쿠폰 정보 불러오기
	List<Cou_IssueDto> getAllCou(int m_num);
	
	// 회원 보유한 장바구니 쿠폰 정보 불러오기
	List<Cou_IssueDto> getCartCou(int m_num);
	
	// 회원 보유한 장바구니 쿠폰 정보 불러오기
	List<Cou_IssueDto> getDeliveryCou(int m_num);
	
	// 보유한 제품 쿠폰 수 카운트
	int p_couponCount(int m_num);
	
	// 보유한 장바구니 쿠폰 수 카운트
	int c_couponCount(int m_num);
	
	// 보유한 배송무료 쿠폰 수 카운트
	int d_couponCount(int m_num);
	
	// 주문하기에서 회원정보 업데이트
	int changeInfo(MemberDto memberDto); 
	
	// 주문리스트 등록  (제품 쿠폰 사용한 경우)
	int insertOrderList(OrderListDto olDto);
	
	// 주문리스트 등록  (제품 쿠폰 사용하지 않은 경우)
	int insertOrderList2(OrderListDto olDto);
	
	// 주무자/수취자 정보 등록
	int insertOrReInfo(HashMap<String, String> map);

	// 주문쿠폰적용 테이블 등록
	int insertOrderListCou(OrderlistCouDto orderCouDto);
	
	// 사용한 제품쿠폰 사용날짜 업데이트
	int updateProdutCou(HashMap<String, String> map);
	
	// 사용한 장바구니 쿠폰, 배송비무료 쿠폰 사용날짜 업데이트
	int updateUsedCou(OrderlistCouDto orderCouDto);
	
	// 사용한 포인트 차감
	int subUsedPoint(int point, int m_num);
	
	// 장바구니에서 주문한 제품 삭제
	int deleteCart(int m_num, int p_num);
	
	// 포인트 사용 내역 등록
	int insertUsedPoint(int m_num, int point, String po_name);
	
}
