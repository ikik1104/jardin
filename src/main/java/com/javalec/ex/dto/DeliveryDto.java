package com.javalec.ex.dto;

import java.sql.Timestamp;

public class DeliveryDto {

	private int d_id;     //배송고유번호
	private int ol_order_num;     //주문번호
	private String d_status;     //배송상태
	private Timestamp d_end_date;     //배송완료날짜
	private String d_com;     //택배사
	private int d_track_num;     //운송장번호
	
	public DeliveryDto() {}

	public DeliveryDto(int d_id, int ol_order_num, String d_status, Timestamp d_end_date, String d_com,
			int d_track_num) {
		super();
		this.d_id = d_id;
		this.ol_order_num = ol_order_num;
		this.d_status = d_status;
		this.d_end_date = d_end_date;
		this.d_com = d_com;
		this.d_track_num = d_track_num;
	}

	public int getD_id() {
		return d_id;
	}

	public void setD_id(int d_id) {
		this.d_id = d_id;
	}

	public int getOl_order_num() {
		return ol_order_num;
	}

	public void setOl_order_num(int ol_order_num) {
		this.ol_order_num = ol_order_num;
	}

	public String getD_status() {
		return d_status;
	}

	public void setD_status(String d_status) {
		this.d_status = d_status;
	}

	public Timestamp getD_end_date() {
		return d_end_date;
	}

	public void setD_end_date(Timestamp d_end_date) {
		this.d_end_date = d_end_date;
	}

	public String getD_com() {
		return d_com;
	}

	public void setD_com(String d_com) {
		this.d_com = d_com;
	}

	public int getD_track_num() {
		return d_track_num;
	}

	public void setD_track_num(int d_track_num) {
		this.d_track_num = d_track_num;
	}
	
	
}
