package com.javalec.ex.dto;

import java.sql.Timestamp;

public class ReturnDto {

	private int rownum;		//DB에서 가져오는 rownum
	private int rt_num; //반품교환 고유번호
	private String rt_receipt_num; //반품교환 접수번호
	private int ol_num; //주문 고유번호
	private String rt_sort; //분류
	private int rt_amount; //수량
	private String rt_status; //반품교환 상태
	private String rt_reason; //반품교환 사유
	private Timestamp rt_receipt_date; //반품교환 접수일
	private Timestamp rt_end_date; //반품교환 완료일
	private String ol_order_num;
	private String p_name;
	private String m_id;
	private int rt_price;
	private String ol_payment; //환불방법

	public ReturnDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReturnDto(int rownum, int rt_num, String rt_receipt_num, int ol_num, String rt_sort, int rt_amount,
			String rt_status, String rt_reason, Timestamp rt_receipt_date, Timestamp rt_end_date, String ol_order_num,
			String p_name, String m_id, int rt_price, String ol_payment) {
		super();
		this.rownum = rownum;
		this.rt_num = rt_num;
		this.rt_receipt_num = rt_receipt_num;
		this.ol_num = ol_num;
		this.rt_sort = rt_sort;
		this.rt_amount = rt_amount;
		this.rt_status = rt_status;
		this.rt_reason = rt_reason;
		this.rt_receipt_date = rt_receipt_date;
		this.rt_end_date = rt_end_date;
		this.ol_order_num = ol_order_num;
		this.p_name = p_name;
		this.m_id = m_id;
		this.rt_price = rt_price;
		this.ol_payment = ol_payment;
	}

	
	public synchronized String getOl_payment() {
		return ol_payment;
	}
	public synchronized void setOl_payment(String ol_payment) {
		this.ol_payment = ol_payment;
	}
	public synchronized int getRt_price() {
		return rt_price;
	}
	public synchronized void setRt_price(int rt_price) {
		this.rt_price = rt_price;
	}
	public synchronized String getM_id() {
		return m_id;
	}
	public synchronized void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getOl_order_num() {
		return ol_order_num;
	}
	public void setOl_order_num(String ol_order_num) {
		this.ol_order_num = ol_order_num;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
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
	public String getRt_receipt_num() {
		return rt_receipt_num;
	}
	public void setRt_receipt_num(String rt_receipt_num) {
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
