package com.kh.sixman.project.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.project.dao.ProjectDao;
import com.kh.sixman.project.vo.ProjectVo;

@Service
public class ProjectService {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired
	private ProjectDao pdao;

	//프로젝트 전체 확인
	public List<ProjectVo> selectList(int no) {
		
		return pdao.selectPrjList(sst, no);
	}

	//프로젝트 생성
	public int insertPrjOne(ProjectVo vo) {
		
		 int MemberInsertList = 0;
		 int result = pdao.insertPrjOne(sst, vo);
		
		 //int memberInsertList = pdao.insertAllMember(sst, vo);

		 //return result * memberInsertList;
		 return result;
	}

	//프로젝트 디테일
	public ProjectVo selectOne(ProjectVo vo) {
		
		//프로젝트 select
		ProjectVo selectPrj = pdao.selectOne(sst, vo);
		
		//멤버s select
		List<ProjectVo> memvo = pdao.selectMembers(sst, vo);
		
		return vo;
		
	}



}