package com.javalec.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.BDto;

@Repository
public interface BDao {
	
	List<BDto> getAllBoards();
}
