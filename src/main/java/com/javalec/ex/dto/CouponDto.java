package com.javalec.ex.dto;

import java.sql.Timestamp;

public class CouponDto {

	private int rownum;		//DB에서 가져오는 rownum
	private int co_num; //���� ������ȣ
	private String co_name; //������
	private Timestamp co_start_day; //������
	private Timestamp co_end_day; //������
	private int co_expiry; //������ȿ�Ⱓ
	private String co_discount; //���� Ÿ��
	private int co_amount; //���αݾ�
	private Timestamp co_sysdate; //���� �����
	private int co_product; //��ǰ���� ���� ��ǰ ������ȣ
	
	
	public CouponDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CouponDto(int co_num, String co_name, Timestamp co_start_day, Timestamp co_end_day, int co_expiry,
			String co_discount, int co_amount, Timestamp co_sysdate, int co_product) {
		super();
		this.co_num = co_num;
		this.co_name = co_name;
		this.co_start_day = co_start_day;
		this.co_end_day = co_end_day;
		this.co_expiry = co_expiry;
		this.co_discount = co_discount;
		this.co_amount = co_amount;
		this.co_sysdate = co_sysdate;
		this.co_product = co_product;
	}
	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}			
	public int getCo_num() {
		return co_num;
	}
	public void setCo_num(int co_num) {
		this.co_num = co_num;
	}
	public String getCo_name() {
		return co_name;
	}
	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}
	public Timestamp getCo_start_day() {
		return co_start_day;
	}
	public void setCo_start_day(Timestamp co_start_day) {
		this.co_start_day = co_start_day;
	}
	public Timestamp getCo_end_day() {
		return co_end_day;
	}
	public void setCo_end_day(Timestamp co_end_day) {
		this.co_end_day = co_end_day;
	}
	public int getCo_expiry() {
		return co_expiry;
	}
	public void setCo_expiry(int co_expiry) {
		this.co_expiry = co_expiry;
	}
	public String getCo_discount() {
		return co_discount;
	}
	public void setCo_discount(String co_discount) {
		this.co_discount = co_discount;
	}
	public int getCo_amount() {
		return co_amount;
	}
	public void setCo_amount(int co_amount) {
		this.co_amount = co_amount;
	}
	public Timestamp getCo_sysdate() {
		return co_sysdate;
	}
	public void setCo_sysdate(Timestamp co_sysdate) {
		this.co_sysdate = co_sysdate;
	}
	public int getCo_product() {
		return co_product;
	}
	public void setCo_product(int co_product) {
		this.co_product = co_product;
	}
	
	
}
