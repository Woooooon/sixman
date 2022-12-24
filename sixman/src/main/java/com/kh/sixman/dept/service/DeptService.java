package com.kh.sixman.dept.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.dept.dao.DeptDao;
import com.kh.sixman.dept.vo.DeptVo;

@Service
public class DeptService {
	@Autowired
	private DeptDao deptDao;
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<DeptVo> subList(String no) {
		return deptDao.subList(sst, no);
	}
	
	public List<DeptVo> daptList() {
		return deptDao.daptList(sst);
	}

}
