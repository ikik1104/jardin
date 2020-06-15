package com.javalec.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.AdminCouponDao;
import com.javalec.ex.dao.UserMemberDao;
import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.CouponDto;
import com.javalec.ex.dto.UtilDto;

@Service
public class UserMemberServiceImp implements UserMemberService {

	@Autowired
	UserMemberDao mdao;



	
}
