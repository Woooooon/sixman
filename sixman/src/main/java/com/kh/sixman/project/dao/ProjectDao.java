package com.kh.sixman.project.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.project.vo.ProjectVo;
import com.kh.sixman.project.vo.TodoVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
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

	//프로젝트 즐겨찾기 추가
	public int insertFavorite(SqlSessionTemplate sst, String no) {
		return sst.update("projectMapper.insertFavorite", no);
	}

	//프로젝트 즐겨찾기 삭제
	public int deleteFavorite(SqlSessionTemplate sst, String no) {
		return sst.update("projectMapper.deleteFavorite", no);
	}

	//프로젝트 생성할 때 번호 받기
	public ProjectVo selectPrjNo(SqlSessionTemplate sst, ProjectVo vo) {
		return sst.selectOne("projectMapper.selectPrjNo", vo);
	}

	//todo리스트 전체 가져오기
	public List<TodoVo> selectTodolist(SqlSessionTemplate sst, Map<String, String> pmap) {
		log.info("dao map : " + pmap);
		List<TodoVo> x = sst.selectList("projectMapper.selectTodoList", pmap);
		log.info("dao result : " + x);
		return x;
	}

	//todo 추가하기
	public int todoPlus(SqlSessionTemplate sst, TodoVo vo) {
		return sst.insert("projectMapper.todoPlus", vo);
	}

}
