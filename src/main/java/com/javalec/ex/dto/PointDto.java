package com.javalec.ex.dto;

import java.sql.Timestamp;

public class PointDto {
	private int rownum;		//DB에서 가져오는 rownum
	private int po_num; //����Ʈ ��� ������ȣ
	private int m_num; //ȸ�� ������ȣ
	private String  po_type; //����Ʈ Ÿ��
	private int po_point; //����Ʈ
	private Timestamp po_sysdate; //�����
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

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
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
