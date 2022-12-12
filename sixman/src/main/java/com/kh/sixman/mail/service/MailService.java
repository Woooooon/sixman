package com.kh.sixman.mail.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.mail.dao.MailDao;
import com.kh.sixman.mail.vo.MailVo;

@Service
public class MailService {

	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	private MailDao dao;

	public int write(MailVo vo) {
		int result1 = dao.write(sst, vo);
		int result2 = dao.send(sst, vo);
		
		return result1 * result2;
	}
	
	
	
}
