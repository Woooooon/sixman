package com.kh.sixman.position.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.position.dao.PositionDao;
import com.kh.sixman.position.vo.PositionVo;

@Service
public class PositionService {

	@Autowired
	private PositionDao positionDao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<PositionVo> positionList() {
		
		return positionDao.positionList(sst);
	}
}
