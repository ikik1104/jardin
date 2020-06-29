package com.javalec.ex.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javalec.ex.dao.BDao;
import com.javalec.ex.dao.ProductDao;
import com.javalec.ex.dto.BDto;
import com.javalec.ex.dto.CartDto;
import com.javalec.ex.dto.PageDto;
import com.javalec.ex.dto.ProductDto;
import com.javalec.ex.dto.QnrUserDto;
import com.javalec.ex.dto.ReviewUserDto;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao pDao;

	//제품 전체 리스트
	@Override
	public List<ProductDto> getAllPList() {
		
		return pDao.getAllPList();
	}

	//제품 insert
	@Override
	public void insertProduct(ProductDto pdto) {
	
		pDao.insertProduct(pdto);
	}

	//제품 하나의 정보
	@Override
	public ProductDto getProductInfo(int p_num) {

		return pDao.getProductInfo(p_num);
	}

	//제품 수정
	@Override
	public void updateProduct(ProductDto pdto) {

		pDao.updateProduct(pdto);
	}

	//제품 삭제처리
	@Override
	public int deleteProduct(int p_num) {
		
		return pDao.deleteProduct(p_num);
	}

	//삭제된 제품리스트
	@Override
	public List<ProductDto> getDelPList() {

		return pDao.getDelPList();
	}

	//상품 복구처리
	@Override
	public int backProduct(int p_num) {
		
		return  pDao.backProduct(p_num);
	}

	//검색한 상품 리스트
	@Override
	public List<ProductDto> getSearchList(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		Iterator<String> mapIter = map.keySet().iterator();
				
		 while(mapIter.hasNext()){
			 
	            String key = mapIter.next();
	            String value = (String) map.get( key );
	 
	            System.out.println(key+":"+value);
	 
	        }
		return pDao.getSearchList(map);
	}

	
	//유저---------------------------------------------------
	
	//제품 출력하기
	//ste1
	@Override
	public List<ProductDto> getU_ProductAllList(String p_step1) {
		// TODO Auto-generated method stub
		return pDao.getU_ProductAllList(p_step1);
	}
	
	//step2
	@Override
	public List<ProductDto> getU_ProductList(String p_step2) {
		return pDao.getU_ProductList(p_step2);
	}

	//메인에서 제픔 검색
	@Override
	public List<ProductDto> searchProduct(String keyword) {
		return pDao.searchProduct(keyword);
	}


	//제품 검색 정렬
	@Override
	public List<ProductDto> search_sort(HashMap<String, Object> map) {
		System.out.println(map.get("sort"));
		
			if(map.get("sort").equals("new")) {
				System.out.println("new 탑니다.");
				return pDao.search_sort_new(map);
			}else if(map.get("sort").equals("high")) {
				System.out.println("high 탑니다.");
				return pDao.search_sort_high(map);
			}else {
				System.out.println("low 탑니다.");
				return pDao.search_sort_low(map);
			}
			
	}
	
	
	//리뷰---------------------------------------------------
	//리뷰작성
	@Override
	public int review_insert(ReviewUserDto ruDto) {
		return pDao.review_insert(ruDto);
	}

	//리뷰 가져오기
	@Override
	public List<ReviewUserDto> getUserReview(Map<String, Object> map) {
		
		return pDao.getUserReview(map);
	}

	//리뷰작성지 제품 별점 update
	@Override
	public void update_score(int p_num) {
		
		pDao.update_score(p_num);
	}

	//리뷰 개수 가져오기
	@Override
	public Integer review_count(int p_num) {
		return pDao.review_count(p_num);
	}


	//질문과 답변
	@Override
	public int inquiry_insert(QnrUserDto quDto) {
		return pDao.inquiry_insert(quDto);
	}

	//질문과 답변 가져오기
	@Override
	public List<QnrUserDto> qunOne(int p_num) {
		return pDao.qunOne(p_num);
	}

	//장바구니에 담기
	@Override
	public int cart_insert(CartDto cdto) {
		return pDao.cart_insert(cdto);
	}

	//------------------------------------------------------------

	//한 제품의 리뷰 페이징 리스트
	@Override
	public List<Map<String, Object>> pageReviewList(PageDto pageDto, int p_num,String ru_type) {
		return pDao.pageReviewList(pageDto, p_num, ru_type);
	}

	//한 제품의 리뷰 총 개수
	@Override
	public int pageReviewCount(String ru_type, int p_num) {
		return pDao.pageReviewCount(ru_type, p_num);
	}

	//한 제품의 질문과 답변 페이징 리스트
	@Override
	public List<Map<String, Object>> qnaList(PageDto pageDto, int p_num) {
		return pDao.qnaList(pageDto, p_num);
	}

	//한 제품의 질문 총 개수
	@Override
	public int qnaUserCount(int p_num) {
		return pDao.qnaUserCount(p_num);
	}


	
	
	


}
