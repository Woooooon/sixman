package com.kh.sixman.dept.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.dept.dao.DeptDao;
import com.kh.sixman.dept.vo.DeptVo;
import com.kh.sixman.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DeptService {
	@Autowired
	private DeptDao deptDao;
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<DeptVo> selectSubList(String no) {
		return deptDao.selectSubList(sst, no);
	}
	
	public List<DeptVo> daptList() {
		return deptDao.daptList(sst);
	}

	public List<DeptVo> subList() {
		return deptDao.subList(sst);
	}

	public int deleteDept(String no) {
		List<MemberVo> nullCheck = deptDao.deptMemberNullCheck(sst, no);
		log.info("nullCheck : " + nullCheck);
		
		int memberDeptReset = 1;
		
		if(nullCheck.size() > 0) {
			memberDeptReset = deptDao.deptReset(sst, no);
			log.info("memberDeptReset : " + memberDeptReset);
		}		
		
		int deleteDept = deptDao.deleteDept(sst, no);
		log.info("deleteDept : " + deleteDept);
		
		return memberDeptReset * deleteDept;
	}

	public int deleteTeam(String no) {
		List<MemberVo> nullCheck = deptDao.teamMemberNullCheck(sst, no);
		
		log.info("nullCheck : " + nullCheck);
		
		int memberTeamReset = 1;
		
		if(nullCheck.size() > 0) {
			memberTeamReset = deptDao.teamReset(sst, no);
			log.info("memberTeamReset : " + memberTeamReset);
		}
		
		int deleteTeam = deptDao.deleteTeam(sst, no);
		
		return memberTeamReset * deleteTeam;
	}

	public int insertDept(String name) {
		return deptDao.insertDept(sst, name);
	}

	public DeptVo selectDept(String name) {
		return deptDao.selectDept(sst, name);
	}

	public int insertTeam(DeptVo vo) {
		return deptDao.insertTeam(sst, vo);
	}

	public DeptVo selectTeam(DeptVo vo) {
		return deptDao.selectTeam(sst, vo);
	}

}
