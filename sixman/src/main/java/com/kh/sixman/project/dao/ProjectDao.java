package com.kh.sixman.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.project.vo.ProjectVo;

@Repository
public class ProjectDao {

	//프로젝트 전체 확인
	public List<ProjectVo> selectPrjList(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectList("projectMapper.selectList", vo);
	}

	//프로젝트 생성
	public int insertPrjOne(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.insert("projectMapper.insertOne", vo);
	}

}
