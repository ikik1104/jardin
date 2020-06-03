package com.javalec.ex.dto;

import java.sql.Timestamp;

public class PointDto {

	private int po_num; //포인트 사용 고유번호
	private int m_num; //회원 고유번호
	private String  po_type; //포인트 타입
	private int po_point; //포인트
	private Timestamp po_sysdate; //등록일
	public PointDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PointDto(int po_num, int m_num, String po_type, int po_point, Timestamp po_sysdate) {
		super();
		this.po_num = po_num;
		this.m_num = m_num;
		this.po_type = po_type;
		this.po_point = po_point;
		this.po_sysdate = po_sysdate;
	}
	public int getPo_num() {
		return po_num;
	}
	public void setPo_num(int po_num) {
		this.po_num = po_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getPo_type() {
		return po_type;
	}
	public void setPo_type(String po_type) {
		this.po_type = po_type;
	}
	public int getPo_point() {
		return po_point;
	}
	public void setPo_point(int po_point) {
		this.po_point = po_point;
	}
	public Timestamp getPo_sysdate() {
		return po_sysdate;
	}
	public void setPo_sysdate(Timestamp po_sysdate) {
		this.po_sysdate = po_sysdate;
	}
	
	
}
