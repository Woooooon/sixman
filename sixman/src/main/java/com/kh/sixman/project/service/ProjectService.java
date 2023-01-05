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
		 //프로젝트 디비에 저장
		 int result = pdao.insertPrjOne(sst, vo);
		
		 //디비에 저장한 프로젝트 읽어오기
		 
		 //프로젝트에 저장된 멤버 들 저장
		 int memberInsertList = pdao.insertAllMember(sst, vo);

		 return result * memberInsertList;
		 //return result;
	}

	//프로젝트 디테일
	public ProjectVo selectOnePrj(String no) {
		//프로젝트 select
		return pdao.selectOnePrj(sst, no);
		
	}

	//프로젝트 멤버 읽어오기
	public List<MemberVo> selectMemberList() {
		return pdao.selectMemberList(sst);
	}

	//프로젝트 생성에서 멤버 가져오기
	public List<MemberVo> selectMemberList(String no) {
		return pdao.selectMembersubList(sst, no);
	}

	public List<MemberVo> selectPrjMember(String no) {
		return pdao.selectPrjMember(sst, no);
	}

	public int updatePrj(ProjectVo vo) {
		return pdao.updatePrj(sst, vo);
	}



}
