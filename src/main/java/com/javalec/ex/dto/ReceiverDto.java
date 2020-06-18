package com.javalec.ex.dto;

public class ReceiverDto {
	private String ol_order_num;     //주문번호
	private String m_name;     //주문자 이름
	private int m_zipcode;     //주문자 우편번호
	private String m_address1;     //주문자 주소1
	private String m_address2;     //주문자 주소2
	private String m_email;     //주문자 이메일
	private String m_phone;     //주문자 휴대폰
	private String m_tel;     //주문자 일반폰
	private String re_name;     //수취자 이름
	private int re_zipcode;     //수취자 우편번호
	private String re_address1;     //수취자 주소1
	private String re_address2;     //수취자 주소2
	private String re_phone;     //수취자 휴대폰
	private String re_tel;     //수취자 일반폰
	private String m_msg;     //배송 요구사항
	
	public ReceiverDto() {}

	public ReceiverDto(String ol_order_num, String m_name, int m_zipcode, String m_address1, String m_address2,
			String m_email, String m_phone, String m_tel, String re_name, int re_zipcode, String re_address1,
			String re_address2, String re_phone, String re_tel, String m_msg) {
		super();
		this.ol_order_num = ol_order_num;
		this.m_name = m_name;
		this.m_zipcode = m_zipcode;
		this.m_address1 = m_address1;
		this.m_address2 = m_address2;
		this.m_email = m_email;
		this.m_phone = m_phone;
		this.m_tel = m_tel;
		this.re_name = re_name;
		this.re_zipcode = re_zipcode;
		this.re_address1 = re_address1;
		this.re_address2 = re_address2;
		this.re_phone = re_phone;
		this.re_tel = re_tel;
		this.m_msg = m_msg;
	}

	public String getOl_order_num() {
		return ol_order_num;
	}

	public void setOl_order_num(String ol_order_num) {
		this.ol_order_num = ol_order_num;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public int getM_zipcode() {
		return m_zipcode;
	}

	public void setM_zipcode(int m_zipcode) {
		this.m_zipcode = m_zipcode;
	}

	public String getM_address1() {
		return m_address1;
	}

	public void setM_address1(String m_address1) {
		this.m_address1 = m_address1;
	}

	public String getM_address2() {
		return m_address2;
	}

	public void setM_address2(String m_address2) {
		this.m_address2 = m_address2;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getRe_name() {
		return re_name;
	}

	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}

	public int getRe_zipcode() {
		return re_zipcode;
	}

	public void setRe_zipcode(int re_zipcode) {
		this.re_zipcode = re_zipcode;
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

	public String getRe_phone() {
		return re_phone;
	}

	public void setRe_phone(String re_phone) {
		this.re_phone = re_phone;
	}

	public String getRe_tel() {
		return re_tel;
	}

	public void setRe_tel(String re_tel) {
		this.re_tel = re_tel;
	}

	public String getM_msg() {
		return m_msg;
	}

	public void setM_msg(String m_msg) {
		this.m_msg = m_msg;
	}

	
	
	
}
