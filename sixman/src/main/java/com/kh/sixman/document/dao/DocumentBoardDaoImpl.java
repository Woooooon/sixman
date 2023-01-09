package com.kh.sixman.document.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.document.vo.DocumentVo;

@Repository
public class DocumentBoardDaoImpl implements DocumentBoardDao {

	private static String namespace="documentMapper";
	
	@Inject
	private SqlSession sql;

	// 게시물 조회
	public DocumentVo detail(int no) throws Exception {
	 
	 return sql.selectOne(namespace +".detail", no);
	}

	// 게시물 수정
	@Override
	public void modify(DocumentVo dvo) throws Exception {
	 sql.update(namespace + ".modify", dvo);
	}
	
	
	




	

	
	
}
