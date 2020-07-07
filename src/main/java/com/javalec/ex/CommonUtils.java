package com.javalec.ex;
import java.io.File;

import java.io.IOException;

import java.sql.Timestamp;

import java.util.Map;

import java.util.UUID;



import org.slf4j.Logger;

import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Component;

import org.springframework.web.multipart.MultipartFile;



import com.cloudinary.Cloudinary;

import com.cloudinary.utils.ObjectUtils;


@Component
public class CommonUtils {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	// Cloudinary cloud_name, API_Key and API_Secret
	private static final String CLOUDINARY_CLOUD_NAME = "hongik";
	private static final String CLOUDINARY_API_KEY = "485992929882614";
	private static final String CLOUDINARY_API_SECRET = "d5C80voQTeAFkAokPwA2BjUJcrI";

	// 파일업로드(클라우드)
	public String FileUploaderCDN(MultipartFile mFile, String folderName) throws IOException {

		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "");
		System.out.println(storedFileName);

		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap("cloud_name", CLOUDINARY_CLOUD_NAME, "api_key",
				CLOUDINARY_API_KEY, "api_secret", CLOUDINARY_API_SECRET, "secure", true));

		Map<String, Object> cloudinaryURL = null;

		Map params = ObjectUtils.asMap("public_id", folderName + storedFileName);
		File convFile = new File("Z://"+ storedFileName);

		mFile.transferTo(convFile);

		try {
			Map<String, Object> result = (Map<String, Object>) cloudinary.uploader().upload(convFile, params);
			cloudinaryURL = result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (String) (cloudinaryURL.get("url"));
	}



	// Timestamp 형식으로 변환

	public Timestamp timeConcat(String pDate, String pTime) {

		return Timestamp.valueOf(pDate + " " + pTime + ":00.0");

	}

}