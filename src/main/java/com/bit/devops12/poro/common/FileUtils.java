package com.bit.devops12.poro.common;

import com.bit.devops12.poro.dto.FileDto;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class FileUtils {
	public static FileDto parserFileInfo(MultipartFile multipartFile, String attachPath) {
		FileDto fileDto = new FileDto();
		
		// 다른 사용자가 같은 파일명의 파일을 업로드 했을 때
		// 덮어써지는 것을 방지하기 위해서 파일명을 랜덤값_날짜시간_파일명으로 지정
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		Date nowDate = new Date();
		
		String nowDateStr = format.format(nowDate);
		
		UUID uuid = UUID.randomUUID();
		
		String fileName =  uuid.toString() + "_" + nowDateStr + "_" + multipartFile.getOriginalFilename();
		
		File uploadFile = new File(attachPath + fileName);
		String type = "";
		
		try {
			multipartFile.transferTo(uploadFile);
			type = Files.probeContentType(uploadFile.toPath());
		} catch(IOException ie) {
			System.out.println(ie.getMessage());
		}
		
		if(!type.equals("")) {
			if(type.startsWith("image")) {
				fileDto.setFiletype("image");
			} else {
				fileDto.setFiletype("etc");
			}
		} else {
			fileDto.setFiletype("etc");
		}
		
		fileDto.setFilename(fileName);
		fileDto.setFileoriginname(multipartFile.getOriginalFilename());
		fileDto.setFilepath(attachPath);
		
		return fileDto;
	}
}
