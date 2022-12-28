package com.kh.sixman.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.member.vo.MemberVo;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberDao {

	public MemberVo selelctOneMember(MemberVo vo, SqlSessionTemplate sst) {
		return sst.selectOne("memberMapper.login", vo);
	}

	public List<AttachmentVo> selectFileOne(SqlSessionTemplate sst, String no) {
		return sst.selectList("memberMapper.selectFileOne", no);
	}

	public int updatePwd(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.update("memberMapper.updatePwd", map);
	}

	public List<MemberVo> selectMemberList(SqlSessionTemplate sst, Map<String, String> search, RowBounds rb) {
		List<MemberVo> test = sst.selectList("memberMapper.selectMemberList",search, rb);
		log.info("search :" + search );
		log.info("list :" + test );	
		return test;
	}

	public List<MemberVo> selectNewbieList(SqlSessionTemplate sst) {
		
		return sst.selectList("memberMapper.selectNewbieList");
	}

	public int countList(SqlSessionTemplate sst, Map<String, String> search) {
		return sst.selectOne("memberMapper.countList", search);
	}

	public List<MemberVo> selectMemberListAll(SqlSessionTemplate sst) {

		return sst.selectList("memberMapper.selectMemberList");
				
	}

	public List<MemberVo> selectdeptMemberList(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("memberMapper.selectMemberList", map);
	}

	

}
