package com.javalec.ex.dto;

import java.sql.Timestamp;

public class Cou_IssueDto {

	private int rownum;		//DB에서 가져오는 rownum
	private int ci_num; //발급 고유번호
	private int m_num; //회원 고유번호
	private int co_num; //사용 쿠폰(쿠폰 고유번호 )
	private Timestamp ci_issue_day; //발급일
	private Timestamp ci_end_day; //사용 종료일
	private Timestamp ci_use_day; // 사용한 날짜
	private CouponDto cDto;

	
	public Cou_IssueDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Cou_IssueDto(int rownum, int ci_num, int m_num, int co_num, Timestamp ci_issue_day, Timestamp ci_end_day,
			Timestamp ci_use_day, CouponDto cDto) {
		super();
		this.rownum = rownum;
		this.ci_num = ci_num;
		this.m_num = m_num;
		this.co_num = co_num;
		this.ci_issue_day = ci_issue_day;
		this.ci_end_day = ci_end_day;
		this.ci_use_day = ci_use_day;
		this.cDto = cDto;
	}


	public int getRownum() {
		return rownum;
	}


	public void setRownum(int rownum) {
		this.rownum = rownum;
	}


	public int getCi_num() {
		return ci_num;
	}


	public void setCi_num(int ci_num) {
		this.ci_num = ci_num;
	}


	public int getM_num() {
		return m_num;
	}


	public void setM_num(int m_num) {
		this.m_num = m_num;
	}


	public int getCo_num() {
		return co_num;
	}


	public void setCo_num(int co_num) {
		this.co_num = co_num;
	}


	public Timestamp getCi_issue_day() {
		return ci_issue_day;
	}


	public void setCi_issue_day(Timestamp ci_issue_day) {
		this.ci_issue_day = ci_issue_day;
	}


	public Timestamp getCi_end_day() {
		return ci_end_day;
	}


	public void setCi_end_day(Timestamp ci_end_day) {
		this.ci_end_day = ci_end_day;
	}


	public Timestamp getCi_use_day() {
		return ci_use_day;
	}


	public void setCi_use_day(Timestamp ci_use_day) {
		this.ci_use_day = ci_use_day;
	}


	public CouponDto getcDto() {
		return cDto;
	}


	public void setcDto(CouponDto cDto) {
		this.cDto = cDto;
	}
	
	
	
	
}
