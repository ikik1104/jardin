package com.javalec.ex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.PageDto;

@Repository
public interface OrderCheckDao {

	int countOrder(String m_id); //특정 회원의 전체 주문건
	List<Map<String, String>> getAllOrder(@Param("m_id")String m_id, @Param("pageDto")PageDto pageDto); // 특정 회원의 전체 주문 목록
	int deleteOrder(int ol_order_num); //주문취소(입금대기중 - 취소)
	List<Map<String, String>> getOneSetOrder(@Param("ol_order_num")int ol_order_num); // 특정 주문번호의 전체 상품목록
	
	
//	int requestRefund(int ol_order_num); //결제취소(입금완료 - 취소)
	
}
