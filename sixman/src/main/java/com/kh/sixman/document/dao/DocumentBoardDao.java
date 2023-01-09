package com.kh.sixman.document.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.sixman.document.vo.DocumentVo;

@Repository
public interface DocumentBoardDao {
	
	public DocumentVo detail(int no) throws Exception;
	
	// 게시물 수정
	public void modify(DocumentVo dvo) throws Exception;

}
