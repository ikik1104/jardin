package com.javalec.ex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.LevelDto;

public interface AdminMemberManagementService {

	//회원 등급 전체 리스트 불러오기
	public List<AllDto> getAllLevels();

	//선택한 회원등급 일괄 변경
	public int modifyLevels(HashMap<String, String> idmap, String select_level);

	//등급 전체 리스트 가져오기
	public List<AllDto> getAllLevelSorts();

	//등급 새로 1개 추가
	public int insertLevel(LevelDto levelDto);

	//등급 1개 조회
	public AllDto getLevelInfo(LevelDto levelDto);

	//등급 1개 삭제
	public int deleteLevel(int lv_num);

	//등급 1개 수정
	public int modifyLevel(LevelDto levelDto);

	//선택 등급 일괄 삭제
	public int deleteSomeLevels(int[] chkArray);
	
}
