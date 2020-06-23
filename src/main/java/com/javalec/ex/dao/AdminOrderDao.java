package com.javalec.ex.dao;

import java.util.HashMap;
import java.util.List;

import com.javalec.ex.dto.OrderListDto;


public interface AdminOrderDao {
	
	// 주문리스트 전체
	List<OrderListDto> getAllOrderlist(String option);
	
	// 총 주문건수
	int countOrder();
	
	// 검색 주문건수
	int countSearch(HashMap<String, String> map);
	
	// 검색1
	List<HashMap<String,Object>> search_1(HashMap<String, String> map);
	
	// 입금대기리스트 전체
	List<HashMap<String,Object>> deposit_waiting_list(HashMap<String, String> map);
	
	// 입금대기리스트 검색, 정렬
	List<HashMap<String,Object>> searchandsort(HashMap<String, String> map);
	
	// 선택한 주문건 처리상태 변경
	int change_status(String orderNum, String statusOpt);

}
