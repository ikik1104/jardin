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
	public int countOrder(String status) {
		return aoDao.countOrder(status);
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

	// 입금대기 리스트 전체
	@Override
	public List<HashMap<String, Object>> deposit_waiting_list(HashMap<String, String> map) {
		return aoDao.deposit_waiting_list(map);
	}
	// 입금대기 리스트 - 검색 & 정렬
	@Override
	public List<HashMap<String, Object>> searchandsort(HashMap<String, String> map) {
		return aoDao.searchandsort(map);
	}

	// 선택한 주문건 처리상태 변경
	@Override
	public int change_status(String orderNum, String statusOpt) {
		return aoDao.change_status(orderNum, statusOpt);
	}


	
}
