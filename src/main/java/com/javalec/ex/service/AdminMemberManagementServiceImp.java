package com.javalec.ex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.AdminMemberManagementDao;
import com.javalec.ex.dto.AllDto;

@Service
public class AdminMemberManagementServiceImp implements AdminMemberManagementService {

	@Autowired
	AdminMemberManagementDao managementdao;

	//회원 등급 전체 리스트 불러오기
	public List<AllDto> getAllLevels() {
		return managementdao.getAllLevels();
	}

	//선택환 회원 등급 일괄 변경
	public int modifyLevels(HashMap<String, String> idmap, String select_level) {
		return managementdao.modifyLevels(idmap, select_level);
	}
	
}
