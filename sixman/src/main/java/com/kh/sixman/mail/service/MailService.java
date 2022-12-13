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
import com.kh.sixman.notice.vo.NoticeVo;

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
		
		String no = vo.getNo();
		List<AttachmentVo> fileList = vo.getFileList();
		int result3 = 0;
		if(fileList!=null) {
			for(AttachmentVo fv : fileList) {
				fv.setSubNo(no);
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("list", fileList);
			map.put("tableName","MAIL");
			
			result2 = fDao.uploalAll(sst, map);
		}
		
		return result1 * result2 * result3;
	}

	public int countList(Map<String, String> map) {
		return dao.countList(sst, map);
	}

	public List<NoticeVo> selectList(Map<String, String> map, RowBounds rb) {
		return dao.selectList(sst, map, rb);
	}

	public MailVo selectOne(String no) {
		
		MailVo vo = dao.selectOne(sst, no);
		
		if(vo==null) return null;
		
		Map<String, String> map = new HashMap<>();
		map.put("no", no);
		map.put("tableName","MAIL");
		
		List<AttachmentVo> fileList = fDao.selectFileList(sst, map);
		vo.setFileList(fileList);
		
		return vo;
	}

}
