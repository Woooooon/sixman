package com.kh.sixman.document.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DocumentFileDao {

	public int uploadAll(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.insert("docufileMapper.insertAll",map);
	}

}
