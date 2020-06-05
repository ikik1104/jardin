package com.javalec.ex.dto;

import java.sql.Timestamp;

public class MemberDto {
	private int rownum;		//DB에서 가져오는 rownum
	private int m_num;     //회원 고유번호
	private String m_name;     //이름
	private String m_id;     //아이디
	private String m_pw;     //비밀번호
	private String m_email;     //이메일
	private String m_email_ok;     //이메일 수신 여부
	private int m_zipcode;     //우편번호
	private String m_address1;     //주소1
	private String m_address2;     //주소2
	private String m_phone;     //휴대전화
	private String m_sms_ok;     //sms 수신 여부
	private String m_tel;     //유선전화
	private String m_birth;     //생년월일
	private String m_birth_sort;     //생일 양력/음력
	private String m_level;     //회원 등급
	private Timestamp m_last_login;     //마지막 로그인 날짜
	private String m_status;     //가입 상태
	private Timestamp m_left_date;     //탈퇴일
	private String m_left_reason;     //탈퇴사유
	private Timestamp m_join_date;     //가입일
	private int m_point;
	
	public MemberDto() {}

	public MemberDto(int m_num, String m_name, String m_id, String m_pw, String m_email, String m_email_ok,
			int m_zipcode, String m_address1, String m_address2, String m_phone, String m_sms_ok, String m_tel,
			String m_birth, String m_birth_sort, String m_level, Timestamp m_last_login, String m_status,
			Timestamp m_left_date, String m_left_reason, Timestamp m_join_date, int m_point) {
		super();
		this.m_num = m_num;
		this.m_name = m_name;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_email = m_email;
		this.m_email_ok = m_email_ok;
		this.m_zipcode = m_zipcode;
		this.m_address1 = m_address1;
		this.m_address2 = m_address2;
		this.m_phone = m_phone;
		this.m_sms_ok = m_sms_ok;
		this.m_tel = m_tel;
		this.m_birth = m_birth;
		this.m_birth_sort = m_birth_sort;
		this.m_level = m_level;
		this.m_last_login = m_last_login;
		this.m_status = m_status;
		this.m_left_date = m_left_date;
		this.m_left_reason = m_left_reason;
		this.m_join_date = m_join_date;
		this.m_point = m_point;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}	
	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_email_ok() {
		return m_email_ok;
	}

	public void setM_email_ok(String m_email_ok) {
		this.m_email_ok = m_email_ok;
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

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_sms_ok() {
		return m_sms_ok;
	}

	public void setM_sms_ok(String m_sms_ok) {
		this.m_sms_ok = m_sms_ok;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getM_birth() {
		return m_birth;
	}

	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_birth_sort() {
		return m_birth_sort;
	}

	public void setM_birth_sort(String m_birth_sort) {
		this.m_birth_sort = m_birth_sort;
	}

	public String getM_level() {
		return m_level;
	}

	public void setM_level(String m_level) {
		this.m_level = m_level;
	}

	public Timestamp getM_last_login() {
		return m_last_login;
	}

	public void setM_last_login(Timestamp m_last_login) {
		this.m_last_login = m_last_login;
	}

	public String getM_status() {
		return m_status;
	}

	public void setM_status(String m_status) {
		this.m_status = m_status;
	}

	public Timestamp getM_left_date() {
		return m_left_date;
	}

	public void setM_left_date(Timestamp m_left_date) {
		this.m_left_date = m_left_date;
	}

	public String getM_left_reason() {
		return m_left_reason;
	}

	public void setM_left_reason(String m_left_reason) {
		this.m_left_reason = m_left_reason;
	}

	public Timestamp getM_join_date() {
		return m_join_date;
	}

	public void setM_join_date(Timestamp m_join_date) {
		this.m_join_date = m_join_date;
	}

	public int getM_point() {
		return m_point;
	}

	public void setM_point(int m_point) {
		this.m_point = m_point;
	}
	
	
	
}
