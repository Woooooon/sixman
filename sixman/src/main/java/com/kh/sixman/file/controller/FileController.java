package com.kh.sixman.file.controller;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.common.FileUnit;
import com.kh.sixman.file.service.FileService;

@Controller
public class FileController {
	
	@Autowired
	private FileService fs;
	
	@ResponseBody
	@PostMapping("download")
	public void download(@RequestParam Map<String, String> map, HttpServletResponse response) throws Exception {
        try {
        	AttachmentVo vo = fs.getFile(map);
        	String path = vo.getFilePath()+vo.getChangeName(); // 경로에 접근할 때 역슬래시('\') 사용

        	response.setHeader("Content-Disposition", "attachment;filename=" + vo.getOriginName()); // 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
        	
        	FileInputStream fileInputStream = new FileInputStream(path); // 파일 읽어오기 
        	OutputStream out = response.getOutputStream();
        	
        	int read = 0;
                byte[] buffer = new byte[1024];
                while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을 파일이 없음
                    out.write(buffer, 0, read);
                }
                
        } catch (Exception e) {
        	e.printStackTrace();
        }
	}
	
	@ResponseBody
	@PostMapping("delete")
	public void delete(@RequestParam Map<String, String> map) {
		AttachmentVo vo = fs.getFile(map);
		System.out.println(vo.getFilePath());
		FileUnit.deleteFile(vo.getFilePath()+vo.getChangeName());
		int result = fs.delete(map);
	}

}
