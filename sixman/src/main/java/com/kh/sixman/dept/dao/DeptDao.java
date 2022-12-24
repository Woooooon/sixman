package com.kh.sixman.dept.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.dept.vo.DeptVo;
@Repository
public class DeptDao {

	public List<DeptVo> subList(SqlSessionTemplate sst, String no) {
		return sst.selectList("deptMapper.selectSubList", no);
	}
	
	public List<DeptVo> daptList(SqlSessionTemplate sst) {
		return sst.selectList("deptMapper.deptList");
	}
}
