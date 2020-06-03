package com.javalec.ex.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.MemberDto;
import com.javalec.ex.dto.MtmUserDto;

@Repository
public interface ADBMtmDao {
	
	List<MtmUserDto> getAllBoards();
}
