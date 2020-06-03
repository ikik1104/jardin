package com.javalec.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.BDto;

@Repository
public interface BDao {

	//1. 기능별 적고
		//2. mapper.xml
		//3. 서비스
		//4. 서비스 임프
		//5. 컨트롤러

	
	List<BDto> getAllBoards();
}
