package com.kh.sixman.salary.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.salary.vo.SalaryVo;

@Repository
public class SalaryDao {

	public List<SalaryVo> searchSelectList(SqlSessionTemplate sst, SalaryVo vo) {
		return sst.selectList("salaryMapper.searchSelectList",vo);
	}

	public List<MemberVo> ListMember(SqlSessionTemplate sst) {
		return sst.selectList("salaryMapper.listMember");
	}

}
