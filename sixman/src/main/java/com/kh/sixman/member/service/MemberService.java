package com.kh.sixman.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
		
		String no = dbMember.getNo();
		
		List<AttachmentVo> fileInfo = memberDao.selectFileOne(sst, no);
		vo.setPicFileInfo(fileInfo);
		
		return dbMember;
	}


	public int updatePwd(String no, String pwd) {
		String newPwd = enc.encode(pwd);
		
		Map<String, String> map = new HashMap<>();
		map.put("no", no);
		map.put("pwd", newPwd);
		
		return memberDao.updatePwd(sst, map);
	}


	public List<MemberVo> selectMemberList(RowBounds rb, Map<String, String> search) {
		
		return memberDao.selectMemberList(sst, search, rb);
	}


	public List<MemberVo> selectNewbieList() {
		
		return memberDao.selectNewbieList(sst);
	}


	public int countList(Map<String, String> search) {
		return memberDao.countList(sst, search);
	}


	public List<MemberVo> selectMemberListAll() {
		
		return memberDao.selectMemberListAll(sst);
	}


	

}
