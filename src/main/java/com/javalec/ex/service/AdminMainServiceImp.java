package com.javalec.ex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.AdminMainDao;
import com.javalec.ex.dto.MainBannerDto;

@Service
public class AdminMainServiceImp implements AdminMainService {

	@Autowired
	AdminMainDao amdao;
	
	@Override
	public int insertMainBanner(MainBannerDto mbdto) {
		return amdao.insertMainBanner(mbdto);
	}

}
