package com.javalec.ex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.LevelDto;

@Repository
public interface AdminMemberManagementDao {

	//회원등급 전체 리스트 불러오기
	List<AllDto> getAllLevels();

	//선택한 회원등급 일괄 변경
	int modifyLevels(@Param("idmap") HashMap<String, String> idmap,@Param("select_level") String select_level);

	//등급 전체 리스트 가져오기
	List<AllDto> getallLevelSorts();

	//등급 새로 1개 추가
	int insertLevel(LevelDto levelDto);

	//등급 1개 조회
	AllDto getLevelInfo(LevelDto levelDto);

	//등급 1개 삭제
	int deleteLevel(int lv_num);

	//등급 1개 수정
	int modifyLevel(LevelDto levelDto);

	//선택 등급 일괄 삭제
	int deleteSomeLevels(@Param("chkArray") int[] chkArray);
	
	
}
