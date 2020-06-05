package com.javalec.ex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.SessionDao;

@Service
public class SessopmServiceImp implements SessionService {

	@Autowired
	SessionDao sessionDao;
	
	@Override
	public int getMnum(String m_id) {
		return sessionDao.getMnum(m_id);
	}

}
