package com.kh.sixman.document.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.document.dao.DocumentDao;
import com.kh.sixman.document.dao.DocumentFileDao;
import com.kh.sixman.document.vo.DocumentVo;

@Service
public class DocumentService {

	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	private DocumentDao dao;
	@Autowired
	private DocumentFileDao fdao;
	
	//게시글 작성
	public int write(DocumentVo dvo) {
		
		int result1 = dao.write(sst, dvo);
		int result2 = dao.send(sst,dvo);
		
		String no = Integer.toString(result1);
		List<AttachmentVo> fileList = dvo.getFileList();
		int result3 = 1;
		if(fileList != null) {
			for(AttachmentVo fv : fileList) {
				fv.setSubNo(no);
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("list",fileList);
			map.put("tableName","DOCUMENT");
			
			result3= fdao.uploadAll(sst,map);
		}
		
		return result1 * result2 * result3;
	}

}
