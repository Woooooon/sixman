package com.kh.sixman.common;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileUnit {
	
	public static List<AttachmentVo> uploadFile(List<MultipartFile> list, String rootPath, String filePath){
			
		List<AttachmentVo> voList = new ArrayList<>();
		if(list==null||list.size()==0)return null;
		for(MultipartFile f : list) {
			// 0. 준비
			String originName = f.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf("."), originName.length());
			String changeName = System.currentTimeMillis() + "_" + (Math.random()*99999 + 1) + ext;
			
			// 1. 파일 객체 준비 (경로+파일명)
			String path = rootPath.substring(0, rootPath.lastIndexOf("sixman")) + filePath + "/";
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
			vo.setFilePath(path);
			voList.add(vo);
		}
		
		return voList;
		
	}//method
	
	public static void deleteFile(String path) {
		
		File file = new File(path);
				
		if(file.exists()) { // 파일이 존재하면
			file.delete(); // 파일 삭제	
		}
		
	}

	
	public static AttachmentVo uploadFileOne(MultipartFile file, String rootPath, String filePath){
		
		AttachmentVo vo = null;
		if(file==null) return null;
		
		// 0. 준비
		String originName = file.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."), originName.length());
		String changeName = System.currentTimeMillis() + "_" + (Math.random()*99999 + 1) + ext;
		
		// 1. 파일 객체 준비 (경로+파일명)
		String path = rootPath.substring(0, rootPath.lastIndexOf("sixman")) + filePath + "/";
		File saveFile = new File(path, changeName);
		
		try {
			file.transferTo(saveFile); // 파일복사(업로드)
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		vo = new AttachmentVo();
		vo.setChangeName(changeName);
		vo.setOriginName(originName);
		vo.setFilePath(path);
		
		return vo;
		
	}//method
}
