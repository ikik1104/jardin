package com.javalec.ex.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.ADBMtmDao;
import com.javalec.ex.dao.AdminBoardDao;
import com.javalec.ex.dao.BDao;
import com.javalec.ex.dao.ChangeInfoDao;
import com.javalec.ex.dao.CustomerDao;
import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.EnjoyCoffeeDto;
import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;

@Service
public class CustomerServiceImp implements CustomerService {
	@Autowired
	CustomerDao csDao;

	
	//유저-------------------------
	
	//faq 리스트
	@Override
	public List<FaqDto> getFaqList() {
		return csDao.getFaqList();
		
	}

	//faq 카테고리별 리스트
	@Override
	public List<FaqDto> getFaq_StepList(String f_step) {
		return csDao.getFaq_StepList(f_step);
	}

	

}
