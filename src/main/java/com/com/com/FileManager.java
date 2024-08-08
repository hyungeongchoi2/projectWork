package com.com.com;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

 
public class FileManager {
	
	public String saveFile(MultipartFile multipartFile, String path) throws IllegalStateException, IOException{
		// 1. 중복되지 않는 파일명 생성(UUID, Date)
		String fileName = UUID.randomUUID().toString();
		
		// 2. 확장자
		StringBuffer buffer = new StringBuffer();
		buffer.append(fileName);
		buffer.append("_");
		buffer.append(multipartFile.getOriginalFilename());
		
		// 3. 파일 저장
		File file = new File(path, buffer.toString());
		multipartFile.transferTo(file);
		
        // fileName 리턴
		return buffer.toString();
	}

}
