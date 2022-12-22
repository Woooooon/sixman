package com.kh.sixman.schedule.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.schedule.vo.ScheduleVo;

@Repository
public class ScheduleDao {

	//스케줄 전체 리스트
	public List<ScheduleVo> selectListAll(SqlSessionTemplate sst, ScheduleVo vo) {
		return sst.selectList("projectMapper.selectList", vo);
	}

}
