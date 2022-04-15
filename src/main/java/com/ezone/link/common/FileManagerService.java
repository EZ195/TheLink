package com.ezone.link.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	
	public final static String FILE_UPLOAD_PATH = "C:\\Users\\EZi09\\Desktop\\ezone\\theLink\\upload\\images\\profile/";
	
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
	
	public static String saveFile(int userId, MultipartFile file) {
		if(file == null) {
			logger.error("FileManagerService-saveFile : 파일 없음");
			return null;
		}
		
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		
		if(directory.mkdir() == false) {
			logger.error("FileManagerService-saveFile : 디렉토리 생성 에러");
			return null;
		}
		
		
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
			logger.error("FileManagerService-saveFile : 파일 저장 에러");
		}
		
		return "/images/profile/" +directory +file.getOriginalFilename();
	}

}
