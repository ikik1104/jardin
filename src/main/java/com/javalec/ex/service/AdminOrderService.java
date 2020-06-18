package com.javalec.ex.service;

import java.util.HashMap;
import java.util.List;

import com.javalec.ex.dto.OrderListDto;

public interface AdminOrderService {

	// 주문리스트 전체
	List<OrderListDto> getAllOrderlist(String option);
	
	// 검색1
	List<HashMap<String,Object>> search_1(HashMap<String, String> map);
		
	// 총 주문건수
	int countOrder();
	
	// 검색 주문건수
	int countSearch(HashMap<String, String> map);
	
}
