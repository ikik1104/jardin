package com.javalec.ex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.AllDto;

@Repository
public interface AdminMemberManagementDao {

	//회원등급 전체 리스트 불러오기
	List<AllDto> getAllLevels();

	//선택한 회원등급 일괄 변경
	int modifyLevels(@Param("idmap") HashMap<String, String> idmap,@Param("select_level") String select_level);
	
	
}
