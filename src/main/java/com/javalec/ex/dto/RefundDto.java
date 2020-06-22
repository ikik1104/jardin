package com.javalec.ex.dto;

import java.sql.Timestamp;

public class RefundDto {

	private int rownum;		//DB에서 가져오는 rownum
	private int rf_num; //환불 고유번호
	private String rf_receipt_num; //환불 접수번호
	private int ol_num; //주문 고유번호
	private int rf_price; //환불 금액
	private String rf_status; //환불 상태
	private String rf_method; //환불 수단
	private Timestamp rf_receipt_date; //환불 접수일
	private Timestamp rf_end_date; //환불 완료일
	private String ol_order_num;
	private String p_name;
	private String m_id;

	public RefundDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RefundDto(int rownum, int rf_num, String rf_receipt_num, int ol_num, int rf_price, String rf_status,
			String rf_method, Timestamp rf_receipt_date, Timestamp rf_end_date, String ol_order_num, String p_name,
			String m_id) {
		super();
		this.rownum = rownum;
		this.rf_num = rf_num;
		this.rf_receipt_num = rf_receipt_num;
		this.ol_num = ol_num;
		this.rf_price = rf_price;
		this.rf_status = rf_status;
		this.rf_method = rf_method;
		this.rf_receipt_date = rf_receipt_date;
		this.rf_end_date = rf_end_date;
		this.ol_order_num = ol_order_num;
		this.p_name = p_name;
		this.m_id = m_id;
	}
	public synchronized int getRownum() {
		return rownum;
	}
	public synchronized void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public synchronized int getRf_num() {
		return rf_num;
	}
	public synchronized void setRf_num(int rf_num) {
		this.rf_num = rf_num;
	}
	public synchronized String getRf_receipt_num() {
		return rf_receipt_num;
	}
	public synchronized void setRf_receipt_num(String rf_receipt_num) {
		this.rf_receipt_num = rf_receipt_num;
	}
	public synchronized int getOl_num() {
		return ol_num;
	}
	public synchronized void setOl_num(int ol_num) {
		this.ol_num = ol_num;
	}
	public synchronized int getRf_price() {
		return rf_price;
	}
	public synchronized void setRf_price(int rf_price) {
		this.rf_price = rf_price;
	}
	public synchronized String getRf_status() {
		return rf_status;
	}
	public synchronized void setRf_status(String rf_status) {
		this.rf_status = rf_status;
	}
	public synchronized String getRf_method() {
		return rf_method;
	}
	public synchronized void setRf_method(String rf_method) {
		this.rf_method = rf_method;
	}
	public synchronized Timestamp getRf_receipt_date() {
		return rf_receipt_date;
	}
	public synchronized void setRf_receipt_date(Timestamp rf_receipt_date) {
		this.rf_receipt_date = rf_receipt_date;
	}
	public synchronized Timestamp getRf_end_date() {
		return rf_end_date;
	}
	public synchronized void setRf_end_date(Timestamp rf_end_date) {
		this.rf_end_date = rf_end_date;
	}
	public synchronized String getOl_order_num() {
		return ol_order_num;
	}
	public synchronized void setOl_order_num(String ol_order_num) {
		this.ol_order_num = ol_order_num;
	}
	public synchronized String getP_name() {
		return p_name;
	}
	public synchronized void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public synchronized String getM_id() {
		return m_id;
	}
	public synchronized void setM_id(String m_id) {
		this.m_id = m_id;
	}
	

	
	

}
