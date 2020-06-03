package com.javalec.ex.service;

import java.util.List;

import com.javalec.ex.dto.MtmAnswerDto;
import com.javalec.ex.dto.MtmUserDto;

public interface MtmService {

	List<MtmUserDto> getAllInquiry(int m_num);
	MtmUserDto getOneInquiry(int iu_num);
	MtmAnswerDto getOneAnswer(int iu_num);
	List<MtmUserDto> getPreTitle(int iu_rownum);
	List<MtmUserDto> getNextTitle(int iu_rownum);
	
}
