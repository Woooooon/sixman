package com.kh.sixman.mail.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.file.dao.FileDao;
import com.kh.sixman.mail.dao.MailDao;
import com.kh.sixman.mail.vo.MailVo;

@Service
public class MailService {

	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	private MailDao dao;
	@Autowired
	private FileDao fDao;

	@Transactional
	public int write(MailVo vo) {
		
		int result1 = dao.write(sst, vo);
		int result2 = dao.send(sst, vo);
		
		String no = vo.getMailNo();
		List<AttachmentVo> fileList = vo.getFileList();
		int result3 = 1;
		if(fileList!=null) {
			for(AttachmentVo fv : fileList) {
				fv.setSubNo(no);
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("list", fileList);
			map.put("tableName","MAIL");
			
			result3 = fDao.uploadAll(sst, map);
		}
		
		return result1 * result2 * result3;
	}

	public int countList(MailVo vo) {
		return dao.countList(sst, vo);
	}

	public List<MailVo> selectList(MailVo vo, RowBounds rb) {
		return dao.selectList(sst, vo, rb);
	}

	public MailVo selectOne(String no) {
		
		MailVo vo = dao.selectOne(sst, no);
		
		if(vo==null) return null;
		
		Map<String, String> map = new HashMap<>();
		map.put("no", no);
		map.put("tableName","MAIL");
		
		List<AttachmentVo> fileList = fDao.selectFileList(sst, map);
		vo.setFileList(fileList);
		
		List<String> sender = dao.getSender(sst, no);
		vo.setSender(sender);
		
		return vo;
	}

	public int delete(Map<String,Object> map) {
		return dao.delete(sst, map);
	}

	public int updateRead(Map<String, Object> map) {
		return dao.updateRead(sst, map);
	}

	public int changeCategory(List<String> no, String category) {
		Map<String, Object> map = new HashMap<>();
		map.put("noList", no);
		map.put("category", category);
		return dao.changeCategory(sst, map);
	}

	public int createCategory(String category, String no) {
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", no);
		map.put("category", category);
		return dao.createCategory(sst, map);
	}

	public List<Map<String, String>> categoryList(String no) {
		return dao.categoryList(sst, no);
	}

	public int restore(Map<String, Object> map) {
		return dao.restore(sst, map);
	}

	public int realDelete(Map<String, Object> map) {
		return dao.realDelete(sst, map);
	}

	public int changeCategory(Map<String, Object> map) {
		return dao.changeCategory(sst, map);
	}

	@Transactional
	public int update(MailVo vo) {
		int result1 = dao.update(sst, vo);
		int result2 = dao.sendUpdate(sst, vo);
				
		String no = vo.getMailNo();
		List<AttachmentVo> fileList = vo.getFileList();
		int result3 = 1;
		if(fileList!=null) {
			for(AttachmentVo fv : fileList) {
				fv.setSubNo(no);
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("list", fileList);
			map.put("tableName","MAIL");
			
			result3 = fDao.uploadAll(sst, map);
		}
		
		return result1 * result2 * result3;
	}

}
