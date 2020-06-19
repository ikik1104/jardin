package com.javalec.ex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.OrderListDto;
import com.javalec.ex.dto.PageDto;

@Repository
public interface NonMemDao {

	List<Map<String, String>> getAllNonOrder(String order_num); //비회원 주문조회
	int nonMemLog(@Param("orderListDto")OrderListDto orderListDto); //비회원 조회 로그인
	
}
