package com.javalec.ex.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.javalec.ex.dto.MainBannerDto;

@Repository
public interface AdminMainDao {

	int insertMainBanner(@Param("mbdto")MainBannerDto mbdto); //메인배너
}
