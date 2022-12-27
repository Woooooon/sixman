package com.kh.sixman.attendance.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.attendance.vo.AttendanceVo;

@Repository
public class AttendanceDao {

	public List<AttendanceVo> selectList(SqlSessionTemplate sst, RowBounds rb) {
		return sst.selectList("attendanceMapper.selectList",null, rb);
	}

	public int insertStart(SqlSessionTemplate sst) {
		return sst.insert("attendanceMapper.insertStart");
	}

	public int countList(SqlSessionTemplate sst) {
		return sst.selectOne("attendanceMapper.countList");
	}

	

}
