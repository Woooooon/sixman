package com.kh.sixman.company.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.company.dao.CompanyDao;
import com.kh.sixman.company.vo.CompanyVo;

@Service
public class CompanyService {
	@Autowired
	private CompanyDao companyDao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Transactional
	public int updateCompanyInfo(CompanyVo vo) {
		
		int insertCompany = companyDao.updateCompanyInfo(sst, vo);
		
		String no = companyDao.getNo(sst, vo);
		
		AttachmentVo logoFile = vo.getLogoFile();
		
		int logoFileResult = 1;
		int updateThumb = 0;
		
		if(logoFile != null) {
			String fileNo = companyDao.getFileNo(sst);
			updateThumb = companyDao.updateThumb(sst, fileNo);
		}
		
		if(updateThumb != 0) {
			logoFile.setSubNo(no);
			logoFileResult = companyDao.upload(sst, logoFile);
		}
		
		return insertCompany * logoFileResult;
	}

	
	public CompanyVo getCompany(CompanyVo vo) {
		return companyDao.getCompany(sst,vo);
	}

}
