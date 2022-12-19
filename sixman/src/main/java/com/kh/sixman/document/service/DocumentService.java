package com.kh.sixman.document.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.document.dao.DocumentDao;
import com.kh.sixman.document.vo.DocumentVo;

@Service
public class DocumentService {

	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private DocumentDao dao;
	
	//게시글 작성
	public int write(DocumentVo dvo) {
		
		return dao.write(sst,dvo);
	}

}
