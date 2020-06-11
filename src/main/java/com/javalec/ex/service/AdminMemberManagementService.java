package com.javalec.ex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.javalec.ex.dto.AllDto;

public interface AdminMemberManagementService {

	//회원 등급 전체 리스트 불러오기
	public List<AllDto> getAllLevels();

	//선택한 회원등급 일괄 변경
	public int modifyLevels(HashMap<String, String> idmap, String select_level);
	
}
