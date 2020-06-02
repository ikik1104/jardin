package com.javalec.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.BDto;

@Repository
public interface BDao {
	
	//보더 리스트 불러오기
	List<BDto> getAllBoards();
}
