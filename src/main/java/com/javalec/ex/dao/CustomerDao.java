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
public interface CustomerDao {

	
	
	//FAQ----------------------------------------------------------------
	
	//faq 리스트
	List<FaqDto> getFaqList();
	
	//카테고리별
	List<FaqDto> getFaq_StepList(String f_step);
	

	
}
