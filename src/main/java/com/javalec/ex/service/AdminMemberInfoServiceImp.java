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

	//회원 1명 탈퇴 처리
	public int deleteMember(int m_num) {
		return infodao.deleteMember(m_num);
	}

	//휴면 회원 전체 불러오기(회원 일괄 휴면<->가입 전환)
	public List<AllDto> getAllSleepMembers() {
		System.out.println("imp들어옴");
		int success = infodao.turnMemberStatus();//회원 일괄 휴면<->가입 전환
		return infodao.getAllSleepMembers();//휴면 회원 전체 리스트 불러오기
	}

	//휴면 회원 정보 1개 불러오기
	public AllDto getSleepMember(MemberDto memberDto) {
		return infodao.getSleepMember(memberDto);
	}

	//탈퇴 회원 전체 리스트 불러오기
	public List<AllDto> getLeftMembers() {
		return infodao.getLeftMembers();
	}

	//탈퇴 회원정보 1개 불러오기
	public AllDto getLeftMember(MemberDto memberDto) {
		return infodao.getLeftMember(memberDto);
	}

	//탈퇴 회원 1명 영구 삭제
	public int deleteForeverMember(int m_num) {
		return infodao.deleteForeverMember(m_num);
	}	
	
	
}
