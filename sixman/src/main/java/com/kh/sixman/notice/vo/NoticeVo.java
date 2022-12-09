package com.kh.sixman.notice.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.sixman.common.AttachmentVo;

import lombok.Data;

@Data
public class NoticeVo {

	private String title;
	private String content;
	private String enrollDate;
	private String deleteYn;
	private String inportantYn;
	private String view;
	private String userNo;
	private String name;
	private List<MultipartFile> file;
	private List<AttachmentVo> fileList;
	
}
