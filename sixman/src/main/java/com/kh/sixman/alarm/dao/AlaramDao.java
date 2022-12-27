package com.kh.sixman.alarm.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.alarm.vo.AlarmVo;

@Repository
public class AlaramDao {

	public List<AlarmVo> selectList(SqlSessionTemplate sst, String no) {
		return sst.selectList("alarmMapper.selectList", no);
	}

	public int check(SqlSessionTemplate sst, Map<String, String> map) {
		System.out.println(map);
		return sst.update("alarmMapper.check", map);
	}

}
