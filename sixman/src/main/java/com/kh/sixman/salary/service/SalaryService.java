package com.kh.sixman.salary.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.salary.dao.SalaryDao;
import com.kh.sixman.salary.vo.SalaryVo;

@Service
public class SalaryService {
	
	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	private SalaryDao dao;

	public List<SalaryVo> searchSelectList(SalaryVo vo) {
		return dao.searchSelectList(sst, vo);
	}

	public List<MemberVo> ListMember() {
		return dao.ListMember(sst);
	}

}
