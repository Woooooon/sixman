package com.kh.sixman.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sixman.admin.dao.AdminMemberDao;
import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.file.dao.FileDao;
import com.kh.sixman.member.vo.AuthorizeVo;
import com.kh.sixman.member.vo.BankVo;
import com.kh.sixman.member.vo.MemberVo;

@Service
public class AdminMemberService {
	
	@Autowired
	private AdminMemberDao adminMemberDao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	@Autowired 
	private BCryptPasswordEncoder enc;
	
	
	public List<BankVo> bankList() {
		
		return adminMemberDao.bankList(sst);
	}

	public List<AuthorizeVo> authorizeList() {
		
		return adminMemberDao.authorizeList(sst);
	}
	
	@Transactional
	public int join(MemberVo vo) {
		String newPwd = enc.encode(vo.getPwd());
		vo.setPwd(newPwd);
		
		int join = adminMemberDao.join(sst, vo);
		String no = adminMemberDao.getMemberNo(sst, vo);
		
		List<AttachmentVo> picFile = vo.getPicFileInfo();
		List<AttachmentVo> resumeFile = vo.getResumeFileInfo();
		List<AttachmentVo> accountFile = vo.getAccountFileInfo();
		List<AttachmentVo> evidenceFile = vo.getEvidenceFileList();
		
		int picFileUploadResult = 1;
		int resumeFileUploadResult = 1;
		int accountFileUploadResult = 1;
		int evidenceFileUploadResult = 1;
		
		if(picFile != null) {
			Map<String,Object> picFileUpload = dbUploadFile(picFile, no, "PROFILE");
			picFileUploadResult = adminMemberDao.uploadAll(sst, picFileUpload);
		}
		
		if(resumeFile != null) {
			Map<String,Object> resumeFileUpload = dbUploadFile(resumeFile, no, "RESUME");
			resumeFileUploadResult = adminMemberDao.uploadAll(sst, resumeFileUpload);
		}
		
		if(accountFile != null) {
			Map<String,Object> accountFileUpload = dbUploadFile(accountFile, no, "ACCOUNT");
			accountFileUploadResult = adminMemberDao.uploadAll(sst, accountFileUpload);
		}
		
		if(evidenceFile != null) {
			Map<String,Object> evidenceFileUpload = dbUploadFile(evidenceFile, no, "EVIDENCE");
			evidenceFileUploadResult = adminMemberDao.uploadAll(sst, evidenceFileUpload);
		}
		
		return join * picFileUploadResult * resumeFileUploadResult * accountFileUploadResult * evidenceFileUploadResult;
	}
	
	private Map<String,Object> dbUploadFile(List<AttachmentVo> fileInfo, String no, String tableName) {
		List<AttachmentVo> fileList = fileInfo;
		Map<String, Object> map = null;
		if(fileList!=null) {
			for(AttachmentVo fv : fileList) {
				fv.setSubNo(no);
			}
			map = new HashMap<>();
			map.put("list", fileList);
			map.put("tableName", tableName);
		}
		
		return map;
	}
	
}
