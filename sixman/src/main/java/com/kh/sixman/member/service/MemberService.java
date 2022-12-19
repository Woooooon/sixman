package com.kh.sixman.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.member.dao.MemberDao;
import com.kh.sixman.member.vo.MemberVo;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired 
	private BCryptPasswordEncoder enc;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	
	public MemberVo login(MemberVo vo) {
		MemberVo dbMember = memberDao.selelctOneMember(vo, sst);
		
		String inputPwd = vo.getPwd();
		String dbPwd = dbMember.getPwd();
		
		boolean isMatch = enc.matches(inputPwd, dbPwd);
		
		if(!isMatch) {
			return null;
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("no", dbMember.getNo());
		map.put("tableName","PROFILE");
		
		List<AttachmentVo> fileInfo = memberDao.selectFileOne(sst, map);
		vo.setPicFileInfo(fileInfo);
		
		return dbMember;
	}

}
