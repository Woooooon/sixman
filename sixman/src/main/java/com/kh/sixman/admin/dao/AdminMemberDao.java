package com.kh.sixman.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.member.vo.AuthorizeVo;
import com.kh.sixman.member.vo.BankVo;

@Repository
public class AdminMemberDao {

	public List<BankVo> bankList(SqlSessionTemplate sst) {
		
		return sst.selectList("memberMapper.bankList");
	}

	public List<AuthorizeVo> authorizeList(SqlSessionTemplate sst) {
		
		return sst.selectList("memberMapper.authorizeList");
	}

}
