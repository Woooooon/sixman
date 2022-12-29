package com.kh.sixman.document.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.document.vo.DocumentVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class DocumentDao {

	

//	public int send(SqlSessionTemplate sst, DocumentVo dvo) {
//		return sst.update("documentMapper.send",dvo);
//	}

	public int write(SqlSessionTemplate sst, DocumentVo dvo) {
		log.debug("dvo :" + dvo);
		return sst.insert("documentMapper.write",dvo);
	
		
	}


	public String getDocuementNo(SqlSessionTemplate sst, DocumentVo dvo) {
		return sst.selectOne("documentMapper.getNo",dvo);
	}

	public int countList(SqlSessionTemplate sst, String keyword) {
		return sst.selectOne("documentMapper.selectCount",keyword);
	}

}
