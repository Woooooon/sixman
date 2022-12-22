package com.kh.sixman.project.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return pdao.insertPrjOne(sst, vo);
	}

}
