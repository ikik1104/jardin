package com.javalec.ex.service;

import java.util.List;
import java.util.Map;

import com.javalec.ex.dto.PageDto;

public interface OrderCheckService {

	int countOrder(String m_id); //특정 회원의 전체 주문건 수
	List<Map<String, String>> getAllOrder(String m_id, PageDto pageDto); //특정 회원의 전체 주문목록
	
}
