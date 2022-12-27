package com.kh.sixman.attendance.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.attendance.dao.AttendanceDao;
import com.kh.sixman.attendance.vo.AttendanceVo;

@Service
public class AttendanceService {
	
	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	private AttendanceDao dao;

	public List<AttendanceVo> selectList(RowBounds rb) {
		return dao.selectList(sst, rb);
	}

	public int insertStart() {
		return dao.insertStart(sst);
	}

	public int countList() {
		return dao.countList(sst);
	}

}
