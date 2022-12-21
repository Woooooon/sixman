package com.kh.sixman.schedule.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.schedule.dao.ScheduleDao;

@Service
public class ScheduleService {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private ScheduleDao sdao;

}
