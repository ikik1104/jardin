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

	@Override
	public int returnRq(String ol_num, String rt_amt, String rt_reason) {
		return orderCheckDao.returnRq(ol_num, rt_amt, rt_reason);
	}

	@Override
	public int deleteOrderOne(String ol_num) {
		return orderCheckDao.deleteOrderOne(ol_num);
	}

	@Override
	public int updateOrderAmount(String ol_num, int ol_amt, int ol_price) {
		return orderCheckDao.updateOrderAmount(ol_num, ol_amt, ol_price);
	}

	@Override
	public List<Map<String, String>> reviewReadyList(int ol_order_num) {
		return orderCheckDao.reviewReadyList(ol_order_num);
	}

	@Override
	public int updateStatus(int ol_order_num, String order_status) {
		return orderCheckDao.updateStatus(ol_order_num, order_status);
	}

	

//	@Override
//	public int requestRefund(int ol_order_num) {
//		return orderCheckDao.requestRefund(ol_order_num);
//	}


	
}
