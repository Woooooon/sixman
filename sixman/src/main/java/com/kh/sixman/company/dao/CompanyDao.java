package com.kh.sixman.company.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.company.vo.CompanyVo;

@Repository
public class CompanyDao {

	public int updateCompanyInfo(SqlSessionTemplate sst, CompanyVo vo) {
		return sst.insert("companyMapper.updateCompany", vo);
	}

	public String getNo(SqlSessionTemplate sst, CompanyVo vo) {
		return sst.selectOne("companyMapper.getNo", vo);
	}

	public int upload(SqlSessionTemplate sst, AttachmentVo vo) {
		return sst.insert("companyMapper.insertFile", vo);
	}

	public CompanyVo getCompany(SqlSessionTemplate sst, CompanyVo vo) {
		return sst.selectOne("companyMapper.getCompany", vo);
	}

	public String getFileNo(SqlSessionTemplate sst) {
		return sst.selectOne("companyMapper.getFileNo");
	}

	public int updateThumb(SqlSessionTemplate sst, Object fileNo) {
		return sst.update("companyMapper.updateThumb", fileNo);
	}

}
