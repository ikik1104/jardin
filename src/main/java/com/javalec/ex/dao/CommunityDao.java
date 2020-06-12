package com.javalec.ex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.EnjoyCoffeeDto;
import com.javalec.ex.dto.FaqDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;

@Repository
public interface CommunityDao {
	
	//enjoy coffee-----------------------------------------------------------------
	
	//enjoy coffee 리스트
	List<EnjoyCoffeeDto> enjoy_List();
	
	//enjoy coffee 조회수 증가
	void enjoy_hitUp(int ej_num);


}
