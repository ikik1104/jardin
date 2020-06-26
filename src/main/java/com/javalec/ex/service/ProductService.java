package com.javalec.ex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.CartDto;
import com.javalec.ex.dto.PageDto;
import com.javalec.ex.dto.ProductDto;
import com.javalec.ex.dto.QnrUserDto;
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
	//메인에서 제품 검색
	List<ProductDto> searchProduct(String keyword);
	//제품 검색 정렬
	List<ProductDto> search_sort(HashMap<String, Object> map);
	
	//리뷰---------------------------------------------------
	//리뷰작성
	int review_insert(ReviewUserDto ruDto);


	//리뷰 가져오기
	List<ReviewUserDto> getUserReview(Map<String, Object> map);

	//제품의 별점 update
	void update_score(int p_num);

	//제품의 리뷰 개수 가져오기
	Integer review_count(int p_num);

	
	//문의 insert
	int inquiry_insert(QnrUserDto quDto);

	//문의 가져오기..
	List<QnrUserDto> qunOne(int p_num);

	//장바구니에 담기
	int cart_insert (CartDto cdto);
	
	//------------------------------------------------------------
	
	//한 제품의 리뷰 페이징 리스트
	List<Map<String,Object>> pageReviewList(PageDto pageDto, int p_num, String ru_type);
	//한 제품의 리뷰 총 개수
	int pageReviewCount(String ru_type,int p_num);
	
	//한 제품의 질문과 답변 페이징 리스트
	List<Map<String,Object>> qnaList(PageDto pageDto,int p_num);
	//한 제품의 질문 총 개수
	int qnaUserCount(int p_num);


	
}
