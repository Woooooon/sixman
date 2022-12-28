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
import com.kh.sixman.common.AuthorizeVo;
import com.kh.sixman.common.BankVo;
import com.kh.sixman.common.FileUnit;
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

	public int updateMember(MemberVo vo) {
		
		return adminMemberDao.updateMember(sst, vo);
	}

	public int deleteAll(List<String> no) {
		
		return adminMemberDao.deleteAll(sst, no);
	}

	public MemberVo selectOne(String no) {
		MemberVo selectMember = adminMemberDao.selectOne(sst, no);
		
		List<AttachmentVo> resumeFile = adminMemberDao.getFile(sst, no,"RESUME");
		List<AttachmentVo> accountFile = adminMemberDao.getFile(sst, no,"ACCOUNT");
		List<AttachmentVo> evidenceFile = adminMemberDao.getFile(sst, no,"EVIDENCE");
		
		selectMember.setResumeFileInfo(resumeFile);
		selectMember.setAccountFileInfo(accountFile);
		selectMember.setEvidenceFileList(evidenceFile);
		
		return selectMember;
	}

	@Transactional
	public int updateMemberDetail(MemberVo vo
								  , String profileNo
								  , String accountNo
								  , String resumeNo,
							  	  List<String> evidenceNo) {
		
		String no = vo.getNo();
		AttachmentVo attVo = null;
		int fileResult = 1;
		
		if(profileNo != null) {
			attVo = adminMemberDao.getFileOne(sst, no,"PROFILE");
			fileResult = adminMemberDao.delete(sst, attVo.getNo(),"PROFILE");
			
			if(fileResult == 1) {
				FileUnit.deleteFile(attVo.getFilePath()+attVo.getChangeName());
			}
			
		}
		
		if(accountNo != null) {
			attVo = adminMemberDao.getFileOne(sst, no,"ACCOUNT");
			fileResult = adminMemberDao.delete(sst, attVo.getNo(),"ACCOUNT");
			
			if(fileResult == 1) {
				FileUnit.deleteFile(attVo.getFilePath()+attVo.getChangeName());
			}
			
		}
		
		if(resumeNo != null) {
			attVo = adminMemberDao.getFileOne(sst, no, "RESUME");
			fileResult = adminMemberDao.delete(sst, attVo.getNo(),"RESUME");
			
			if(fileResult == 1) {
				FileUnit.deleteFile(attVo.getFilePath()+attVo.getChangeName());
			}
			
		}
		
		if(evidenceNo != null) {
			List<AttachmentVo> attList = adminMemberDao.getFile(sst, no,"EVIDENCE");
			for(AttachmentVo attvo : attList) {
				fileResult = adminMemberDao.delete(sst, attvo.getNo(),"EVIDENCE");
				if(fileResult == 1) {
					FileUnit.deleteFile(attvo.getFilePath()+attvo.getChangeName());
				}
			}
		}
		
		List<AttachmentVo> picFile = vo.getPicFileInfo();
		List<AttachmentVo> resumeFile = vo.getResumeFileInfo();
		List<AttachmentVo> accountFile = vo.getAccountFileInfo();
		List<AttachmentVo> evidenceFile = vo.getEvidenceFileList();
		
		int uploadFile = 1;
		
		if(picFile != null) {
			Map<String,Object> picFileUpload = dbUploadFile(picFile, no, "PROFILE");
			uploadFile = adminMemberDao.uploadAll(sst, picFileUpload);
		}
		
		if(resumeFile != null) {
			Map<String,Object> resumeFileUpload = dbUploadFile(resumeFile, no, "RESUME");
			uploadFile = adminMemberDao.uploadAll(sst, resumeFileUpload);
		}
		
		if(accountFile != null) {
			Map<String,Object> accountFileUpload = dbUploadFile(accountFile, no, "ACCOUNT");
			uploadFile = adminMemberDao.uploadAll(sst, accountFileUpload);
		}
		
		if(evidenceFile != null) {
			Map<String,Object> evidenceFileUpload = dbUploadFile(evidenceFile, no, "EVIDENCE");
			uploadFile = adminMemberDao.uploadAll(sst, evidenceFileUpload);
		}
		
		int result = adminMemberDao.updateMemberDetail(sst, vo);
				
		return result * uploadFile * fileResult;
	}

	


	
}
