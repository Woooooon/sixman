package com.kh.sixman.schedule.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.schedule.dao.ScheduleDao;
import com.kh.sixman.schedule.vo.ScheduleVo;

@Service
public class ScheduleService {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private ScheduleDao sdao;

	//스케줄 전체 리스트
	public List<ScheduleVo> selectList(ScheduleVo vo) {
		return sdao.selectListAll(sst, vo);
	}

}
