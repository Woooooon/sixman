package com.kh.sixman.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.member.vo.MemberVo;

@Repository
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

	public List<MemberVo> selectMemberList(SqlSessionTemplate sst, RowBounds rb) {
		return sst.selectList("memberMapper.selectMemberList",null, rb);
	}

	public List<MemberVo> selectNewbieList(SqlSessionTemplate sst) {
		
		return sst.selectList("memberMapper.selectNewbieList");
	}

	public int countList(SqlSessionTemplate sst) {
		return sst.selectOne("memberMapper.countList");
	}

}
