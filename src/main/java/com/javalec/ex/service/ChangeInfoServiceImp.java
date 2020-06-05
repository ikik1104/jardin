package com.javalec.ex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.javalec.ex.dao.ChangeInfoDao;
import com.javalec.ex.dto.MemberDto;

@Service
public class ChangeInfoServiceImp implements ChangeInfoService {

	@Autowired
	ChangeInfoDao changeInfoDao;
	
	@Override
	public MemberDto getOneInfo(int m_num) {
		return changeInfoDao.getOneInfo(m_num);
	}

}
