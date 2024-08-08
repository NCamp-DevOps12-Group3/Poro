package com.bit.devops12.poro.common;

import com.bit.devops12.poro.dto.FileDto;
import org.springframework.web.multipart.MultipartFile;

import javax.swing.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class FileUtils {
	public static String parserFileInfo(MultipartFile uploadFiles, String attachPath, String email) {
		// 파일명 생성: UUID + 현재 날짜시간 + 원본 파일명
		
		
		
		String originalFilename = uploadFiles.getOriginalFilename(); // 원본 파일명
		
		
		// 파일 저장 경로
		File uploadFile = new File(attachPath + "/" + originalFilename);
		String uploadFilestr="/upload/" + email +"/" + "Profile"+"/"+ originalFilename;
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
   

    public static List<Path> unzipFile(Path sourceZip, Path targetDir) {
        List<Path> unzipFilesPath = new ArrayList<>();

        try (ZipInputStream zis = new ZipInputStream(new FileInputStream(sourceZip.toFile()))) {

           
            ZipEntry zipEntry = zis.getNextEntry();
            while (zipEntry != null) {

                boolean isDirectory = false;
                if (zipEntry.getName().endsWith(File.separator)) {
                    isDirectory = true;
                }

                Path newPath = zipSlipProtect(zipEntry, targetDir);
                System.out.println("unzip file Path : " + newPath);
                if (isDirectory) {
                    Files.createDirectories(newPath);
                } else {
                    if (newPath.getParent() != null) {
                        if (Files.notExists(newPath.getParent())) {
                            Files.createDirectories(newPath.getParent());
                        }
                    }
                    // copy files
                    Files.copy(zis, newPath, StandardCopyOption.REPLACE_EXISTING);

                    unzipFilesPath.add(newPath);
                }

                zipEntry = zis.getNextEntry();
            }
            zis.closeEntry();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return unzipFilesPath;
    }


    public static Path zipSlipProtect(ZipEntry zipEntry, Path targetDir)
            throws IOException {

        // test zip slip vulnerability
        Path targetDirResolved = targetDir.resolve(zipEntry.getName());

        // make sure normalized file still has targetDir as its prefix
        // else throws exception
        Path normalizePath = targetDirResolved.normalize();
        if (!normalizePath.startsWith(targetDir)) {
            throw new IOException("Bad zip entry: " + zipEntry.getName());
        }
        return normalizePath;
    }
}
