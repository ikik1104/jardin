package com.javalec.ex.dto;

import java.sql.Timestamp;

public class WishListDto {
	private int rownum;		//DB에서 가져오는 rownum
	private int w_num; //���ø���Ʈ ������ȣ
	private int m_num; //ȸ�� ������ȣ
	private int p_num; //��ǰ ������ȣ
	private int w_amount; //����
	private Timestamp w_sysdate; //�����
	public WishListDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WishListDto(int w_num, int m_num, int p_num, int w_amount, Timestamp w_sysdate) {
		super();
		this.w_num = w_num;
		this.m_num = m_num;
		this.p_num = p_num;
		this.w_amount = w_amount;
		this.w_sysdate = w_sysdate;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}		
	public int getW_num() {
		return w_num;
	}
	public void setW_num(int w_num) {
		this.w_num = w_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getW_amount() {
		return w_amount;
	}
	public void setW_amount(int w_amount) {
		this.w_amount = w_amount;
	}
	public Timestamp getW_sysdate() {
		return w_sysdate;
	}
	public void setW_sysdate(Timestamp w_sysdate) {
		this.w_sysdate = w_sysdate;
	}
	
	
}
