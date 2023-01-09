package com.kh.sixman.document.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.sixman.document.vo.DocumentVo;

@Service
public interface DocumentBoardService {

	// 게시물 조회
	public DocumentVo detail(int no) throws Exception;
	
	// 게시물 수정
	public void modify(DocumentVo dvo) throws Exception;
	
}
