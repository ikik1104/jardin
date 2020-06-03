package com.javalec.ex.dto;

import java.sql.Timestamp;

public class Cou_IssueDto {

	private int rownum;		//DB에서 가져오는 rownum
	private int ci_num; //�߱� ������ȣ
	private int m_num; //ȸ�� ������ȣ
	private int co_num; //��� ����(���� ������ȣ )
	private Timestamp ci_issue_day; //�߱���
	private Timestamp ci_end_day; //��� ������
	
	public Cou_IssueDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cou_IssueDto(int ci_num, int m_num, int co_num, Timestamp ci_issue_day, Timestamp ci_end_day) {
		super();
		this.ci_num = ci_num;
		this.m_num = m_num;
		this.co_num = co_num;
		this.ci_issue_day = ci_issue_day;
		this.ci_end_day = ci_end_day;
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
	
	
}
