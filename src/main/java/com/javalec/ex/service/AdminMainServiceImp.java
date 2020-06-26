package com.javalec.ex.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

	@Override
	public MainBannerDto selectMainBanners() {
		return amdao.selectMainBanners();
	}

	@Override
	public void deleteMainBanner(String orders) {
		amdao.deleteMainBanner(orders);
	}

	@Override
	public int countMainBanners() {
		return amdao.countMainBanners();
	}

	@Override
	public void updateMainBanner(MainBannerDto mbdto) {
		amdao.updateMainBanner(mbdto);
	}

	@Override
	public String selectMl() {
		String selectml = amdao.selectMl();
		return selectml;
	}

	@Override
	public int insertMl(String file_name) {
		return amdao.insertMl(file_name);
	}

	@Override
	public int updateMl(String file_name) {
		return amdao.updateMl(file_name);
	}

	@Override
	public String selectMr() {
		return amdao.selectMr();
	}

	@Override
	public int insertMr(String file_name) {
		return amdao.insertMr(file_name);
	}

	@Override
	public int updateMr(String file_name) {
		return amdao.updateMr(file_name);
	}



}
