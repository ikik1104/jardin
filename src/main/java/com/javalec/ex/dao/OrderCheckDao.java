package com.javalec.ex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.OrderListDto;
import com.javalec.ex.dto.PageDto;

@Repository
public interface OrderCheckDao {

	int countOrder(String m_id); //특정 회원의 전체 주문건
	List<Map<String, String>> getAllOrder(@Param("m_id")String m_id, @Param("pageDto")PageDto pageDto); // 특정 회원의 전체 주문 목록
	
}
