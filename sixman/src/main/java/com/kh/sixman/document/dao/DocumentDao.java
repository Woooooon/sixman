package com.kh.sixman.document.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.document.vo.DocumentVo;

@Repository
public class DocumentDao {

	public int write(SqlSessionTemplate sst, DocumentVo dvo) {
		
		return sst.insert("boardMapper.write",dvo);
	}

}
