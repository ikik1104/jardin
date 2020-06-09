package com.javalec.ex.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface OrderCheckDao {

	int countOrder(String m_id); //특정 회원의 전체 주문건
	
}
