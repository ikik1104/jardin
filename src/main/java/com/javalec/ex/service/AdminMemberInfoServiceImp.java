package com.javalec.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.ADBMtmDao;
import com.javalec.ex.dao.AdminMemberInfoDao;
import com.javalec.ex.dto.AllDto;
import com.javalec.ex.dto.MemberDto;

@Service
public class AdminMemberInfoServiceImp implements AdminMemberInfoService {

	/*
	[관리자]
	회원정보
	*/	
	
	@Autowired
	AdminMemberInfoDao infodao;

	//회원 전체 리스트 불러오기
	public List<AllDto> getAllMembers() {
		return infodao.getAllMembers();
	}

	//회원 1명 정보 불러오기
	public AllDto getMember(MemberDto memberDto) {
		return infodao.getMember(memberDto);
	}

	//회원 1명 정보 수정
	public int modifyMember(MemberDto memberDto) {
		return infodao.modifyMember(memberDto);
	}	
	
	
}
