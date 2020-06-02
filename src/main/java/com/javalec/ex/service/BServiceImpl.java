package com.javalec.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.BDao;
import com.javalec.ex.dto.BDto;

@Service
public class BServiceImpl implements BService {
	@Autowired
	BDao bDao;

	@Override
	public List<BDto> getAllBoards() {
		// TODO Auto-generated method stub
		return bDao.getAllBoards();
	}

}
