package com.kh.sixman.notice.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.notice.dao.NoticeDao2;
import com.kh.sixman.notice.vo.NoticeVo;
import com.kh.sixman.notice.vo.SearchVo;

@Service
public class NoticeService2 {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private NoticeDao2 dao;

	public int countList(SearchVo sv) {
		
		switch(sv.getFilter()) {
		case "받은메일":	return dao.countReseiveList(sst,sv);
		case "보낸메일":	return dao.countSendList(sst,sv);
		default:		return dao.countList(sst,sv);
		}
	}

	public List<NoticeVo> selectList(RowBounds rb, SearchVo sv) {
		
		switch(sv.getFilter()) {
		case "받은메일":	return dao.selectReseiveList(sst,sv,rb);
		case "보낸메일":	return dao.selectSendList(sst,sv,rb);
		default:		return dao.selectList(sst,sv,rb);
		}
	}

	public int countSendList(SearchVo sv) {
		return dao.countSendList(sst,sv);
	}

	public List<NoticeVo> selectSendList(RowBounds rb, SearchVo sv) {
		return dao.selectSendList(sst,sv,rb);
	}

	public int countTempList(SearchVo sv) {
		return dao.countTempList(sst,sv);
	}

	public List<NoticeVo> selectTempList(RowBounds rb, SearchVo sv) {
		return dao.selectTempList(sst,sv,rb);
	}

	public int countDeleteList(SearchVo sv) {
		return dao.countDeleteList(sst,sv);
	}

	public List<NoticeVo> selectDeleteList(RowBounds rb, SearchVo sv) {
		return dao.selectDeleteList(sst,sv,rb);
	}

	
	
}
