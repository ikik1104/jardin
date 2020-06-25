package com.javalec.ex.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.MainBannerDto;

@Repository
public interface AdminMainDao {

	int countMainBanners(); //메인배너 등록됐는지 디비 확인
	int insertMainBanner(@Param("mbdto") MainBannerDto mbdto); //메인배너
	MainBannerDto selectMainBanners();//메인배너들가져오기
	void updateMainBanner(@Param("mbdto") MainBannerDto mbdto); //메인배너 업데이트
	
	void deleteMainBanner(String orders); //메인배너 이미지 삭제

//	int insertMainBanner(Map<String, Object> map); //메인배너
//	List<MainBannerDto> selectMainBanners();//메인배너들가져오기
//	void deleteMainBanner(String orders); //메인배너 이미지 삭제
}
