package com.javalec.ex.dto;

import java.sql.Timestamp;

public class CartDto {

	private int ca_num; //��ٱ��� ������ȣ
	private int m_num; //ȸ�� ������ȣ
	private int p_num; //��ǰ�ڵ� 
	private int ca_amount; //����
	private Timestamp ca_sysdate; //��ٱ��� �����
	private ProductDto pDto;
	
	public CartDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartDto(int ca_num, int m_num, int p_num, int ca_amount, Timestamp ca_sysdate, ProductDto pDto) {
		super();
		this.ca_num = ca_num;
		this.m_num = m_num;
		this.p_num = p_num;
		this.ca_amount = ca_amount;
		this.ca_sysdate = ca_sysdate;
		this.pDto = pDto;
	}

	public int getCa_num() {
		return ca_num;
	}

	public void setCa_num(int ca_num) {
		this.ca_num = ca_num;
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

	public int getCa_amount() {
		return ca_amount;
	}

	public void setCa_amount(int ca_amount) {
		this.ca_amount = ca_amount;
	}

	public Timestamp getCa_sysdate() {
		return ca_sysdate;
	}

	public void setCa_sysdate(Timestamp ca_sysdate) {
		this.ca_sysdate = ca_sysdate;
	}

	public ProductDto getpDto() {
		return pDto;
	}

	public void setpDto(ProductDto pDto) {
		this.pDto = pDto;
	}

	
	
	
}
