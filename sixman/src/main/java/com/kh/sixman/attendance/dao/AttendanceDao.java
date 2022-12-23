package com.kh.sixman.attendance.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.attendance.vo.AttendanceVo;

@Repository
public class AttendanceDao {

	public List<AttendanceVo> selectList(SqlSessionTemplate sst) {
		return sst.selectList("attendanceMapper.selectList");
	}

	public int insertStart(SqlSessionTemplate sst) {
		return sst.insert("attendanceMapper.insertStart");
	}

	

}
