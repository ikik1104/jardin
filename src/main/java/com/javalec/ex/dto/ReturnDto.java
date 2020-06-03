package com.javalec.ex.dto;

import java.sql.Timestamp;

public class ReturnDto {
	private int rownum;		//DB에서 가져오는 rownum
	private int rt_num; //��ǰ��ȯ ������ȣ
	private int rt_receipt_num; //��ǰ��ȯ ������ȣ
	private int ol_num; //�ֹ� ������ȣ
	private String rt_sort; //�з�
	private int rt_amount; //����
	private String rt_status; //��ǰ��ȯ ����
	private String rt_reason; //��ǰ��ȯ ����
	private Timestamp rt_receipt_date; //��ǰ��ȯ ������
	private Timestamp rt_end_date; //��ǰ��ȯ �Ϸ���
	public ReturnDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReturnDto(int rt_num, int rt_receipt_num, int ol_num, String rt_sort, int rt_amount, String rt_status,
			String rt_reason, Timestamp rt_receipt_date, Timestamp rt_end_date) {
		super();
		this.rt_num = rt_num;
		this.rt_receipt_num = rt_receipt_num;
		this.ol_num = ol_num;
		this.rt_sort = rt_sort;
		this.rt_amount = rt_amount;
		this.rt_status = rt_status;
		this.rt_reason = rt_reason;
		this.rt_receipt_date = rt_receipt_date;
		this.rt_end_date = rt_end_date;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}		
	public int getRt_num() {
		return rt_num;
	}
	public void setRt_num(int rt_num) {
		this.rt_num = rt_num;
	}
	public int getRt_receipt_num() {
		return rt_receipt_num;
	}
	public void setRt_receipt_num(int rt_receipt_num) {
		this.rt_receipt_num = rt_receipt_num;
	}
	public int getOl_num() {
		return ol_num;
	}
	public void setOl_num(int ol_num) {
		this.ol_num = ol_num;
	}
	public String getRt_sort() {
		return rt_sort;
	}
	public void setRt_sort(String rt_sort) {
		this.rt_sort = rt_sort;
	}
	public int getRt_amount() {
		return rt_amount;
	}
	public void setRt_amount(int rt_amount) {
		this.rt_amount = rt_amount;
	}
	public String getRt_status() {
		return rt_status;
	}
	public void setRt_status(String rt_status) {
		this.rt_status = rt_status;
	}
	public String getRt_reason() {
		return rt_reason;
	}
	public void setRt_reason(String rt_reason) {
		this.rt_reason = rt_reason;
	}
	public Timestamp getRt_receipt_date() {
		return rt_receipt_date;
	}
	public void setRt_receipt_date(Timestamp rt_receipt_date) {
		this.rt_receipt_date = rt_receipt_date;
	}
	public Timestamp getRt_end_date() {
		return rt_end_date;
	}
	public void setRt_end_date(Timestamp rt_end_date) {
		this.rt_end_date = rt_end_date;
	}
	
	
	
	
}
