package com.kh.sixman.mail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.mail.vo.MailVo;

@Repository
public class MailDao {

	public int write(SqlSessionTemplate sst, MailVo vo) {
		return sst.insert("mailMapper.write", vo);
	}

	public int send(SqlSessionTemplate sst, MailVo vo) {
		return sst.insert("mailMapper.send", vo);
	}

}
