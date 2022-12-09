package com.kh.sixman.file.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.file.dao.FileDao;

@Service
public class FileService {
	
	@Autowired
	private FileDao dao;
	
	
}
