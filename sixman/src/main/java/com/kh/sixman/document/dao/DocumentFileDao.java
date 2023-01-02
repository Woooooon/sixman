package com.kh.sixman.document.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.common.AttachmentVo;

@Repository
public class DocumentFileDao {

	public int uploadAll(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.insert("docufileMapper.insertAll",map);
	}

	public List<AttachmentVo> selectFileList(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("docufileMapper.selectFileList", map);
	}

}
