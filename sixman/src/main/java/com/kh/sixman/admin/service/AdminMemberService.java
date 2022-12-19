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
		
		Map<String,Object> picFileUpload = dbUploadFile(vo.getPicFileInfo(), no, "PROFILE");
		Map<String,Object> resumeFileUpload = dbUploadFile(vo.getResumeFileInfo(), no, "RESUME");
		Map<String,Object> accountFileUpload = dbUploadFile(vo.getAccountFileInfo(), no, "ACCOUNT");
		Map<String,Object> evidenceFileUpload = dbUploadFile(vo.getEvidenceFileList(), no, "EVIDENCE");
		
		int picFileUploadResult = adminMemberDao.uploadAll(sst, picFileUpload);
		int resumeFileUploadResult = adminMemberDao.uploadAll(sst, resumeFileUpload);
		int accountFileUploadResult = adminMemberDao.uploadAll(sst, accountFileUpload);
		int evidenceFileUploadResult = adminMemberDao.uploadAll(sst, evidenceFileUpload);
		
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
