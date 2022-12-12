package com.kh.sixman.file.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.file.dao.FileDao;

@Service
public class FileService {
	
	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	private FileDao dao;

	public AttachmentVo getFile(Map<String, String> map) {
		return dao.getFile(sst, map);
	}

	public int delete(Map<String, String> map) {
		return dao.delete(sst, map);
	}
	
	
}
