package com.kh.sixman.admin.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.common.AuthorizeVo;
import com.kh.sixman.common.BankVo;
import com.kh.sixman.dept.vo.DeptVo;
import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.position.vo.PositionVo;

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

}
