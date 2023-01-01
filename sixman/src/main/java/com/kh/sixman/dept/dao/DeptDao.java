package com.kh.sixman.dept.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.dept.vo.DeptVo;
import com.kh.sixman.member.vo.MemberVo;
@Repository
public class DeptDao {

	public List<DeptVo> selectSubList(SqlSessionTemplate sst, String no) {
		return sst.selectList("deptMapper.selectSubList", no);
	}
	
	public List<DeptVo> daptList(SqlSessionTemplate sst) {
		return sst.selectList("deptMapper.deptList");
	}

	public List<DeptVo> subList(SqlSessionTemplate sst) {
		return sst.selectList("deptMapper.subList");
		
	}

	public int deleteDept(SqlSessionTemplate sst, String no) {
		return sst.delete("deptMapper.deleteDept", no);
	}

	public int deptReset(SqlSessionTemplate sst, String no) {
		return sst.update("deptMapper.deptReset", no);
	}
	
	public int deleteTeam(SqlSessionTemplate sst, String no) {
		return sst.delete("deptMapper.deleteTeam", no);
	}
	
	public int teamReset(SqlSessionTemplate sst, String no) {
		return sst.delete("deptMapper.teamReset", no);
	}

	public List<MemberVo> deptMemberNullCheck(SqlSessionTemplate sst, String no) {
		return sst.selectList("deptMapper.deptMemberNullCheck", no);
	}

	public List<MemberVo> teamMemberNullCheck(SqlSessionTemplate sst, String no) {
		return sst.selectList("deptMapper.teamMemberNullCheck", no);
	}

	public int insertDept(SqlSessionTemplate sst, String name) {
		return sst.insert("deptMapper.insertDept", name);
	}

	public DeptVo selectDept(SqlSessionTemplate sst, String name) {
		return sst.selectOne("deptMapper.selectDept", name);
	}

	public int insertTeam(SqlSessionTemplate sst, DeptVo vo) {
		return sst.insert("deptMapper.insertTeam", vo);
	}

	public DeptVo selectTeam(SqlSessionTemplate sst, DeptVo vo) {
		return sst.selectOne("deptMapper.selectDept", vo);
	}
}
