package com.bit.devops12.poro.common;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class FileUtils {
	public static String parserFileInfo(MultipartFile uploadFiles, String attachPath) {
		// 파일명 생성: UUID + 현재 날짜시간 + 원본 파일명
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		
		
		String originalFilename = uploadFiles.getOriginalFilename(); // 원본 파일명
		
		
		// 파일 저장 경로
		File uploadFile = new File(attachPath + "/" + originalFilename);
		String uploadFilestr=uploadFile.toString();
		String type = "";
		
		// 경로가 유효한지 확인
		if (!uploadFile.getParentFile().exists()) {
			uploadFile.getParentFile().mkdirs(); // 디렉토리 생성
		}
		
		try {
			uploadFiles.transferTo(uploadFile);
			
		} catch (IOException ie) {
			System.err.println("파일 업로드 중 오류 발생: " + ie.getMessage());
			// 필요시 추가적인 오류 처리 로직
		}
		
		return uploadFilestr;
	}
}
