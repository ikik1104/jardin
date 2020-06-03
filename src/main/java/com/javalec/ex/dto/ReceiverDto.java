package com.javalec.ex.dto;

public class ReceiverDto {
	private int rownum;		//DB에서 가져오는 rownum
	private int ol_order_num;     //주문번호
	private String or_name;     //주문자 이름
	private int or_zipcode;     //주문자 우편번호
	private String or_address1;     //주문자 주소1
	private String or_address2;     //주문자 주소2
	private String or_email;     //주문자 이메일
	private String or_cphone;     //주문자 휴대폰
	private String or_phone;     //주문자 일반폰
	private String re_name;     //수취자 이름
	private int re_zip;     //수취자 우편번호
	private String re_address1;     //수취자 주소1
	private String re_address2;     //수취자 주소2
	private String re_cphone;     //수취자 휴대폰
	private String re_phone;     //수취자 일반폰
	private String or_msg;     //배송 요구사항
	
	public ReceiverDto() {}

	public ReceiverDto(int ol_order_num, String or_name, int or_zipcode, String or_address1, String or_address2,
			String or_email, String or_cphone, String or_phone, String re_name, int re_zip, String re_address1,
			String re_address2, String re_cphone, String re_phone, String or_msg) {
		super();
		this.ol_order_num = ol_order_num;
		this.or_name = or_name;
		this.or_zipcode = or_zipcode;
		this.or_address1 = or_address1;
		this.or_address2 = or_address2;
		this.or_email = or_email;
		this.or_cphone = or_cphone;
		this.or_phone = or_phone;
		this.re_name = re_name;
		this.re_zip = re_zip;
		this.re_address1 = re_address1;
		this.re_address2 = re_address2;
		this.re_cphone = re_cphone;
		this.re_phone = re_phone;
		this.or_msg = or_msg;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}	
	public int getOl_order_num() {
		return ol_order_num;
	}

	public void setOl_order_num(int ol_order_num) {
		this.ol_order_num = ol_order_num;
	}

	public String getOr_name() {
		return or_name;
	}

	public void setOr_name(String or_name) {
		this.or_name = or_name;
	}

	public int getOr_zipcode() {
		return or_zipcode;
	}

	public void setOr_zipcode(int or_zipcode) {
		this.or_zipcode = or_zipcode;
	}

	public String getOr_address1() {
		return or_address1;
	}

	public void setOr_address1(String or_address1) {
		this.or_address1 = or_address1;
	}

	public String getOr_address2() {
		return or_address2;
	}

	public void setOr_address2(String or_address2) {
		this.or_address2 = or_address2;
	}

	public String getOr_email() {
		return or_email;
	}

	public void setOr_email(String or_email) {
		this.or_email = or_email;
	}

	public String getOr_cphone() {
		return or_cphone;
	}

	public void setOr_cphone(String or_cphone) {
		this.or_cphone = or_cphone;
	}

	public String getOr_phone() {
		return or_phone;
	}

	public void setOr_phone(String or_phone) {
		this.or_phone = or_phone;
	}

	public String getRe_name() {
		return re_name;
	}

	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}

	public int getRe_zip() {
		return re_zip;
	}

	public void setRe_zip(int re_zip) {
		this.re_zip = re_zip;
	}

	public String getRe_address1() {
		return re_address1;
	}

	public void setRe_address1(String re_address1) {
		this.re_address1 = re_address1;
	}

	public String getRe_address2() {
		return re_address2;
	}

	public void setRe_address2(String re_address2) {
		this.re_address2 = re_address2;
	}

	public String getRe_cphone() {
		return re_cphone;
	}

	public void setRe_cphone(String re_cphone) {
		this.re_cphone = re_cphone;
	}

	public String getRe_phone() {
		return re_phone;
	}

	public void setRe_phone(String re_phone) {
		this.re_phone = re_phone;
	}

	public String getOr_msg() {
		return or_msg;
	}

	public void setOr_msg(String or_msg) {
		this.or_msg = or_msg;
	}
	
}
