package com.javalec.ex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.javalec.ex.dto.PageDto;

public interface OrderCheckService {

	int countOrder(String m_id); //특정 회원의 전체 주문건 수
	List<Map<String, String>> getAllOrder(String m_id, PageDto pageDto); //특정 회원의 전체 주문목록
	int deleteOrder(int ol_order_num); //주문취소(입금대기중 - 취소)
	List<Map<String, String>> getOneSetOrder(int ol_order_num); // 특정 주문번호의 전체 상품목록
	HashMap<String, String> getReturnPro(int ol_num); //반품할 상품 한개 정보
	//	int requestRefund(int ol_order_num); //결제취소(입금완료 - 취소)
}
