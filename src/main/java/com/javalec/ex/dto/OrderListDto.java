package com.javalec.ex.dto;

import java.sql.Timestamp;

public class OrderListDto {
	private int rnum;		//DB에서 가져오는 rownum
	private int ol_num;     //주문고유번호
	private String ol_order_num;     //주문번호
	private String ol_orderer_id;     //주문자id
	private int p_num;     //제품고유번호
	private int ol_amt;     //수량
	private int co_num;     //제품쿠폰
	private int ol_final_price;     //제품할인적용금액
	private String ol_payment;     //결제수단
	private Timestamp ol_date;     //주문날짜
	private Timestamp ol_d_end_date;     //배송완료날짜
	private String ol_status;     //주문상태
	private ProductDto pDto;
	
	public OrderListDto( ) {}

	public OrderListDto(int ol_num, String ol_order_num, String ol_orderer_id, int p_num, int ol_amt, int co_num,
			int ol_final_price, String ol_payment, Timestamp ol_date, Timestamp ol_d_end_date, String ol_status, ProductDto pDto) {
		super();
		this.ol_num = ol_num;
		this.ol_order_num = ol_order_num;
		this.ol_orderer_id = ol_orderer_id;
		this.p_num = p_num;
		this.ol_amt = ol_amt;
		this.co_num = co_num;
		this.ol_final_price = ol_final_price;
		this.ol_payment = ol_payment;
		this.ol_date = ol_date;
		this.ol_d_end_date = ol_d_end_date;
		this.ol_status = ol_status;
		this.pDto = pDto;
	}

	public int getRownum() {
		return rnum;
	}

	public void setRownum(int rnum) {
		this.rnum = rnum;
	}	
	public int getOl_num() {
		return ol_num;
	}

	public void setOl_num(int ol_num) {
		this.ol_num = ol_num;
	}

	public String getOl_order_num() {
		return ol_order_num;
	}

	public void setOl_order_num(String ol_order_num) {
		this.ol_order_num = ol_order_num;
	}

	public String getOl_orderer_id() {
		return ol_orderer_id;
	}

	public void setOl_orderer_id(String ol_orderer_id) {
		this.ol_orderer_id = ol_orderer_id;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getOl_amt() {
		return ol_amt;
	}

	public void setOl_amt(int ol_amt) {
		this.ol_amt = ol_amt;
	}

	public int getCo_num() {
		return co_num;
	}

	public void setCo_num(int co_num) {
		this.co_num = co_num;
	}

	public int getOl_final_price() {
		return ol_final_price;
	}

	public void setOl_final_price(int ol_final_price) {
		this.ol_final_price = ol_final_price;
	}

	public String getOl_payment() {
		return ol_payment;
	}

	public void setOl_payment(String ol_payment) {
		this.ol_payment = ol_payment;
	}

	public Timestamp getOl_date() {
		return ol_date;
	}

	public void setOl_date(Timestamp ol_date) {
		this.ol_date = ol_date;
	}

	public Timestamp getOl_d_end_date() {
		return ol_d_end_date;
	}

	public void setOl_d_end_date(Timestamp ol_d_end_date) {
		this.ol_d_end_date = ol_d_end_date;
	}

	public String getOl_status() {
		return ol_status;
	}

	public void setOl_status(String ol_status) {
		this.ol_status = ol_status;
	}

	public ProductDto getpDto() {
		return pDto;
	}

	public void setpDto(ProductDto pDto) {
		this.pDto = pDto;
	}

	
}
