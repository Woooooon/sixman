package com.kh.sixman.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.member.vo.MemberVo;

@Repository
public class MemberDao {

	public MemberVo selelctOneMember(MemberVo vo, SqlSessionTemplate sst) {
		return sst.selectOne("memberMapper.login", vo);
	}

	public List<AttachmentVo> selectFileOne(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("memberMapper.selectFileOne", map);
	}

}
