package com.javalec.ex.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.AdminOrderDao;
import com.javalec.ex.dto.OrderListDto;

@Service
public class AdminOrderServiceImpl implements AdminOrderService {

	@Autowired
	AdminOrderDao aoDao;

	// 주문리스트 전체
	@Override
	public List<OrderListDto> getAllOrderlist(String option) {
		return aoDao.getAllOrderlist(option);
	}
	
	// 총 주문건수
	@Override
	public int countOrder() {
		return aoDao.countOrder();
	}

	// 검색
	@Override
	public List<HashMap<String, Object>> search_1(HashMap<String, String> map) {
		return aoDao.search_1(map);
	}

	@Override
	public int countSearch(HashMap<String, String> map) {
		return aoDao.countSearch(map);
	}


	
}
