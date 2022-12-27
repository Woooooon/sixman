package com.kh.sixman.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.project.vo.ProjectVo;

@Repository
public class ProjectDao {

	//프로젝트 전체 확인
	public List<ProjectVo> selectPrjList(SqlSessionTemplate sst, int no) {
		return sst.selectList("projectMapper.selectList" , no);
	}

	//프로젝트 생성
	public int insertPrjOne(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.insert("projectMapper.insertOne", vo);
	}

	//프로젝트 상세보기
	public ProjectVo selectOne(SqlSessionTemplate sst, ProjectVo pvo) {
		return sst.selectOne("projectMapper.selectOne", pvo);
	}

	//프로젝트 번호 받아오기
	public String getno(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectOne("projectMapper.selectPrjNo", vo);
	}

	//프로젝트 멤버 인설트 (
	public int insertAllMember(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.insert("projectMapper.insertPrjMember", vo);
	}

}
