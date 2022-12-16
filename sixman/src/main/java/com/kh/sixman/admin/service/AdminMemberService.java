package com.kh.sixman.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	private FileDao fileDao;
	
	public List<BankVo> bankList() {
		
		return adminMemberDao.bankList(sst);
	}

	public List<AuthorizeVo> authorizeList() {
		
		return adminMemberDao.authorizeList(sst);
	}

	public int join(MemberVo vo) {
		int join = adminMemberDao.join(sst, vo);
		String no = adminMemberDao.getMemberNo(sst, vo);
		
		int picFileUploadResult = dbUploadFile(vo.getAccountFileInfo(), no, "PROFILE");
		int resumeFileUploadResult = dbUploadFile(vo.getAccountFileInfo(), no, "RESUME");
		int accountFileUploadResult = dbUploadFile(vo.getAccountFileInfo(), no, "ACCOUNT");
		int evidenceFileUploadResult = dbUploadFile(vo.getAccountFileInfo(), no, "EVIDENCE");
		
		return join * picFileUploadResult * resumeFileUploadResult * accountFileUploadResult * evidenceFileUploadResult;
	}
	
	
	private int dbUploadFile(List<AttachmentVo> fileInfo, String no, String tableName) {
		List<AttachmentVo> fileList = fileInfo;
		int result = 1;
		if(fileList!=null) {
			for(AttachmentVo fv : fileList) {
				fv.setSubNo(no);
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("list", fileList);
			map.put("tableName", tableName);
			
			result = fileDao.uploadAll(sst, map);
		}
		
		return result;
	}
	
}
