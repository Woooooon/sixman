package com.kh.sixman.temp.approval.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sixman.notice.vo.NoticeVo;
import com.kh.sixman.temp.approval.dao.ApprovalDao;
import com.kh.sixman.temp.approval.vo.ApprovalDocumentVo;
import com.kh.sixman.temp.approval.vo.ApprovalVo;

@Service
public class ApprovalService {
	
	@Autowired
	private ApprovalDao approvalDao;
	
	@Autowired
	private SqlSessionTemplate sst;

	public int createLine(Map<String, Object> map) {
		return approvalDao.createLine(sst, map);
	}

	public Map<String, List<ApprovalVo>> getLineList(String no) {
		
		Map<String, List<ApprovalVo>> map = new HashMap<>();
		List<String> noList = approvalDao.getLineNo(sst, no);
		for(String aNo : noList) {
			List<ApprovalVo> temp = approvalDao.getLineList(sst, aNo);
			map.put(aNo, temp);
		}

		return map;
	}

	public int write(ApprovalDocumentVo vo) {
		return approvalDao.write(sst, vo);
	}

	public List<ApprovalDocumentVo> selectList(String no, RowBounds rb) {
		List<ApprovalDocumentVo> list = approvalDao.selectList(sst, no, rb);
		for(ApprovalDocumentVo vo : list) {
			List<ApprovalVo> temp = approvalDao.getLineFromDocument(sst, vo.getNo());
			vo.setLine(temp);
		}
		return list;
	}

	public int selectCount(String no) {
		return approvalDao.countDocument(sst, no);
	}

	public ApprovalDocumentVo getDocument(String no) {
		ApprovalDocumentVo vo = approvalDao.selectOne(sst, no);
		
		if(vo==null) return null;
		List<ApprovalVo> temp = approvalDao.getLineFromDocument(sst, vo.getNo());
		vo.setLine(temp);
		
		return vo;
	}

	public int check(Map<String, String> map) {
		return approvalDao.check(sst, map);
	}

}
