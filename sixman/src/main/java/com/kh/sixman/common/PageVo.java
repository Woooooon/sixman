package com.kh.sixman.common;

import lombok.Data;

@Data
public class PageVo {

    public PageVo(int listCount, int currentPage, int pageLimit, int boardLimit) {
        super();
        this.maxPage = (int)Math.ceil((double)listCount / boardLimit);
        this.startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
        this.endPage = startPage + pageLimit - 1;
        
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
        this.listCount = listCount;
        this.currentPage = currentPage;
        this.pageLimit = pageLimit;
        this.boardLimit = boardLimit;
       
    }

    private int listCount; // 총 게시글 갯수
    private int currentPage; // 현재 페이지
    private int pageLimit; // 페이징 바 최대갯수
    private int boardLimit; // 게시글 최대갯수

    private int maxPage; // 가장 마지막 페이지
    private int startPage; // 페이징바 시작 페이지
    private int endPage; // 페이징바 종료 페이지

}
