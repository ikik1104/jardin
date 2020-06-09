package com.javalec.ex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.OrderCheckDao;

@Service
public class OrderCheckServiceImp implements OrderCheckService {

	@Autowired
	OrderCheckDao orderCheckDao;

	@Override
	public int countOrder(int m_num) {
		return orderCheckDao.countOrder(m_num);
	}
	
}
