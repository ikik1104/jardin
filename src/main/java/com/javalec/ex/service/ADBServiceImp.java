package com.javalec.ex.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.ADBMtmDao;
import com.javalec.ex.dao.BDao;
import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmAnswerDto;
import com.javalec.ex.dto.MtmUserDto;

@Service
public class ADBServiceImp implements ADBService {
	@Autowired
	ADBMtmDao adbmtmdao;

	//1:1문의 전체 리스트 불러오기
	@Override
	public List<MtmUserDto> getAllBoards() {
		return adbmtmdao.getAllBoards();
	}
	
	//1:1문의 글 1개 삭제
	@Override
	public int deleteUserBoard(int iu_num) {
		int success = adbmtmdao.deleteUserBoard(iu_num);
		System.out.println(success);
		return success;
	}
	
	//1:1 답변 1개 불러오기
	@Override
	public AllDto getAnswerBoard(int iu_num) {
		return adbmtmdao.getAnswerBoard(iu_num);		
	}

	
	
	

	

	

}
