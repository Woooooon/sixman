package com.kh.sixman.notice.service;

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
import com.kh.sixman.notice.dao.NoticeDao;
import com.kh.sixman.notice.vo.NoticeVo;

@Service
public class NoticeService {
	
	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	private NoticeDao dao;
	@Autowired
	private FileDao fDao;

	public int countList(String keyword) {
		return dao.countList(sst, keyword);
	}

	public List<NoticeVo> selectList(String keyword, RowBounds rb) {
		return dao.selectList(sst, keyword, rb);
	}

	@Transactional
	public int write(NoticeVo vo) {
		
		int result1 = dao.write(sst, vo);
		String no = dao.getNoticeNo(sst, vo);

		List<AttachmentVo> fileList = vo.getFileList();
		int result2 = 1;
		if(fileList!=null) {
			for(AttachmentVo fv : fileList) {
				fv.setSubNo(no);
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("list", fileList);
			map.put("tableName","NOTICE");
			
			result2 = fDao.uploadAll(sst, map);
		}
		
		return result1 * result2;
	}

	public NoticeVo selectOne(String no) {
		
		NoticeVo vo = dao.selectOne(sst, no);
		
		if(vo==null) return null;
		
		Map<String, String> map = new HashMap<>();
		map.put("no", no);
		map.put("tableName","NOTICE");
		
		List<AttachmentVo> fileList = fDao.selectFileList(sst, map);
		vo.setFileList(fileList);
		
		return vo;
	}

	public int delete(String no) {
		return dao.delete(sst, no);
	}

	@Transactional
	public int update(NoticeVo vo) {
		
		int result1 = dao.update(sst, vo);
		
		String no = vo.getNo();
		
		List<AttachmentVo> fileList = vo.getFileList();
		int result2 = 0;
		if(fileList!=null) {
			for(AttachmentVo fv : fileList) {
				System.out.println(1);
				fv.setSubNo(no);
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("list", fileList);
			map.put("tableName","NOTICE");
			
			result2 = fDao.uploadAll(sst, map);
		}
		
		return result1 * result2;
	}

	
	
	
}
