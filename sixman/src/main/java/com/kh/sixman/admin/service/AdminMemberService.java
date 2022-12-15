package com.kh.sixman.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.admin.dao.AdminMemberDao;
import com.kh.sixman.member.vo.AuthorizeVo;
import com.kh.sixman.member.vo.BankVo;

@Service
public class AdminMemberService {
	
	@Autowired
	private AdminMemberDao adminMemberDao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<BankVo> bankList() {
		
		return adminMemberDao.bankList(sst);
	}

	public List<AuthorizeVo> authorizeList() {
		
		return adminMemberDao.authorizeList(sst);
	}

}
