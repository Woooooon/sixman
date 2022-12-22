package com.kh.sixman.admin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.admin.vo.DeptVo;
import com.kh.sixman.admin.vo.PositionVo;
import com.kh.sixman.member.vo.AuthorizeVo;
import com.kh.sixman.member.vo.BankVo;
import com.kh.sixman.member.vo.MemberVo;

@Repository
public class AdminMemberDao {

	public List<BankVo> bankList(SqlSessionTemplate sst) {
		
		return sst.selectList("memberMapper.bankList");
	}

	public List<AuthorizeVo> authorizeList(SqlSessionTemplate sst) {
		
		return sst.selectList("memberMapper.authorizeList");
	}

	public int join(SqlSessionTemplate sst, MemberVo vo) {
		return sst.insert("memberMapper.join", vo);
	}

	public String getMemberNo(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("memberMapper.getNo", vo);
	}
	
	public int uploadAll(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.insert("memberMapper.insertAllFile", map);
	}

	public List<PositionVo> positionList(SqlSessionTemplate sst) {
		return sst.selectList("memberMapper.positionList");
	}

	public List<DeptVo> daptList(SqlSessionTemplate sst) {
		return sst.selectList("memberMapper.deptList");
	}
}
