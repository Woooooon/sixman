package com.kh.sixman.position.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.position.dao.PositionDao;
import com.kh.sixman.position.vo.PositionVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PositionService {

	@Autowired
	private PositionDao positionDao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<PositionVo> positionList() {
		
		return positionDao.positionList(sst);
	}

	public int deletePosition(String no) {
		
		List<MemberVo> nullCheck = positionDao.positionNullCheck(sst, no);
		
		log.info("nullCheck : " + nullCheck);
		
		int memberPositionReset = 1;
		
		if(nullCheck.size() > 0) {
			memberPositionReset = positionDao.positionReset(sst, no);
			log.info("memberTeamReset : " + memberPositionReset);
		}
		
		int deletePosition = positionDao.deletePosition(sst, no);
		
		return memberPositionReset * deletePosition;
		
	}

	public int insertPosition(String name) {
		return positionDao.insertPosition(sst, name);
	}

	public PositionVo selectPosition(String name) {
		return positionDao.selectPosition(sst, name);
	}
}
