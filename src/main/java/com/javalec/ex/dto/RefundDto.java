package com.javalec.ex.dto;

import java.sql.Timestamp;

public class RefundDto {

	private int rownum;		//DB에서 가져오는 rownum
	private int rf_num; //환불 고유번호
	private int rf_receipt_num; //환불 접수번호
	private int ol_num; //주문 고유번호
	private int rf_price; //환불 금액
	private String rf_status; //환불 상태
	private String rf_method; //환불 수단
	private Timestamp rt_reciept_date; //환불 접수일
	private Timestamp rt_end_date; //환불 완료일
	private String ol_order_num;
	private String p_name;

	public RefundDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RefundDto(int rf_num, int rf_receipt_num, int ol_num, int rf_price, String rf_status, String rf_method,
			Timestamp rt_reciept_date, Timestamp rt_end_date, String ol_order_num, String p_name) {
		super();
		this.rf_num = rf_num;
		this.rf_receipt_num = rf_receipt_num;
		this.ol_num = ol_num;
		this.rf_price = rf_price;
		this.rf_status = rf_status;
		this.rf_method = rf_method;
		this.rt_reciept_date = rt_reciept_date;
		this.rt_end_date = rt_end_date;
		this.ol_order_num = ol_order_num;
		this.p_name=p_name;
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
	public int getRf_num() {
		return rf_num;
	}
	public void setRf_num(int rf_num) {
		this.rf_num = rf_num;
	}
	public int getRf_receipt_num() {
		return rf_receipt_num;
	}
	public void setRf_receipt_num(int rf_receipt_num) {
		this.rf_receipt_num = rf_receipt_num;
	}
	public int getOl_num() {
		return ol_num;
	}
	public void setOl_num(int ol_num) {
		this.ol_num = ol_num;
	}
	public int getRf_price() {
		return rf_price;
	}
	public void setRf_price(int rf_price) {
		this.rf_price = rf_price;
	}
	public String getRf_status() {
		return rf_status;
	}
	public void setRf_status(String rf_status) {
		this.rf_status = rf_status;
	}
	public String getRf_method() {
		return rf_method;
	}
	public void setRf_method(String rf_method) {
		this.rf_method = rf_method;
	}
	public Timestamp getRt_reciept_date() {
		return rt_reciept_date;
	}
	public void setRt_reciept_date(Timestamp rt_reciept_date) {
		this.rt_reciept_date = rt_reciept_date;
	}
	public Timestamp getRt_end_date() {
		return rt_end_date;
	}
	public void setRt_end_date(Timestamp rt_end_date) {
		this.rt_end_date = rt_end_date;
	}

	
	

}
