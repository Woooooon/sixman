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
	public List<ProjectVo> selectList(ProjectVo vo) {
		
		return pdao.selectPrjList(sst, vo);
		
	}

	//프로젝트 생성
	public int insertPrjOne(ProjectVo vo) {
		
		 int MemberInsertList = 0;
		 //프로젝트 정보 insert
		 int result = pdao.insertPrjOne(sst, vo);
		 //insert한 프로젝트 No 가져오기
		 pdao.selectOne(sst, vo);
		 //prj No정보 가져와서 ProjectMember 테이블에 Member 넣기
		 int memberInsertList = pdao.insertMemberList(sst, vo);


		 return result * memberInsertList;
	}





}
