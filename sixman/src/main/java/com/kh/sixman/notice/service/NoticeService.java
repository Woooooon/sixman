package com.kh.sixman.notice.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.notice.dao.NoticeDao;
import com.kh.sixman.notice.vo.NoticeVo;

@Service
public class NoticeService {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private NoticeDao dao;

	public int countList(String keyword) {
		return dao.countList(sst, keyword);
	}

	public List<NoticeVo> selectList(String keyword, RowBounds rb) {
		return dao.selectList(sst, keyword, rb);
	}

	public void write(NoticeVo vo, MemberVo loginMember) {
		// TODO Auto-generated method stub
		
	}

	
	
	
}
