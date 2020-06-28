package com.javalec.ex.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.MainBannerDto;
import com.javalec.ex.dto.MainJardinDto;

@Repository
public interface AdminMainDao {

	int countMainBanners(); //메인배너 등록됐는지 디비 확인
	int insertMainBanner(@Param("mbdto") MainBannerDto mbdto); //메인배너
	MainBannerDto selectMainBanners();//메인배너들가져오기
	void updateMainBanner(@Param("mbdto") MainBannerDto mbdto); //메인배너 업데이트
	
	/***************중간배너 왼쪽************/
	String selectMl();//중간배너 왼쪽
	int insertMl(String file_name);//저장
	int updateMl(String file_name);
	/***************중간배너 오른************/
	String selectMr();//중간배너 왼쪽
	int insertMr(String file_name);//저장
	int updateMr(String file_name);
	
	//***************자뎅 브랜드 상품************
	MainJardinDto selectJd();
	int countJd();
	int insertJardinBrand(@Param("mjdto") MainJardinDto mjdto);
	int updateJardinBrand(@Param("mjdto") MainJardinDto mjdto);
	
	void deleteMainBanner(String orders); //메인배너 이미지 삭제

//	int insertMainBanner(Map<String, Object> map); //메인배너
//	List<MainBannerDto> selectMainBanners();//메인배너들가져오기
//	void deleteMainBanner(String orders); //메인배너 이미지 삭제
}
