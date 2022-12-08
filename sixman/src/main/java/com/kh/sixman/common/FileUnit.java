package com.kh.sixman.common;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileUnit {
	
	public static List<AttachmentVo> uploadFile(List<MultipartFile> list, String rootPath, String filePath){
			
		List<AttachmentVo> voList = new ArrayList<>();
		for(MultipartFile f : list) {
			// 0. 준비
			String originName = f.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf("."), originName.length());
			String changeName = System.currentTimeMillis() + "_" + (Math.random()*99999 + 1) + ext;
			
			// 1. 파일 객체 준비 (경로+파일명)
			String path = rootPath.substring(0, rootPath.indexOf("sixman")) + filePath + "/";
			File saveFile = new File(path, changeName);
			
			try {
				f.transferTo(saveFile); // 파일복사(업로드)
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			AttachmentVo vo = new AttachmentVo();
			vo.setChangeName(changeName);
			vo.setOriginName(originName);
			vo.setFilePath(filePath);
			voList.add(vo);
		}
		
		return voList;
		
	}//method

}
