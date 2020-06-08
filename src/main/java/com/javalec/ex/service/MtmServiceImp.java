package com.javalec.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.MtmDao;
import com.javalec.ex.dto.MtmAnswerDto;
import com.javalec.ex.dto.MtmUserDto;
import com.javalec.ex.dto.PageDto;

@Service
public class MtmServiceImp implements MtmService {

	@Autowired
	MtmDao mtmDao;
	
	@Override
	public int countInquiry(int m_num) {
		return mtmDao.countInquiry(m_num);
	}
	
	@Override
	public List<MtmUserDto> getAllInquiry(int m_num, PageDto pageDto) {
		return mtmDao.getAllInquiry(m_num, pageDto);
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
	public MtmUserDto getPreTitle(int m_num, int rownum) {
		return mtmDao.getPreTitle(m_num, rownum);
	}

	@Override
	public MtmUserDto getNextTitle(int m_num, int rownum) {
		return mtmDao.getNextTitle(m_num, rownum);
	}

	@Override
	public void insertInquiry(MtmUserDto mtmUserDto) {
		mtmDao.insertInquiry(mtmUserDto);
	}

	@Override
	public MtmUserDto modifyView(int iu_num) {
		return mtmDao.modifyView(iu_num);
	}

	@Override
	public void modifyInquiry(MtmUserDto mtmUserDto) {
		mtmDao.modifyInquiry(mtmUserDto);
	}

	@Override
	public int deleteInquiry(int iu_num) {
		return mtmDao.deleteInquiry(iu_num);
	}

	


}
