package com.javalec.ex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.OrderCheckDao;
import com.javalec.ex.dto.OrderListDto;
import com.javalec.ex.dto.PageDto;

@Service
public class OrderCheckServiceImp implements OrderCheckService {

	@Autowired
	OrderCheckDao orderCheckDao;

	@Override
	public int countOrder(String m_id) {
		return orderCheckDao.countOrder(m_id);
	}

	@Override
	public List<Map<String, String>> getAllOrder(String m_id, PageDto pageDto) {
		return orderCheckDao.getAllOrder(m_id, pageDto);
	}

	@Override
	public int deleteOrder(int ol_order_num) {
		return orderCheckDao.deleteOrder(ol_order_num);
	}

	@Override
	public List<Map<String, String>> getOneSetOrder(int ol_order_num) {
		return orderCheckDao.getOneSetOrder(ol_order_num);
	}

	

//	@Override
//	public int requestRefund(int ol_order_num) {
//		return orderCheckDao.requestRefund(ol_order_num);
//	}


	
}
