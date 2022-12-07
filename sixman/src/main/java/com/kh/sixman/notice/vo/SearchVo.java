package com.kh.sixman.notice.vo;

import lombok.Data;

@Data
public class SearchVo {
	private String loginMember;
	private String keyword;
	private int page;
	private String filter;
	private String listType;
}
