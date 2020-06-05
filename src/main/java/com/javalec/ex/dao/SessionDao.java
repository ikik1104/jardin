package com.javalec.ex.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface SessionDao {

	public int getMnum(String m_id);
	
}
