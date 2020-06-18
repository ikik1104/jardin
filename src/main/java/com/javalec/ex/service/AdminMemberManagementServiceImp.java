package com.javalec.ex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.AdminMemberManagementDao;
import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.LevelDto;

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

	//등급 전체 리스트 가져오기
	public List<AllDto> getAllLevelSorts() {
		return  managementdao.getallLevelSorts();
	}

	//등급 새로 1개 추가
	public int insertLevel(LevelDto levelDto) {
		return managementdao.insertLevel(levelDto);
	}

	//등급 1개 조회
	public AllDto getLevelInfo(LevelDto levelDto) {
		return managementdao.getLevelInfo(levelDto);
	}

	//등급 1개 삭제
	public int deleteLevel(int lv_num) {
		return managementdao.deleteLevel(lv_num);
	}

	//등급 1개 수정
	public int modifyLevel(LevelDto levelDto) {
		return managementdao.modifyLevel(levelDto);
	}
	
}
