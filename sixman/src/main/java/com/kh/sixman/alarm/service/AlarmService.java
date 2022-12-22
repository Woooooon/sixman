package com.kh.sixman.alarm.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.alarm.dao.AlaramDao;
import com.kh.sixman.alarm.vo.AlarmVo;

@Service
public class AlarmService {
	
	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	private AlaramDao dao;

	public List<AlarmVo> selectList(String no) {
		return dao.selectList(sst, no);
	}

	public int check(Map<String, String> map) {
		return dao.check(sst, map);
	}

}
