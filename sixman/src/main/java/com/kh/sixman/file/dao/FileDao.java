package com.kh.sixman.file.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.common.AttachmentVo;

@Repository
public class FileDao {

	public int uploalAll(SqlSessionTemplate sst, List<AttachmentVo> fileList) {
		return sst.insert("fileMapper.insertAll", fileList);
	}

	public List<AttachmentVo> selectFileList(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("fileMapper.selectFileList", map);
	}

}
