package com.javalec.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.MtmDao;
import com.javalec.ex.dto.MtmAnswerDto;
import com.javalec.ex.dto.MtmUserDto;

@Service
public class MtmServiceImp implements MtmService {

	@Autowired
	MtmDao mtmDao;
	
	@Override
	public List<MtmUserDto> getAllInquiry(int m_num) {
		return mtmDao.getAllInquiry(m_num);
	}

	@Override
	public MtmUserDto getOneInquiry(int iu_num) {
		return mtmDao.getOneInquiry(iu_num);
	}

	@Override
	public MtmAnswerDto getOneAnswer(int iu_num) {
		return mtmDao.getOneAnswer(iu_num);
	}

	@Override
	public List<MtmUserDto> getPreTitle(int iu_rownum) {
		return mtmDao.getPreTitle(iu_rownum);
	}

	@Override
	public List<MtmUserDto> getNextTitle(int iu_rownum) {
		return mtmDao.getNextTitle(iu_rownum);
	}

}
