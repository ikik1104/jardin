package com.javalec.ex.dto;

import java.sql.Timestamp;

public class ProductDto {

	private int rownum;		//DB에서 가져오는 rownum
	private int p_num; //제품고유번호
	private String p_step1; //분류1
	private String p_step2; //분류2
	private String p_name; //제품명
	private int p_price; //가격
	private int p_point; //포인트
	private String p_producer; //제조원
	private String p_expiry; //유통기한
	private String p_type; //식품유형
	private String p_capacity; //용량
	private String p_detail; //원재료명 및 함량
	private String p_location; //업소명 및 소재지
	private String p_gene; //유전자 재조합유무
	private String p_import; //수입식품 유무
	private int p_stock; //재고
	private String p_thumb_img1; //제품 썸네일 이미지1
	private String p_thumb_img2; //제품 썸네일 이미지2
	private String p_thumb_img3; //제품 썸네일 이미지3
	private String p_content_img; //제품 상세 이미지
	private Timestamp p_sysdate; //제품 등록일
	private Timestamp p_update; //제품 수정일
	private String p_delflag; //제품삭제유무
	private int p_score; //제품의 평점
	
	public ProductDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductDto(int rownum, int p_num, String p_step1, String p_step2, String p_name, int p_price, int p_point,
			String p_producer, String p_expiry, String p_type, String p_capacity, String p_detail, String p_location,
			String p_gene, String p_import, int p_stock, String p_thumb_img1, String p_thumb_img2, String p_thumb_img3,
			String p_content_img, Timestamp p_sysdate, Timestamp p_update, String p_delflag, int p_score) {
		super();
		this.rownum = rownum;
		this.p_num = p_num;
		this.p_step1 = p_step1;
		this.p_step2 = p_step2;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_point = p_point;
		this.p_producer = p_producer;
		this.p_expiry = p_expiry;
		this.p_type = p_type;
		this.p_capacity = p_capacity;
		this.p_detail = p_detail;
		this.p_location = p_location;
		this.p_gene = p_gene;
		this.p_import = p_import;
		this.p_stock = p_stock;
		this.p_thumb_img1 = p_thumb_img1;
		this.p_thumb_img2 = p_thumb_img2;
		this.p_thumb_img3 = p_thumb_img3;
		this.p_content_img = p_content_img;
		this.p_sysdate = p_sysdate;
		this.p_update = p_update;
		this.p_delflag = p_delflag;
		this.p_score = p_score;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getP_step1() {
		return p_step1;
	}

	public void setP_step1(String p_step1) {
		this.p_step1 = p_step1;
	}

	public String getP_step2() {
		return p_step2;
	}

	public void setP_step2(String p_step2) {
		this.p_step2 = p_step2;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getP_point() {
		return p_point;
	}

	public void setP_point(int p_point) {
		this.p_point = p_point;
	}

	public String getP_producer() {
		return p_producer;
	}

	public void setP_producer(String p_producer) {
		this.p_producer = p_producer;
	}

	public String getP_expiry() {
		return p_expiry;
	}

	public void setP_expiry(String p_expiry) {
		this.p_expiry = p_expiry;
	}

	public String getP_type() {
		return p_type;
	}

	public void setP_type(String p_type) {
		this.p_type = p_type;
	}

	public String getP_capacity() {
		return p_capacity;
	}

	public void setP_capacity(String p_capacity) {
		this.p_capacity = p_capacity;
	}

	public String getP_detail() {
		return p_detail;
	}

	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}

	public String getP_location() {
		return p_location;
	}

	public void setP_location(String p_location) {
		this.p_location = p_location;
	}

	public String getP_gene() {
		return p_gene;
	}

	public void setP_gene(String p_gene) {
		this.p_gene = p_gene;
	}

	public String getP_import() {
		return p_import;
	}

	public void setP_import(String p_import) {
		this.p_import = p_import;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}

	public String getP_thumb_img1() {
		return p_thumb_img1;
	}

	public void setP_thumb_img1(String p_thumb_img1) {
		this.p_thumb_img1 = p_thumb_img1;
	}

	public String getP_thumb_img2() {
		return p_thumb_img2;
	}

	public void setP_thumb_img2(String p_thumb_img2) {
		this.p_thumb_img2 = p_thumb_img2;
	}

	public String getP_thumb_img3() {
		return p_thumb_img3;
	}

	public void setP_thumb_img3(String p_thumb_img3) {
		this.p_thumb_img3 = p_thumb_img3;
	}

	public String getP_content_img() {
		return p_content_img;
	}

	public void setP_content_img(String p_content_img) {
		this.p_content_img = p_content_img;
	}

	public Timestamp getP_sysdate() {
		return p_sysdate;
	}

	public void setP_sysdate(Timestamp p_sysdate) {
		this.p_sysdate = p_sysdate;
	}

	public Timestamp getP_update() {
		return p_update;
	}

	public void setP_update(Timestamp p_update) {
		this.p_update = p_update;
	}

	public String getP_delflag() {
		return p_delflag;
	}

	public void setP_delflag(String p_delflag) {
		this.p_delflag = p_delflag;
	}

	public int getP_score() {
		return p_score;
	}

	public void setP_score(int p_score) {
		this.p_score = p_score;
	}

	
}
