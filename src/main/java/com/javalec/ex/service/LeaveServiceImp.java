package com.javalec.ex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.LeaveDao;
import com.javalec.ex.dto.MemberDto;

@Service
public class LeaveServiceImp implements LeaveService {

	@Autowired
	LeaveDao leaveDao;
	
	@Override
	public int memberLeave(MemberDto memberDto) {
		return leaveDao.memberLeave(memberDto);
	}

}
