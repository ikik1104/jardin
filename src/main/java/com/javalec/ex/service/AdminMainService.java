package com.javalec.ex.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.javalec.ex.dto.MainBannerDto;
import com.javalec.ex.dto.MainJardinDto;
import com.javalec.ex.dto.MainSaleDto;
import com.javalec.ex.dto.MainBsDto;
import com.javalec.ex.dto.MainMDDto;
import com.javalec.ex.dto.MainNewProductDto;
import com.javalec.ex.dto.ProductDto;

public interface AdminMainService {

	int countMainBanners(); //디비 등록 확인
	int insertMainBanner(MainBannerDto mbdto); //메인배너
	MainBannerDto selectMainBanners();//메인배너들가져오기
	void updateMainBanner(MainBannerDto mbdto); //메인배너 업데이트
	
	//***************중간배너 왼쪽************
	String selectMl();//중간배너 파일명 가져오기
	int insertMl(String file_name);//저장
	int updateMl(String file_name);
	//***************중간배너 오른쪽************
	String selectMr();//중간배너 파일명 가져오기
	int insertMr(String file_name);//저장
	int updateMr(String file_name);
	
	//***************세일 상품************
	MainSaleDto selectSale();
	int countSale();
	int insertSale(MainSaleDto sdto);
	int updateSale(MainSaleDto sdto);
	
	//***************자뎅 브랜드 상품************
	MainJardinDto selectJd();
	int countJd();
	int insertJardinBrand(MainJardinDto mjdto);
	int updateJardinBrand(MainJardinDto mjdto);

	void deleteMainBanner(String orders); //메인배너 이미지 삭제
//	int insertMainBanner(Map<String, Object> map); //메인배너
//	List<MainBannerDto> selectMainBanners();//메인배너들가져오기
//	void deleteMainBanner(String orders); //메인배너 이미지 삭제
	
	/***************베스트셀러 등록 페이지 ************/
	List<ProductDto> getProductList(); // 제품 리스트 불러오기
	ProductDto getPname(int p_num);
	MainBsDto getBs(); // 저장되어 있는 베스트셀러 불러오기
	int insertBs(MainBsDto mainBsDto); // 저장
	int updateBs(MainBsDto mainBsDto); // 등록 상품 변경
	
	/***************신제품 등록 페이지 ************/
	MainNewProductDto getNewPro(); // 저장되어 있는 신제품 정보 불러오기
	int updateNewPro(MainNewProductDto mainNewProDto); // 등록 상품 변경
	
	/***************MD CHOICE 등록 ************/
	List<MainMDDto> getMD(); // 저장되어 있는 MD CHOICE 정보 불러오기
	int updateMD(int p_num,String explain,int pNum); // 등록 상품 변경
}
