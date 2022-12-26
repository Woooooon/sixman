package com.kh.sixman.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.common.AuthorizeVo;
import com.kh.sixman.common.BankVo;
import com.kh.sixman.dept.vo.DeptVo;
import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.position.vo.PositionVo;

@Repository
public class AdminMemberDao {

	public List<BankVo> bankList(SqlSessionTemplate sst) {
		
		return sst.selectList("memberMapper.bankList");
	}

	public List<AuthorizeVo> authorizeList(SqlSessionTemplate sst) {
		
		return sst.selectList("memberMapper.authorizeList");
	}

	public int join(SqlSessionTemplate sst, MemberVo vo) {
		return sst.insert("memberMapper.join", vo);
	}

	public String getMemberNo(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("memberMapper.getNo", vo);
	}
	
	public int uploadAll(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.insert("memberMapper.insertAllFile", map);
	}

	public int updateMember(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("memberMapper.updateMember", vo);
	}

	public int deleteAll(SqlSessionTemplate sst, List<String> no) {
		return sst.update("memberMapper.deleteMemberAll", no);
	}

	public MemberVo selectOne(SqlSessionTemplate sst, String no) {
		return sst.selectOne("memberMapper.selectOne", no);
	}

	public List<AttachmentVo> getfile(SqlSessionTemplate sst, String no, String tableName) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("no", no);
		map.put("tableName", tableName);
		return sst.selectList("memberMapper.getFile",map);
	}

	public AttachmentVo getFile(Map<String, String> map) {
		return null;
	}

	public int delete(Map<String, String> map) {
		return 0;
	}

}
