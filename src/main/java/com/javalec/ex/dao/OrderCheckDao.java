package com.javalec.ex.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface OrderCheckDao {

	int countOrder(int m_num); //특정 회원의 전체 주문건
	
}
