package com.javalec.ex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.ProductDto;
import com.javalec.ex.dto.ReviewUserDto;

public interface ProductService {
	
	//제품 전체 리스트
	List<ProductDto> getAllPList();
	
	//제품 insert
	void insertProduct(ProductDto pdto);

	//제품 하나의 정보
	ProductDto getProductInfo(int p_num);

	//제품 수정
	void updateProduct(ProductDto pdto);
	
	//제품 삭제처리
	int deleteProduct(int p_num);
	
	//삭제된 제품 리스트
	List<ProductDto> getDelPList();
		
	//제품 복구처리
	int backProduct(int p_num);
	
	//검색한 제품 리스트
	List<ProductDto> getSearchList(HashMap<String, String> map);

	//----------------------------------------------------유저
	
	//쟈뎅 홈페이지에 리스트 뿌리기
	//step1 전체
	List<ProductDto> getU_ProductAllList(String p_step1);
	//step2
	List<ProductDto> getU_ProductList(String p_step2);

	
	//리뷰---------------------------------------------------
	//리뷰작성
	int review_insert(ReviewUserDto ruDto);


	//리뷰 가져오기
	List<ReviewUserDto> getUserReview(Map<String, Object> map);

	//제품의 별점 update
	void update_score(int p_num);

	//제품의 리뷰 개수 가져오기
	Integer review_count(int p_num);
	
}
