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
import com.javalec.ex.dao.CommunityDao;
import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.EnjoyCoffeeDto;
import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;

@Service
public class CommunityServiceImp implements CommunityService {
	@Autowired
	CommunityDao cmDao;

	//enjoy coffee ------------------------------------------------------------------------------

	//enjoy coffee 리스트
	@Override
	public List<EnjoyCoffeeDto> enjoy_List() {
		return cmDao.enjoy_List();
	}
	
	//enjoy coffee 조회수증가
	@Override
	public void enjoy_hitUp(int ej_num) {
		
		cmDao.enjoy_hitUp(ej_num);
		
	}
	

	

}
