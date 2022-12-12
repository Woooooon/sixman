package com.kh.sixman.file.service;

import java.util.HashMap;
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

	public AttachmentVo getFile(String no) {
		Map<String, String> map = new HashMap<>();
		map.put("no", no);
		map.put("tableName", "NOTICE");
		return dao.getFile(sst, map);
	}
	
	
}
