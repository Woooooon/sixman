package com.kh.sixman.messenger.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ChatAVo {

	private int profileNo;
	private int chatNum;
	private String originName;
	private String changeName;
	private String filePath;
	private Date enrollDate;
}
