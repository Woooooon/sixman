package com.kh.sixman.document.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.sixman.document.dao.DocumentBoardDao;
import com.kh.sixman.document.vo.DocumentVo;

@Service
public class DocumentBoardServiceImpl implements DocumentBoardService {

	@Inject
	private DocumentBoardDao bdao;
	
	// 게시물 조회
	@Override
	public DocumentVo detail(int no) throws Exception {

	 return bdao.detail(no);
	}

	
	// 게시물 수정
	@Override
	public void modify(DocumentVo dvo) throws Exception {
	  
	 bdao.modify(dvo);
	}
	
	
}
