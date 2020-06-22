package com.javalec.ex.service;

import java.util.List;
import java.util.Map;

import com.javalec.ex.dto.OrderListDto;

public interface NonMemService {

	List<Map<String, String>> getAllNonOrder(String order_num); //비회원 주문조회
	int nonMemLog(OrderListDto orderListDto); //비회원 주문목록 여부 조회
	int nonMemLog2(OrderListDto orderListDto); // 비회원 반품목록 여부 조회
	List<Map<String, String>> getAllClaim(String order_num);
}
