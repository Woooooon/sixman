package com.kh.sixman.temp.approval.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.temp.approval.vo.ApprovalDocumentVo;
import com.kh.sixman.temp.approval.vo.ApprovalVo;

@Repository
public class ApprovalDao {

	public int createLine(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.update("approvalMapper.createLine", map);
	}

	public List<ApprovalVo> getLineList(SqlSessionTemplate sst, String no) {
		return sst.selectList("approvalMapper.getLineList", no);
	}
	
	public List<String> getLineNo(SqlSessionTemplate sst, String no) {
		return sst.selectList("approvalMapper.getLineNo", no);
	}

	public int write(SqlSessionTemplate sst, ApprovalDocumentVo vo) {
		return sst.update("approvalMapper.write", vo);
	}

	public List<ApprovalDocumentVo> selectList(SqlSessionTemplate sst, String no, RowBounds rb) {
		return sst.selectList("approvalMapper.selectDocument", no, rb);
	}

	public List<ApprovalVo> getLineFromDocument(SqlSessionTemplate sst, String no) {
		return sst.selectList("approvalMapper.getLineFromDocument", no);
	}

	public int countDocument(SqlSessionTemplate sst, String no) {
		return sst.selectOne("approvalMapper.countDocument", no);
	}

	public ApprovalDocumentVo selectOne(SqlSessionTemplate sst, String no) {
		return sst.selectOne("approvalMapper.selectOne", no);
	}

	public int check(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.update("approvalMapper.check", map);
	}

}
