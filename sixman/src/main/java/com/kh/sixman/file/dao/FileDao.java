package com.kh.sixman.file.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.common.AttachmentVo;

@Repository
public class FileDao {

	public int uploalAll(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.insert("fileMapper.insertAll", map);
	}

	public List<AttachmentVo> selectFileList(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("fileMapper.selectFileList", map);
	}

	public AttachmentVo getFile(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("fileMapper.getFile", map);
	}

	public int delete(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.delete("fileMapper.deleteFile", map);
	}

}
