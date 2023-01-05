package com.kh.sixman.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.member.vo.MemberVo;
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
	public ProjectVo selectOnePrj(SqlSessionTemplate sst, String no) {
		return sst.selectOne("projectMapper.selectOne", no);
	}

	//프로젝트 번호 받아오기
	public String getno(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectOne("projectMapper.selectPrjNo", vo);
	}

	//프로젝트 멤버 insert
	public int insertAllMember(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.insert("projectMapper.insertPrjMember", vo);
	}

	//프로젝트 디테일 멤버 셀렉트
	public List<ProjectVo> selectMembers(SqlSessionTemplate sst, String no) {
		return sst.selectList("projectMapper.selectMembers", no);
		
	}

	//프로젝트 멤버 읽어오기
	public List<MemberVo> selectMemberList(SqlSessionTemplate sst) {
		return sst.selectList("projectMapper.selectMemberList");
	}

	//프로젝트 생성 멤버 읽어오기
	public List<MemberVo> selectMembersubList(SqlSessionTemplate sst, String no) {
		return sst.selectList("projectMapper.selectsubMemberList", no);
	}

	//프로젝트 디테일 멤버 조회
	public List<MemberVo> selectPrjMember(SqlSessionTemplate sst, String no) {
		return sst.selectList("projectMapper.selectPrjMember", no);
	}

	//프로젝트 디테일 상태 변경
	public int updatePrj(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.update("projectMapper.updatePrj", vo);
	}

}
