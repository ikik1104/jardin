package com.javalec.ex.dto;

import java.sql.Timestamp;

public class E_CommentDto {
	private int rownum;		//DB에서 가져오는 rownum
	private int ec_num; //�̺�Ʈ ��� ������ȣ
	private int m_num; //(�ۼ���)ȸ�� ������ȣ
	private int e_num; //�̺�Ʈ �Խù� ��ȣ
	private String ec_content; //�۳���
	private String ec_pw; //��й�ȣ
	private Timestamp ec_sysdate; //�����
	public E_CommentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public E_CommentDto(int ec_num, int m_num, int e_num, String ec_content, String ec_pw, Timestamp ec_sysdate) {
		super();
		this.ec_num = ec_num;
		this.m_num = m_num;
		this.e_num = e_num;
		this.ec_content = ec_content;
		this.ec_pw = ec_pw;
		this.ec_sysdate = ec_sysdate;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}		
	public int getEc_num() {
		return ec_num;
	}
	public void setEc_num(int ec_num) {
		this.ec_num = ec_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getE_num() {
		return e_num;
	}
	public void setE_num(int e_num) {
		this.e_num = e_num;
	}
	public String getEc_content() {
		return ec_content;
	}
	public void setEc_content(String ec_content) {
		this.ec_content = ec_content;
	}
	public String getEc_pw() {
		return ec_pw;
	}
	public void setEc_pw(String ec_pw) {
		this.ec_pw = ec_pw;
	}
	public Timestamp getEc_sysdate() {
		return ec_sysdate;
	}
	public void setEc_sysdate(Timestamp ec_sysdate) {
		this.ec_sysdate = ec_sysdate;
	}
	
	
}
